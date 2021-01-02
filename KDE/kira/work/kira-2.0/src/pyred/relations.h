/*
Copyright (C) 2017-2020 The Kira Developers (see AUTHORS file)

This file is part of pyRed.

pyRed is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pyRed is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with pyRed.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef PYRED_RELATIONS_H
#define PYRED_RELATIONS_H

#include <algorithm>
#include <cstddef>
#include <functional>
#include <thread> // for performance comparisons in generate() (TODO: remove)
#include <unordered_map>
#include <utility>
#include <vector>

#include "pyred/defs.h"
#include "pyred/gauss.h"
#include "pyred/integrals.h"
#include "pyred/parallel.h"
#include "pyred/parser.h"

// TODO
// * import_ibp(): use argument stacks as coefficients instead of strings.
//     Then use stack_eval() to calculate coefficients
//     to avoid repeated parsing and regex replacements
//     (and with that the necessity for C++14).

namespace pyred {

// Determine the number of IBP and symmetry equations
// from IBP and symmetry seed specifications in one (the same) sector.
std::size_t neqs_from_seed(const std::pair<SeedSpecSector, SeedSpecSector> &);

class MappingPrescription {
public:
  bool m_dotonly;
  uint32_t m_target_topoid;
  uint32_t m_target_sector;
  // [<oldpropnum,[<newpropnum,fac>, ...]>, ...]
  // Ordering is such that earlier elements (<--> oldpropnum)
  // have fewer elements in the linear combination [<newpropnum,fac>, ...].
  // newpropnum runs from 0..np, where D_k, k=0..np-1 denote the propagators
  // of the target topology and D_np=1 for all terms which do not depend on
  // the loop momentum.
  std::vector<
      std::pair<uint32_t, std::vector<std::pair<uint32_t, std::string>>>>
      m_smap;
};

/*********************
 * IntegralRelations *
 *********************/

class IntegralRelations {
  friend class GeneratorHelper;

public:
  IntegralRelations() = default;
  // Import relations from Kira files. Requires Integral::ibpdir().
  IntegralRelations(const std::string &toponame, uint32_t np, uint32_t topoid);
  // methods
  std::vector<ws_equation> sow_ibp_streq(const std::vector<pow_type> &) const;
  std::vector<ws_equation> sow_sym_streq(const std::vector<pow_type> &) const;
  uint32_t topoid() const { return m_topoid; }
  uint32_t np() const { return m_np; }
  uint32_t n_ibps() const { return m_ibps.size(); }
  uint32_t n_syms(uint32_t, const bool = false) const;
  const std::unordered_map<uint32_t, std::vector<MappingPrescription>>
      &symmetries() const {
    return m_symmetries;
  }
  // static methods
  static std::size_t cache_size();
  // static members
  // NOTE
  // Do not use a variable template here to work around a compiler bug
  // (see comment in IntegralRelations::CoeffCache class).
  template <typename Coeff>
  static LockedCache<Coeff, std::string> &cache();
  // static methods
  template <typename Coeff>
  static void merge_cache(const Cache<Coeff, std::string> &ccache);

private:
  // NOTE
  // Workaround for a bug in gcc 5.x and clang 3.7 regarding variable templates.
  //   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67248
  //   https://bugs.llvm.org/show_bug.cgi?id=24473
  // Wrap the coefficient cache for IntegralRelations
  // in the class template CoeffCache and LocalCoeffCache.
  template <typename Coeff>
  wi_equation<Coeff> parse_streq(const ws_equation &,
                                 Cache<Coeff, std::string> &) const;
  template <typename Coeff>
  struct CoeffCache {
    static LockedCache<Coeff, std::string> s_cache;
  };
  // members
  // m_topoid and m_np are initialised from the symmetry files
  // in import_sym(fn).
  uint32_t m_topoid;
  uint32_t m_np;
  std::vector<vs_equation> m_ibps;
  // symmetries and mappings: from_sector --> MappingPrescription
  std::unordered_map<uint32_t, std::vector<MappingPrescription>> m_symmetries;
  // methods
  void import_ibp(const std::string &);
  void import_sym(const std::string &);
};

template <typename Coeff>
LockedCache<Coeff, std::string> IntegralRelations::CoeffCache<Coeff>::s_cache{};

