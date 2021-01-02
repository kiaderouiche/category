/*
Copyright (C) 2017-2020 The Kira Developers (see AUTHORS file)

This file is part of Kira.

Kira is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Kira is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Kira.  If not, see <http://www.gnu.org/licenses/>.
*/

#include "kira/kira.h"

#include <chrono>
#include <condition_variable>
#include <cstdio>
#include <iomanip>
#include <mutex>
#include <string>
#include <unordered_set>
#include <utility>
#include <vector>

#include <firefly/BaseReconst.hpp>
#include "firefly/config.hpp" // for WITH_MPI
#include <firefly/FFInt.hpp>
#include <firefly/RationalFunction.hpp>
#include <firefly/RatReconst.hpp>
#include <firefly/ShuntingYardParser.hpp>

#include "pyred/config.h" // for GZSTREAM_NAMESPACE
#include "pyred/defs.h"
#include "kira/tools.h"
#include "gzstream/gzstream.h"

#ifdef WITH_MPI
#include <mpi.h>

#include <firefly/MPIWorker.hpp>
#endif

static Loginfo& logger = Loginfo::instance();

static std::mutex reconst_done;
static std::condition_variable cond_reconst_done;

void Kira::run_firefly(/*const*/ std::vector<uint64_t>& mandatory_vec,
    const uint32_t mode_, const std::string topology_name,
    const int factor_scan) { // mandatory not const due to MPI_Bcast
  if (mode_ == 0) {
    reconstruction_mode = 0; // full reconstruction
  }
  else if (mode_ == 1) {
    reconstruction_mode = 1; // only back substitution
  }
  else {
    logger << "Unkown mode\n";
    exit(-1);
  }

  if (symbols.size() == 0) {
    logger << "No variables?\n";
    exit(-1);
  }

  // Create main director for saved states
  mkdir("firefly_saves", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
  mkdir("firefly_saves/logs", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);

  size_t runs = 1;

  if (!mastersSetZero.empty()) {
    runs = mastersSetZero.size();
  }

  std::vector<std::vector<std::string>> rpn_functions {};
  std::vector<std::vector<std::pair<uint64_t, std::size_t>>> system_copy {};
  std::vector<firefly::FFInt> funs_copy {};

  for (size_t run = 0; run != runs; ++run) {
    if (runs != 1) {
      logger << "\nReduction " << run + 1 << " / " << runs << "\n";
    }

#ifdef WITH_MPI
    // Send configuration to the workers
    bool cont = true;
    MPI_Bcast(&cont, 1, MPI_CXX_BOOL, firefly::master, MPI_COMM_WORLD);

    // Symbols
    std::string mpi_symbols = "";
    for (const auto& el : symbols) {
      mpi_symbols += el + "!";
    }
    mpi_symbols.pop_back();

    int symbol_size = static_cast<int>(mpi_symbols.size());
    MPI_Bcast(&symbol_size, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
    MPI_Bcast(&mpi_symbols[0], symbol_size, MPI_CHAR, firefly::master,
              MPI_COMM_WORLD);

    // Reconstruction mode
    MPI_Bcast(&reconstruction_mode, 1, MPI_UINT32_T, firefly::master,
              MPI_COMM_WORLD);

    // Mandatory
    int mandatory_size = static_cast<int>(mandatory_vec.size());
    MPI_Bcast(&mandatory_size, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
    MPI_Bcast(&mandatory_vec[0], mandatory_size, MPI_UINT64_T, firefly::master,
              MPI_COMM_WORLD);
#endif

    bb = new BlackBoxKira(mandatory_vec, reconstruction_mode);

    std::unordered_set<uint64_t> masters_set_to_zero;
    std::string file_postfix = "";

    if (mastersSetZero.empty()) {
#ifdef WITH_MPI
      // Zero masters
      int zero_masters_size = 0;
      std::vector<uint64_t> tmp {};
      MPI_Bcast(&zero_masters_size, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
      MPI_Bcast(&tmp[0], zero_masters_size, MPI_UINT64_T, firefly::master,
                MPI_COMM_WORLD);
#endif
      masters_set_to_zero.reserve(0);
    }
    else {
#ifdef WITH_MPI
      // Zero masters
      int zero_masters_size = static_cast<int>(mastersSetZero[run].size());
      MPI_Bcast(&zero_masters_size, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
      MPI_Bcast(&mastersSetZero[run][0], zero_masters_size, MPI_UINT64_T, firefly::master,
                MPI_COMM_WORLD);
#endif
      file_postfix = "_" + std::to_string(run);
      masters_set_to_zero = std::unordered_set<uint64_t> (mastersSetZero[run].begin(), mastersSetZero[run].end());
    }

    if (run == 0) {
#ifdef WITH_MPI
      // 1: normal mode, 2: store system, 0: use stored system
      int load_system = 1;

      if (!mastersSetZero.empty()) {
        load_system = 2;
      }

      MPI_Bcast(&load_system, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
#endif

      load_ff_system();

      if (mode_ == 1) {
        bb->prepare_backward();
      }

      //TODO make this an option
      if (!mastersSetZero.empty()) {
        system_copy = bb->get_system();
      }
    } else {
#ifdef WITH_MPI
      int load_system = 0;
      MPI_Bcast(&load_system, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
#endif
      bb->set_system(system_copy);
    }

    if (!mastersSetZero.empty()) {
      if (run == 0) {
        auto tmp = bb->post_select(symbols, masters_set_to_zero);
        funs_copy = std::move(tmp.first);
        rpn_functions = std::move(tmp.second);
      } else {
        bb->post_select(symbols, masters_set_to_zero, funs_copy, rpn_functions);
      }
    }
    else {
      bb->force_precompute();
    }

    if (!multiply_factors) {
#ifdef WITH_MPI
      int send_factors = 0;
      MPI_Bcast(&send_factors, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
#endif
    }
    else {
#ifdef WITH_MPI
      int send_factors = 1;
      MPI_Bcast(&send_factors, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
#endif
      prepare_factors(mandatory_vec, masters_set_to_zero);
    }

    // disable the insertion tracer
    pyred::Config::insertion_tracer(0);

    logger << "Reconstructing in: ";
    logger << symbols[0];

    for (auto it = symbols.begin() + 1; it != symbols.end(); ++it) {
      logger << ", " << *it;
    }

    logger << "\n";

    database_reconst = new DataBase(outputDir + "/results/kira.db");
    database_reconst->create_equation_table();

    if (silent_flag == 0) {
      reconst = new firefly::Reconstructor<BlackBoxKira>(
          static_cast<uint32_t>(symbols.size()), static_cast<uint32_t>(coreNumber),
          max_bunch_size, *bb /*, firefly::Reconstructor<BlackBoxKira>::CHATTY*/);
    } else {
      reconst = new firefly::Reconstructor<BlackBoxKira>(
          static_cast<uint32_t>(symbols.size()), static_cast<uint32_t>(coreNumber),
          max_bunch_size, *bb, firefly::Reconstructor<BlackBoxKira>::SILENT);
    }

    //  reconst->set_safe_interpolation();
    if (symbols.size() > 1) {
      reconst->enable_shift_scan();
    }

    if ((symbols.size() > 2 && factor_scan == -1) || factor_scan == 1) {
      reconst->enable_factor_scan();
    }

    bool save = true;
    bool ff_save_exists = false;

    if (save) { // save intermediate results, TODO: use previous pyRed run instead
                // of running it again?
      std::string copied_dir = "firefly_saves/ff_save_" + topology_name + file_postfix;
      std::string save_dir = "ff_save/states";

      if (file_exists(copied_dir.c_str())) {
        logger << "Reconstruction for " << topology_name + file_postfix << " already done\n";
        logger << "Loading results to write them into the database\n";

	// Check whether the ff_save directory exists already and rename it.
        if (file_exists("ff_save")) {
	  char old_file_name[] = "ff_save";
	  char tmp_file_name[] = "ff_save_tmp";
	  std::rename(old_file_name, tmp_file_name);
	  ff_save_exists = true;
	}

        // rename FireFly log file
        char old_log[] = "firefly.log";
        std::string new_log = "firefly_saves/logs/firefly_" + topology_name + file_postfix + ".log";
        std::rename(new_log.c_str(), old_log);

        // rename ff_save
        char old_name[] = "ff_save";
        std::string tmp = "firefly_saves/ff_save_" + topology_name + file_postfix;
        std::rename(tmp.c_str(), old_name);

        // Call the black box once so that equation_lengths is set
        // TODO remove
        std::vector<firefly::FFInt> values;
        for (size_t i = 0; i != symbols.size(); ++i) {
          values.emplace_back(firefly::BaseReconst().get_rand_32());
        }

        (*bb)(values);

        reconst->resume_from_saved_state();
      }
      else if (file_exists(save_dir.c_str())) {
        reconst->resume_from_saved_state();
      }
      else {
        mkdir("ff_save", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
        std::vector<std::string> tags;

        std::vector<firefly::FFInt> values;
        for (size_t i = 0; i != symbols.size(); ++i) {
          values.emplace_back(firefly::BaseReconst().get_rand_32());
        }

        (*bb)(values);

        std::string filename = "ff_save/tags";
        std::ofstream filestream;
        filestream.open(filename.c_str());

        for (const auto& ids : bb->assignment) {
          std::string tag =
              std::to_string(ids.first) + "_" + std::to_string(ids.second);
          tags.emplace_back(tag);
          filestream << tag << "\n";
        }

        filestream.close();

        reconst->set_tags(tags);
      }
    }

    bool done = false;

    ThreadPool tp;
    tp.initialize(1);
    tp.enqueue([this, &done]() {
      reconst->reconstruct();

      std::lock_guard<std::mutex> lock(reconst_done);
      done = true;
      cond_reconst_done.notify_one();
    });

    {
      std::unique_lock<std::mutex> lock(reconst_done);

      if (!done) {
        while (cond_reconst_done.wait_for(lock, std::chrono::minutes(10)) ==
               std::cv_status::timeout) {
          write_to_database();
        }
      }
    }

    write_to_database();

    logger << "Average times:\n";
    logger << "Parsing: " << std::setprecision(3) << bb->parse_average << " s\n";
    logger << "Forward: " << bb->forward_average << " s\n";
    logger << "Backsubs: " << bb->back_average << " s\n\n";
    logger << std::setprecision(1);

    firefly::RatReconst::reset();

    // reset the insertion tracer
    pyred::Config::insertion_tracer(1);

    // rename FireFly log file
    char old_log[] = "firefly.log";
    std::string new_log = "firefly_saves/logs/firefly_" + topology_name + file_postfix + ".log";
    std::rename(old_log, new_log.c_str());

    if (save) {
      char old_name[] = "ff_save";
      std::string tmp = "firefly_saves/ff_save_" + topology_name + file_postfix;

      std::rename(old_name, tmp.c_str());

      if (ff_save_exists) {
        char tmp_file_name[] = "ff_save_tmp";
        std::rename(tmp_file_name, old_name);
      }
    }

    first = true;
    delete database_reconst;
    delete bb;
    delete reconst;
  }

  integral_data.clear();
}

void Kira::load_ff_system() {
  std::string inputName;

  if (reconstruction_mode == 0) {
    inputName =
        (outputDir + "/tmp/" + integralfamily.name + "/SYSTEMconfig").c_str();
  }
  else if (reconstruction_mode == 1) {
    inputName =
        (outputDir + "/tmp/" + integralfamily.name + "/VERconfig").c_str();
  }
  else {
    logger << "Mode " << reconstruction_mode << " not known.\n";
    exit(-1);
  }

  std::ifstream inputConfig;
  std::size_t number_of_equations = 0;

  if (file_exists(inputName.c_str())) {
    inputConfig.open(inputName.c_str());
    inputConfig >> number_of_equations;
    inputConfig.close();
  }
  else {
    logger << "Could not read the number of equations from " << inputName
           << ".\n";
    exit(-1);
  }

  logger << "Loading " << number_of_equations << " equations.\n\n";

  bb->reserve(number_of_equations);

  int eqLength;
  uint64_t ID;
  size_t parsed_functions = 0;
  size_t parsed_equations = 0;
  size_t curr_percentage = 1;
  std::string line;

  std::vector<std::string> add;
  add.push_back("");
  add.push_back("sym");

  firefly::ShuntingYardParser parser(std::vector<std::string>{}, symbols, true);
  auto time0 = std::chrono::high_resolution_clock::now();

  for (unsigned k = 0; k != collectReductions.size(); ++k) {
    for (int sectorNumber = 0; sectorNumber != (1 << integralfamily.jule);
         ++sectorNumber) {

      for (int ll = 0; ll != 2; ++ll) {
        int itF = -1;

        while (true) {
          if (reconstruction_mode == 0) {
            if (itF == -1) {
              inputName = outputDir + "/tmp/" + integralfamily.name + "/SYSTEM" +
                          add[ll] + "_" + collectReductions[k] + "_" +
                          something_string(sectorNumber) + ".gz";
            }
            else {
              inputName = outputDir + "/tmp/" + integralfamily.name + "/SYSTEM" + add[ll] + "_" + collectReductions[k] + "_" + something_string(sectorNumber)+ "_" + something_string(itF) + ".gz";
            }
          }
          else if (reconstruction_mode == 1) {
            inputName = outputDir + "/tmp/" + integralfamily.name + "/VER" +
                        add[ll] + "_" + collectReductions[k] + "_" +
                        something_string(sectorNumber) + ".gz";
          }

          if (file_exists(inputName.c_str())) {
            bool unexpected_end = true;
            GZSTREAM_NAMESPACE::igzstream input;
            input.open(inputName.c_str());

            while (true) {
              std::vector<std::pair<std::uint64_t, std::size_t>> tmp_eq;
#ifdef WITH_MPI
              std::string eqn_s = "";
#endif

              // the loop has to exit here, otherwise the file is corrupted
              unexpected_end = false;
              if (!(input >> line)) break;

              unexpected_end = true;
              if (!(input >> ID)) break;
              if (!(input >> eqLength)) break;

              for (int j = 0; j != eqLength; ++j) {
                int skip;
                std::string coef;
                std::uint64_t id;
                int sector;
                int flag2;

                if (!(input >> skip)) break;
                if (!(input >> coef)) break;
                if (!(input >> id)) break;
                if (!(input >> sector)) break; // sector
                if (!(input >> skip)) break;   // topology
                if (!(input >> flag2)) break;  // flag2

                if (reconstruction_mode == 1 && j == 0) {
                  coef += "*(-1)";
                }

                // TODO Horner form?
#ifdef WITH_MPI
                eqn_s += coef + "!" + std::to_string(id) + "|";
#endif

                std::size_t pos = parser.add_otf(coef, true);
                ++parsed_functions;
                tmp_eq.emplace_back(std::make_pair(id, pos));

                integral_data.emplace(
                    std::make_pair(id, std::make_pair(sector, flag2)));
              }

              if (parsed_equations + 1 < number_of_equations + 1 && parsed_equations + 1 > curr_percentage*number_of_equations/10) {
                ++curr_percentage;
                if (silent_flag == 0) {
                  std::cerr << "\033[1;34mFireFly info:\033[0m " << parsed_equations + 1 << " / " << number_of_equations << "\r";
                }
              }
              ++parsed_equations;

#ifdef WITH_MPI
              eqn_s.pop_back();

              int batch_size = 2147483645; // 2147483647 is the largest signed 32-bit integer
              int split = static_cast<int>(eqn_s.size()) / batch_size;

              if (split > 1) {
                int tmp;
                if (static_cast<int>(eqn_s.size()) % batch_size == 0) {
                  tmp = -split;
                }
                else {
                  tmp = -1 - split;
                }
                MPI_Bcast(&tmp, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
              }
              else if (split == 1 &&
                        static_cast<int>(eqn_s.size()) != batch_size) {
                int tmp = -1 - split;
                MPI_Bcast(&tmp, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
              }

              for (int i = 0; i != 1 + split; ++i) {
                if (i == split) {
                  int amount = static_cast<int>(eqn_s.size()) - i * batch_size;
                  if (amount != 0) {
                    MPI_Bcast(&amount, 1, MPI_INT, firefly::master,
                              MPI_COMM_WORLD);
                    MPI_Bcast(&eqn_s[i * batch_size], amount, MPI_CHAR,
                              firefly::master, MPI_COMM_WORLD);
                  }
                }
                else {
                  int amount = batch_size;
                  MPI_Bcast(&amount, 1, MPI_INT, firefly::master,
                            MPI_COMM_WORLD);
                  MPI_Bcast(&eqn_s[i * batch_size], amount, MPI_CHAR,
                            firefly::master, MPI_COMM_WORLD);
                }
              }
#endif
              bb->add_eqn(tmp_eq);
            }

            input.close();

            if (unexpected_end) {
              logger << "File " << inputName.c_str() << " is corrupted.\n";
              exit(-1);
            }

            ++itF;
          }
          else if (reconstruction_mode == 0) {
            if (itF == -1) {
              ++itF;
            }
            else {
              break;
            }
          }

          if (reconstruction_mode == 1) {
            break;
          }
        }
      }
    }
  }

  auto time1 = std::chrono::high_resolution_clock::now();
  std::cout << "\033[1;34mFireFly info:\033[0m " << number_of_equations << " / " << number_of_equations << "\n";
  logger << "\033[1;34mFireFly info:\033[0m Parsed " << parsed_functions
      << " functions of which " << parser.get_size() << " are distinct\n";

#ifdef WITH_MPI
  int end = -1;
  MPI_Bcast(&end, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
  MPI_Barrier(MPI_COMM_WORLD);
#endif

  bb->set_parser(parser);

  logger << "\nSystem loaded in " << std::to_string(std::chrono::duration<double>(time1 - time0).count()) << " s\n";
}

void Kira::prepare_factors(const std::vector<pyred::intid>& mandatory_vec, const std::unordered_set<uint64_t>& masters_set_to_zero) {
  logger << "Preparing factors\n";

  std::unordered_map<pyred::intid, std::unordered_map<pyred::intid, std::size_t>> system {};
  system.reserve(mandatory_vec.size());
  firefly::ShuntingYardParser parser(std::vector<std::string>{}, symbols, true);

  for (const auto id : mandatory_vec) {
    auto it = prefactorEquations.find(id);

    if (it != prefactorEquations.end()) {
      std::unordered_map<pyred::intid, std::size_t> equation {};
      equation.reserve(it->second.size());

#ifdef WITH_MPI
      int next = 1;
      MPI_Bcast(&next, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);

      pyred::intid eqid = it->first;
      MPI_Bcast(&eqid, 1, MPI_UINT64_T, firefly::master, MPI_COMM_WORLD);
#endif

      for (const auto& integral : it->second) {
        if (integral.first == it->first) {
          continue;
        }
        else if (masters_set_to_zero.find(integral.first) == masters_set_to_zero.end()) {
          // copy required due to SYP deleting string at Initialization
          std::string coef = integral.second;

  #ifdef WITH_MPI
          int next = 2;
          MPI_Bcast(&next, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);

          pyred::intid intid = integral.first;
          MPI_Bcast(&intid, 1, MPI_UINT64_T, firefly::master, MPI_COMM_WORLD);

          int batch_size =
              2147483645; // 2147483647 is the largest signed 32-bit integer
          int split = static_cast<int>(coef.size()) / batch_size;

          if (split > 1) {
            int tmp;
            if (static_cast<int>(coef.size()) % batch_size == 0) {
              tmp = -split;
            }
            else {
              tmp = -1 - split;
            }
            MPI_Bcast(&tmp, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
          }
          else if (split == 1 &&
                   static_cast<int>(coef.size()) != batch_size) {
            int tmp = -1 - split;
            MPI_Bcast(&tmp, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
          }

          for (int i = 0; i != 1 + split; ++i) {
            if (i == split) {
              int amount =
                  static_cast<int>(coef.size()) - i * batch_size;
              if (amount != 0) {
                MPI_Bcast(&amount, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
                MPI_Bcast(&coef[i * batch_size], amount, MPI_CHAR,
                          firefly::master, MPI_COMM_WORLD);
              }
            }
            else {
              int amount = batch_size;
              MPI_Bcast(&amount, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
              MPI_Bcast(&coef[i * batch_size], amount, MPI_CHAR,
                        firefly::master, MPI_COMM_WORLD);
            }
          }
  #endif

          std::size_t pos = parser.add_otf(coef, true);
          equation.emplace(std::make_pair(integral.first, pos));
        }
      }

      system.emplace(std::make_pair(id, std::move(equation)));
    }
  }

#ifdef WITH_MPI
  int end = -1;
  MPI_Bcast(&end, 1, MPI_INT, firefly::master, MPI_COMM_WORLD);
#endif

  bb->set_factors(system, parser);

#ifdef WITH_MPI
  MPI_Barrier(MPI_COMM_WORLD);
#endif
}

void Kira::write_to_database() {
  std::vector<std::pair<std::string, firefly::RationalFunction>> results =
      reconst->get_early_results();

  if (!results.empty()) {
    database_reconst->begin_transaction();
    database_reconst->prepare_backsubstitution();

    if (first) {
      std::unique_lock<std::mutex> lock(bb->mut);

      if (!(bb->equation_lengths.empty())) {
        lock.unlock();

        for (const auto& equation : bb->equation_lengths) {
          BaseIntegral integral;
          integral.id = equation.first;
          integral.coefficientString = "1";
          auto values = integral_data.at(equation.first);
          integral.flag2 = values.second;
          integral.characteristics[SECTOR] = values.first;

          database_reconst->bind_equation(integral, equation.second,
                                          equation.first, mastersReMap);
        }

        first = false;
      }
    }

    for (const auto& res : results) {
      std::pair<uint64_t, uint64_t> ids_eq_int = std::make_pair(
          std::stoull(res.first.substr(0, res.first.find("_"))),
          std::stoull(res.first.substr(res.first.find("_") + 1)));

      BaseIntegral integral;
      integral.id = ids_eq_int.second;
      auto values = integral_data.at(ids_eq_int.second);
      integral.flag2 = values.second;
      integral.characteristics[SECTOR] = values.first;

      std::string factor = "";

      if (multiply_factors) {
        auto it = prefactorEquations.find(ids_eq_int.first);

        if (it != prefactorEquations.end()) {
          auto itt = it->second.find(ids_eq_int.second);

          if (itt != it->second.end()) {
            factor = "(" + itt->second + ")*";
          }
        }
      }

      integral.coefficientString = factor + res.second.generate_horner(symbols);

      database_reconst->bind_equation(integral,
                                      bb->equation_lengths.at(ids_eq_int.first),
                                      ids_eq_int.first, mastersReMap);
    }

    database_reconst->commit_transaction();
  }
}