template <typename Coeff>
LockedCache<Coeff, std::string> &IntegralRelations::cache() {
  return CoeffCache<Coeff>::s_cache;
}

template <typename Coeff>
void IntegralRelations::merge_cache(const Cache<Coeff, std::string> &ccache) {
  for (const auto &k_v : ccache.get_unsafe()) {
    cache<Coeff>().insert(k_v.first, k_v.second);
  }
}

template <typename Coeff>
wi_equation<Coeff> IntegralRelations::parse_streq(
    const ws_equation &streq, Cache<Coeff, std::string> &ccache) const {
  // Convert a (weight,string) equation into a (weight,coeff) equation
  // and sort it.
  wi_equation<Coeff> eq;
  eq.reserve(streq.size());
  for (const auto &i_s : streq) {
    auto cf = parse_coeff<Coeff>(i_s.second);
    if (cf) {
      ccache.insert(cf, i_s.second);
      eq.push_back({i_s.first, std::move(cf)});
    }
  }
  std::sort(
      eq.begin(), eq.end(),
      [](const std::pair<weight_type, Coeff> &a,
         const std::pair<weight_type, Coeff> &b) { return a.first > b.first; });
  return eq;
}

/*******************
 * Generator tools *
 *******************/

class GeneratorHelper {
  template <typename Coeff>
  friend class GeneratorParallelMaster;
  template <typename Coeff>
  friend class GeneratorParallelMasterSO;
  template <typename Coeff>
  friend class RetrieveParallelMaster;

public:
  using specmap_t = std::unordered_map<
      std::pair<uint32_t, uint32_t>,            // (topoid,sector)
      std::pair<SeedSpecSector, SeedSpecSector> // (ibp_seedspecs,sym_seedspecs)
      >;
  using gen_sol_bunches_t = std::vector<std::pair<
      std::vector<std::pair<uint32_t, uint32_t>>, // (t,s) to generate 'tg'
      std::vector<std::pair<uint32_t, uint32_t>>  // (t,s) to solve 'tg' is done
      >>;
  template <typename Coeff>
  static SystemOfEqs<Coeff> generate_and_solve(
      const std::vector<SeedSpec> &ibp_seedspec,
      const std::vector<SeedSpec> &ibp_seedcompl,
      const std::vector<SeedSpec> &sym_seedspec, const bool sym_autoseed,
      const int parallel);
  template <typename Coeff>
  static void generate_and_retrieve(
      const std::vector<SeedSpec> &ibp_seedspec,
      const std::vector<SeedSpec> &ibp_seedcompl,
      const std::vector<SeedSpec> &sym_seedspec, const bool sym_autoseed,
      std::vector<intid> &&eqnums,
      const std::function<std::string(const std::string &)> &treatcoeff,
      const std::function<void(eqdata &&)> &treateq, int parallel);

private:
  static std::vector<std::vector<std::pair<uint32_t, uint32_t>>>
  generate_ts_bunches(const specmap_t &);
  static std::pair<gen_sol_bunches_t, std::size_t> GeneratorParallelMaster_init(
      const specmap_t &);
  static specmap_t seedspecs_to_specmap(
      const std::vector<SeedSpec> &ibp_seedspec,
      const std::vector<SeedSpec> &ibp_seedcompl,
      const std::vector<SeedSpec> &sym_seedspec, const bool sym_autoseed);
  template <typename Coeff>
  static std::vector<wi_equation<Coeff>> generate_system(
      const std::pair<SeedSpecSector, SeedSpecSector> &ibp_sym_spec4sect,
      int pos, int tot, int sort_mode, Cache<Coeff, std::string> &ccache);
};

template <typename Coeff>
std::vector<wi_equation<Coeff>> GeneratorHelper::generate_system(
    const std::pair<SeedSpecSector, SeedSpecSector> &ibp_sym_spec4sect, int pos,
    int tot, int sort_mode, Cache<Coeff, std::string> &ccache) {
  const auto &ibp_spec4sect = ibp_sym_spec4sect.first;
  const auto &sym_spec4sect = ibp_sym_spec4sect.second;
  Config::log(2) << "Generate equations for topology "
                 << ibp_spec4sect.m_topo->m_name << ", sector "
                 << ibp_spec4sect.m_sector << " (" << pos << " of " << tot
                 << ")" << std::endl;

  // [johann] Experiment to reduce the number of equations
  std::unordered_map<weight_type, int> vec_ibp_numbers;
  // [/johann]
  std::vector<wi_equation<Coeff>> eqs;
  {
    const auto &relations = ibp_spec4sect.m_topo->relations();
    // First add the basis linear combinations to the system.
    for (const auto &blc_eq : Integral::get_preferred_masters(
             ibp_spec4sect.m_topo->m_id, ibp_spec4sect.m_sector)) {
      ws_equation streq;
      streq.reserve(blc_eq.size());
      for (const auto &i_s : blc_eq) {
        auto w = i_s.first.to_weight();
        if (w) {
          streq.push_back({w, i_s.second});
        }
      }
      auto eq = relations.parse_streq<Coeff>(streq, ccache);
      if (!eq.empty()) {
        eqs.push_back(std::move(eq));
      }
    }
    // IBP equations
    // std::cout << "IBP seed for sector " << ibp_spec4sect.m_sector
    //           << "(" << lines_from_sn(ibp_spec4sect.m_sector) << "):";
    for (const auto &dotsp : ibp_spec4sect.expand()) {
      // std::cout << " " << dotsp.first << "." << dotsp.second;
      for (const auto &seed : Seeds(Integral::np(), ibp_spec4sect.m_sector,
                                    dotsp.first, dotsp.second)) {
        if (Config::johanntrick()) {
          // [johann] Experiment to reduce the number of equations
          std::vector<std::pair<weight_type, int>> ibp2compare;
          int count_ibp = 0;
          for (const auto &streq : relations.sow_ibp_streq(seed)) {
            auto eq = relations.parse_streq<Coeff>(streq, ccache);
            if (!eq.empty()) {
              ibp2compare.push_back({eq.front().first, count_ibp});
              auto igl = pyred::Integral(ibp_spec4sect.m_topo->m_id, seed);
              auto w = igl.to_weight();
              auto map_content = vec_ibp_numbers.find(w);
              if (map_content != vec_ibp_numbers.end()) {
                if (map_content->second == count_ibp) {
                  eqs.push_back(std::move(eq));
                }
              }
              else {
                eqs.push_back(std::move(eq));
              }
              count_ibp++;
            }
          }
          std::sort(ibp2compare.rbegin(), ibp2compare.rend());
          weight_type token_weight = ibp2compare.front().first;
          int token_ibp_number = ibp2compare.front().second;
          for (auto itr : ibp2compare) {
            if (itr.first > token_weight) {
              token_ibp_number = itr.second;
              token_weight = itr.first;
            }
          }
          vec_ibp_numbers.insert({token_weight, token_ibp_number});
          //           for (auto itr: ibp2compare) {
          //             if (itr.first == token_weight) {
          //
          //               vec_ibp_numbers.insert({itr.first, itr.second});
          //             }
          //           }
          // [/johann]
        }
        else {
          for (const auto &streq : relations.sow_ibp_streq(seed)) {
            auto eq = relations.parse_streq<Coeff>(streq, ccache);
            if (!eq.empty()) {
              eqs.push_back(std::move(eq));
            }
          }
        }
      }
    }
    // std::cout << std::endl;
    if (sort_mode == 2) {
      std::stable_sort(eqs.begin(), eqs.end(), cmp_eqn_vec<Coeff>);
    }
  }
  {
    // Symmetry equations
    auto beginpos = eqs.size();
    const auto &relations = sym_spec4sect.m_topo->relations();
    for (const auto &dotsp : sym_spec4sect.expand()) {
      // Treat only sectors for which there is a symmetry.
      if (relations.symmetries().find(sym_spec4sect.m_sector) ==
          relations.symmetries().end()) {
        continue;
      }
      for (const auto &seed : Seeds(Integral::np(), sym_spec4sect.m_sector,
                                    dotsp.first, dotsp.second)) {
        for (const auto &streq : relations.sow_sym_streq(seed)) {
          auto eq = relations.parse_streq<Coeff>(streq, ccache);
          if (!eq.empty()) {
            eqs.push_back(std::move(eq));
          }
        }
      }
    }
    if (sort_mode == 2) {
      std::stable_sort(eqs.begin() + beginpos, eqs.end(), cmp_eqn_vec<Coeff>);
    }
    if (pos == tot) {
      // If this is the last sector to be generated:
      // add external equations (including form factors) to the system.
      if (!Integral::get_external_equations().eqs.empty()) {
        Config::log(2) << "Add external equations" << std::endl;
      }
      for (const auto &ext_eq : Integral::get_external_equations().eqs) {
        ws_equation streq;
        streq.reserve(ext_eq.size());
        for (const auto &i_s : ext_eq) {
          auto w = i_s.first.to_weight();
          if (w) {
            streq.push_back({w, i_s.second});
          }
        }
        auto eq = relations.parse_streq<Coeff>(streq, ccache);
        if (!eq.empty()) {
          eqs.push_back(std::move(eq));
        }
      }
    }
  }
  Integral::clear_cache(0); // auto clear cache
  IntegralRelations::merge_cache<Coeff>(ccache);
  if (sort_mode == 1) {
    std::stable_sort(eqs.begin(), eqs.end(), cmp_eqn_vec<Coeff>);
  }
  return eqs;
}

/***************************************
 * Generator with on-the-fly solver;   *
 * sort the entire system of equations *
 ***************************************/

// A class to provide a callable object with data to act as the master thread
// in the parallel generation and solution of equations.
template <typename Coeff>
class GeneratorParallelMaster {
  friend class GeneratorHelper;

public:
  GeneratorParallelMaster(const GeneratorHelper::specmap_t &);
  void operator()(std::vector<std::pair<SeedSpecSector, SeedSpecSector>> &,
                  std::vector<std::promise<std::vector<wi_equation<Coeff>>>> &,
                  std::mutex &, std::condition_variable &, bool &);

private:
  SystemOfEqs<Coeff> m_sys;
  GeneratorHelper::specmap_t m_ibp_sym_spec_map;
  // first: bunch of (topoid,sector)s to generate equations in;
  // second: (topoid,sector)s to solve when 'first' finished generating.
  GeneratorHelper::gen_sol_bunches_t m_bunches;
};

// The GeneratorParallelMaster constructur sets up the data needed
// by the master thread of the parallel generator/solver.
template <typename Coeff>
GeneratorParallelMaster<Coeff>::GeneratorParallelMaster(
    const GeneratorHelper::specmap_t &specmap)
    : m_ibp_sym_spec_map{specmap} {
  auto bunches_syssz =
      GeneratorHelper::GeneratorParallelMaster_init(m_ibp_sym_spec_map);
  m_bunches = std::move(bunches_syssz.first);
  // Reserve the maximal system size for the on-the-fly solver.
  // This is needed so that the references to equations remain valid
  // when new equations are added to the system while the solver is running.
  m_sys.reserve(bunches_syssz.second);
}

template <typename Coeff>
void GeneratorParallelMaster<Coeff>::operator()(
    std::vector<std::pair<SeedSpecSector, SeedSpecSector>> &items,
    std::vector<std::promise<std::vector<wi_equation<Coeff>>>> &promises,
    std::mutex &mtx, std::condition_variable &cv, bool &finished) {
  auto n_bunches = m_bunches.size();
  std::size_t n_items{0};
  for (std::size_t k = 0; k != n_bunches; ++k) {
    n_items += m_bunches[k].first.size();
  }
  items.reserve(n_items);
  promises.resize(n_items);
  // Submit bunch k to generate equations.
  // Wait for bunch k-1 to finish, then solve it.
  std::size_t item_wait_begin = items.size(); // =0
  auto unsolved_begin = m_sys.begin();
  sol_map<Coeff> sols;
  std::size_t neq{0};
  std::size_t nonzero_eqs{0};
  for (std::size_t k = 0; k <= n_bunches; ++k) {
    std::size_t item_wait_end = items.size(); // end of bunch k-1 in items
    if (k < n_bunches) {
      std::lock_guard<std::mutex> lk(mtx);
      for (const auto &item : m_bunches[k].first) {
        items.push_back(m_ibp_sym_spec_map[item]);
      }
      cv.notify_all();
    }
    else {
      // All items have been added to the queue.
      std::lock_guard<std::mutex> lk(mtx);
      finished = true;
      cv.notify_all();
    }
    if (!k) {
      continue;
    }
    auto tosolve = m_bunches[k - 1].second;
    if (tosolve.empty()) {
      continue;
    }
    // Wait for bunch k-1 to finish generating
    // and add the equations to the system.
    for (auto i = item_wait_begin; i != item_wait_end; ++i) {
      for (auto &eq : promises[i].get_future().get()) {
        m_sys.add(std::move(eq), neq++);
      }
    }
    item_wait_begin = item_wait_end;
    // Sort all unsolved equations in the system.
    m_sys.sort(unsolved_begin, m_sys.end());
    // Solve all equations in the system which belong to a sector in 'tosolve'.
    // TODO: to avoid calculating the IntegralProperties for the first integral
    //       of each equation, find the last equation to solve using
    //       nested intervals or calculate a "separator integral weight"
    //       from the sector in 'tosolve'.
    // Alternative: use only the (t,s) part of the weight. This requires the
    // (t,s) in to_solve to be converted to a weight.
    auto last_ts = std::pair<uint32_t, uint32_t>(0, 0);
    while (unsolved_begin != m_sys.end()) {
      auto &eq = *unsolved_begin;
      auto iprops = Integral::properties(eq.front().first);
      auto ts = std::pair<uint32_t, uint32_t>(iprops.topology, iprops.sector);
      bool solve{false};
      if (ts == last_ts) {
        solve = true;
      }
      else {
        if (std::find(tosolve.begin(), tosolve.end(), ts) != tosolve.end()) {
          last_ts = ts;
          solve = true;
        }
      }
      if (solve) {
        eq.solve(sols, true, m_sys.get_db());
        if (!eq.empty()) {
          sols.insert({eq.front().first, std::ref(eq)});
          ++nonzero_eqs;
        }
        ++unsolved_begin;
      }
      else {
        break;
      }
    }
  }
  if (!n_items) {
    // If the seed was empty we need to notify the workers
    // that they should quit.
    {
      std::lock_guard<std::mutex> lk(mtx);
      finished = true;
    }
    cv.notify_all();
  }
  Config::log(1) << neq << " equations: " << neq - nonzero_eqs << " zero + "
                 << nonzero_eqs << " independent" << std::endl;
}

/*************************************
 * Generator with on-the-fly solver; *
 * system ordered by seed sector     *
 *************************************/

// A class to provide a callable object with data to act as the master thread
// in the parallel generation and solution of equations.
// This version keeps the system ordered by seed sector, i.e. equations from
// the seed of a higher sector always come later in the system.
// Within a seed sector, equations are sorted either
// - fully, i.e. sorted union of ibp and sym equations,
// - first sorted ibp, then sorted sym (TODO),
// - first sorted sym, then sorted ibp (TODO).
template <typename Coeff>
class GeneratorParallelMasterSO {
  friend class GeneratorHelper;

public:
  GeneratorParallelMasterSO(const GeneratorHelper::specmap_t &);
  void operator()(std::vector<std::pair<SeedSpecSector, SeedSpecSector>> &,
                  std::vector<std::promise<std::vector<wi_equation<Coeff>>>> &,
                  std::mutex &, std::condition_variable &, bool &);

private:
  SystemOfEqs<Coeff> m_sys;
  GeneratorHelper::specmap_t m_ibp_sym_spec_map;
  // m_ordered_ts.size(), i.e. the number of (topo,secor) pairs in the seed.
  std::size_t m_n_items;
  std::vector<std::pair<uint32_t, uint32_t>> m_ordered_ts;
};

// The GeneratorParallelMasterSO constructur sets up the data needed
// by the master thread of the parallel generator/solver.
template <typename Coeff>
GeneratorParallelMasterSO<Coeff>::GeneratorParallelMasterSO(
    const GeneratorHelper::specmap_t &specmap)
    : m_ibp_sym_spec_map{specmap}, m_n_items{0} {
  auto bunches_syssz =
      GeneratorHelper::GeneratorParallelMaster_init(m_ibp_sym_spec_map);
  // Join the bunches (ignoring bunch.second, i.e. "to_solve") into a
  // (ordered) vector of (topo,sector) pairs.
  auto bunches = std::move(bunches_syssz.first);
  for (const auto &bunch : bunches) {
    m_n_items += bunch.first.size();
  }
  m_ordered_ts.reserve(m_n_items);
  for (const auto &bunch : bunches) {
    for (const auto &ts : bunch.first) {
      m_ordered_ts.push_back(ts);
    }
  }
  // Reserve the maximal system size for the on-the-fly solver.
  // This is needed so that the references to equations remain valid
  // when new equations are added to the system while the solver is running.
  m_sys.reserve(bunches_syssz.second);
}

template <typename Coeff>
void GeneratorParallelMasterSO<Coeff>::operator()(
    std::vector<std::pair<SeedSpecSector, SeedSpecSector>> &items,
    std::vector<std::promise<std::vector<wi_equation<Coeff>>>> &promises,
    std::mutex &mtx, std::condition_variable &cv, bool &finished) {
  items.reserve(m_n_items);
  promises.resize(m_n_items);
  sol_map<Coeff> sols;
  std::size_t n_submitted{0};
  const std::size_t queue_depth{20}; // TODO
  std::size_t eqnum{0};
  std::size_t nonzero_eqs{0};
  for (std::size_t n_retrieved = 0; n_retrieved != m_n_items; ++n_retrieved) {
    bool new_submitted{false};
    while (n_submitted != m_n_items &&
           n_submitted - n_retrieved < queue_depth) {
      // Submit items until the queue is full
      // or there are no more items to submit.
      {
        std::lock_guard<std::mutex> lk(mtx);
        items.push_back(m_ibp_sym_spec_map[m_ordered_ts[n_submitted]]);
      }
      n_submitted++;
      if (n_submitted == m_n_items) {
        std::lock_guard<std::mutex> lk(mtx);
        finished = true;
      }
      new_submitted = true;
    }
    if (new_submitted) {
      cv.notify_all();
    }
    for (auto &eqvec : promises[n_retrieved].get_future().get()) {
      auto &eq = m_sys.add(std::move(eqvec), eqnum++);
      eq.solve(sols, true, m_sys.get_db());
      if (!eq.empty()) {
        sols.insert({eq.front().first, std::ref(eq)});
        ++nonzero_eqs;
      }
    }
  }
  if (!m_n_items) {
    // If the seed was empty we need to notify the workers
    // that they should quit.
    {
      std::lock_guard<std::mutex> lk(mtx);
      finished = true;
    }
    cv.notify_all();
  }
  Config::log(1) << eqnum << " equations: " << eqnum - nonzero_eqs << " zero + "
                 << nonzero_eqs << " independent" << std::endl;
}

/**********************************************
 * Generator with on-the-fly solver interface *
 **********************************************/

template <typename Coeff>
SystemOfEqs<Coeff> GeneratorHelper::generate_and_solve(
    const std::vector<SeedSpec> &ibp_seedspec,
    const std::vector<SeedSpec> &ibp_seedcompl,
    const std::vector<SeedSpec> &sym_seedspec, const bool sym_autoseed,
    const int parallel) {
  auto ibp_sym_spec_map = GeneratorHelper::seedspecs_to_specmap(
      ibp_seedspec, ibp_seedcompl, sym_seedspec, sym_autoseed);
  SystemOfEqs<Coeff> sys;
  // Equation sorting strategy
  if (Config::lookahead() >= 0) {
    auto master = GeneratorParallelMaster<Coeff>(ibp_sym_spec_map);
    Distributor2<std::pair<SeedSpecSector, SeedSpecSector>,
                 std::vector<wi_equation<Coeff>>,
                 GeneratorParallelMaster<Coeff>, Cache<Coeff, std::string>>(
        [](const std::pair<SeedSpecSector, SeedSpecSector> &ibp_sym_spec4sect,
           int pos, int tot, Cache<Coeff, std::string> &ccache) {
          return generate_system<Coeff>(ibp_sym_spec4sect, pos, tot, 0, ccache);
        },
        master, parallel);
    sys = std::move(master.m_sys);
  }
  else {
    // Sort equations only within a sector seed.
    auto master = GeneratorParallelMasterSO<Coeff>(ibp_sym_spec_map);
    Distributor2<std::pair<SeedSpecSector, SeedSpecSector>,
                 std::vector<wi_equation<Coeff>>,
                 GeneratorParallelMasterSO<Coeff>, Cache<Coeff, std::string>>(
        [](const std::pair<SeedSpecSector, SeedSpecSector> &ibp_sym_spec4sect,
           int pos, int tot, Cache<Coeff, std::string> &ccache) {
          return generate_system<Coeff>(ibp_sym_spec4sect, pos, tot, 1, ccache);
        },
        master, parallel);
    sys = std::move(master.m_sys);
  }
  return sys;
}

/***************************************
 * Generator with on-the-fly retriever *
 ***************************************/

// A class to provide a callable object to act as the master thread
// in the parallel generation and retrieval of equations.
template <typename Coeff>
class RetrieveParallelMaster {
  friend class GeneratorHelper;

public:
  RetrieveParallelMaster(
      GeneratorHelper::specmap_t &&, std::vector<intid> &&eqnums,
      const std::function<std::string(const std::string &)> &treatcoeff,
      const std::function<void(eqdata &&)> &treateq);
  void operator()(std::vector<std::pair<SeedSpecSector, SeedSpecSector>> &,
                  std::vector<std::promise<std::vector<eqdata>>> &,
                  std::mutex &, std::condition_variable &, bool &);

private:
  GeneratorHelper::specmap_t m_ibp_sym_spec_map;
  std::vector<intid> m_eqnums;
  std::function<std::string(const std::string &)> m_treatcoeff;
  const std::function<void(eqdata &&)> m_treateq;
  // Return a wrapper function for m_treatcoeff to hold
  // the mutex s_treatcoeff_mtx when called
  // so that m_treatcoeff doesn't need to be thread-safe.
  // Cache values in s_treatcoeff_cache (also protected by s_treatcoeff_mtx).
  std::function<std::string(const Coeff &, const std::string &)>
  get_treatcoeff_func();
  std::vector<eqdata> generate_str_sys(
      const std::pair<SeedSpecSector, SeedSpecSector> &ibp_sym_spec4sect,
      int pos, int tot, Cache<Coeff, std::string> &ccache);
  static std::mutex s_treatcoeff_mtx;
  static std::unordered_map<Coeff, std::string> s_treatcoeff_cache;
};

template <typename Coeff>
std::mutex RetrieveParallelMaster<Coeff>::s_treatcoeff_mtx{};

template <typename Coeff>
std::unordered_map<Coeff, std::string>
    RetrieveParallelMaster<Coeff>::s_treatcoeff_cache{};

template <typename Coeff>
RetrieveParallelMaster<Coeff>::RetrieveParallelMaster(
    GeneratorHelper::specmap_t &&specmap, std::vector<intid> &&eqnums,
    const std::function<std::string(const std::string &)> &treatcoeff,
    const std::function<void(eqdata &&)> &treateq)
    : m_ibp_sym_spec_map{std::move(specmap)},
      m_eqnums{std::move(eqnums)},
      m_treatcoeff{treatcoeff},
      m_treateq{treateq} {
  std::sort(std::begin(m_eqnums), std::end(m_eqnums));
}

template <typename Coeff>
void RetrieveParallelMaster<Coeff>::operator()(
    std::vector<std::pair<SeedSpecSector, SeedSpecSector>> &items,
    std::vector<std::promise<std::vector<eqdata>>> &promises, std::mutex &mtx,
    std::condition_variable &cv, bool &finished) {
  std::size_t n_items{0};
  std::vector<std::pair<uint32_t, uint32_t>> ordered_ts;
  {
    auto bunches = GeneratorHelper::generate_ts_bunches(m_ibp_sym_spec_map);
    for (const auto &bunch : bunches) {
      n_items += bunch.size();
    }
    ordered_ts.reserve(n_items);
    for (const auto &bunch : bunches) {
      for (const auto &ts : bunch) {
        ordered_ts.push_back(ts);
      }
    }
  }
  items.reserve(n_items);
  promises.resize(n_items);
  std::size_t n_submitted{0};
  const std::size_t queue_depth{20}; // TODO
  std::size_t eqnum{0};
  auto select_eqnums_it = std::begin(m_eqnums);
  auto eqnums_end = std::end(m_eqnums);
  for (std::size_t n_retrieved = 0; n_retrieved != n_items; ++n_retrieved) {
    bool new_submitted{false};
    while (n_submitted != n_items && n_submitted - n_retrieved < queue_depth) {
      // Submit items until the queue is full
      // or there are no more items to submit.
      {
        std::lock_guard<std::mutex> lk(mtx);
        items.push_back(m_ibp_sym_spec_map[ordered_ts[n_submitted]]);
      }
      n_submitted++;
      if (n_submitted == n_items) {
        std::lock_guard<std::mutex> lk(mtx);
        finished = true;
      }
      new_submitted = true;
    }
    if (new_submitted) {
      cv.notify_all();
    }
    if (m_eqnums.empty()) {
      // select all equations
      for (auto &eq : promises[n_retrieved].get_future().get()) {
        m_treateq(std::move(eq));
      }
    }
    else {
      for (auto &eq : promises[n_retrieved].get_future().get()) {
        if (*select_eqnums_it == eqnum) {
          m_treateq(std::move(eq));
          ++select_eqnums_it;
          if (select_eqnums_it == eqnums_end) {
            // No more equation numbers left in m_eqnums to select.
            if (n_submitted != n_items) {
              Config::log(2) << "Stop submitting seeds because we got "
                                "everything we need."
                             << std::endl;
              {
                std::lock_guard<std::mutex> lk(mtx);
                finished = true;
              }
              cv.notify_all();
            }
            return;
          }
        }
        ++eqnum;
      }
    }
  }
  if (!n_items) {
    // If the seed was empty we need to notify the workers
    // that they should quit.
    {
      std::lock_guard<std::mutex> lk(mtx);
      finished = true;
    }
    cv.notify_all();
  }
}

template <typename Coeff>
std::function<std::string(const Coeff &, const std::string &)>
RetrieveParallelMaster<Coeff>::get_treatcoeff_func() {
  if (!m_treatcoeff) {
    return [](const Coeff &, const std::string &s) { return s; };
  }
  return [this](const Coeff &c, const std::string &s) {
    std::lock_guard<std::mutex> lk(s_treatcoeff_mtx);
    auto ins = s_treatcoeff_cache.insert({c, s});
    if (ins.second) {
      ins.first->second = m_treatcoeff(s);
    }
    return ins.first->second;
  };
}

template <typename Coeff>
std::vector<eqdata> RetrieveParallelMaster<Coeff>::generate_str_sys(
    const std::pair<SeedSpecSector, SeedSpecSector> &ibp_sym_spec4sect, int pos,
    int tot, Cache<Coeff, std::string> &ccache) {
  // Generate equations in a single sector
  // and convert them to weight-string equations.
  int sort_mode{0};
  if (Config::lookahead() == -1) {
    sort_mode = 1;
  }
  else if (Config::lookahead() == -2) {
    sort_mode = 2;
  }
  if (!ccache.treatval_set()) {
    ccache.treatval_func(get_treatcoeff_func());
  }
  auto numsys = GeneratorHelper::generate_system<Coeff>(ibp_sym_spec4sect, pos,
                                                        tot, sort_mode, ccache);
  std::vector<eqdata> strsys;
  strsys.reserve(numsys.size());
  auto &cmap = ccache.get_unsafe();
  for (auto &wi_eq : numsys) {
    eqdata ws_eq;
    ws_eq.reserve(wi_eq.size());
    for (const auto &wi : wi_eq) {
      ws_eq.push_back({wi.first, cmap.at(wi.second)});
    }
    wi_eq.clear();
    strsys.push_back(std::move(ws_eq));
  }
  return strsys;
}

template <typename Coeff>
void GeneratorHelper::generate_and_retrieve(
    const std::vector<SeedSpec> &ibp_seedspec,
    const std::vector<SeedSpec> &ibp_seedcompl,
    const std::vector<SeedSpec> &sym_seedspec, const bool sym_autoseed,
    std::vector<intid> &&eqnums,
    const std::function<std::string(const std::string &)> &treatcoeff,
    const std::function<void(eqdata &&)> &treateq, int parallel) {
  auto ibp_sym_spec_map = GeneratorHelper::seedspecs_to_specmap(
      ibp_seedspec, ibp_seedcompl, sym_seedspec, sym_autoseed);
  auto master = RetrieveParallelMaster<Coeff>(
      std::move(ibp_sym_spec_map), std::move(eqnums), treatcoeff, treateq);
  Distributor2<std::pair<SeedSpecSector, SeedSpecSector>, std::vector<eqdata>,
               RetrieveParallelMaster<Coeff>, Cache<Coeff, std::string>>(
      std::bind(&RetrieveParallelMaster<Coeff>::generate_str_sys, &master,
                std::placeholders::_1, std::placeholders::_2,
                std::placeholders::_3, std::placeholders::_4),
      master, parallel);
}

} // namespace pyred

#endif
