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

#include <cmath>

#include "pyred/coeff_int.h"
#include "pyred/defs.h"
#include "pyred/integrals.h"
#include "pyred/interface.h"
#include "pyred/parser.h"
#include "kira/ReadYamlFiles.h"
#include "kira/kira.h"
#include "kira/tools.h"

#define INIT 0
#define PYRED 1
#define TRIANG 2
#define BACKSUBS 3
#define SYMMETRY 4

// using namespace pyred;
using namespace std;
using namespace YAML;
using namespace GiNaC;

static Loginfo& logger = Loginfo::instance();

void check_config_file(string path, string message = "Missing config file: ") {
  if (!file_exists(path.c_str())) {
    logger << message << path << "\n";
    logger << "Quit program\n\n";
    exit(1);
  }
}

int check_helper(string path) {
  struct stat sb;

  if (0 != stat(const_cast<char*>(path.c_str()), &sb)) {
    logger << "Error: Cannot access " << path << "\n";
    logger << "Run without " << path << " or provide valide path.\n";
    logger << "Quit program\n\n";
    return 0;
  }

  if (S_ISDIR(sb.st_mode)) {
    logger << "--> " << path << " is not an executable.\n";
    logger << "Run without " << path
           << " or check that program is executable.\n";
    return 0;
  }

  if ((sb.st_mode & S_IXUSR) == 0) {
    logger << "--> " << path << " is not executable.\n";
    logger << "Run without " << path
           << " or check that program is executable.\n";
    return 0;
  }

  return 1;
}

std::string read_environment_variable() {
  string path = "FERMATPATH";

  if (getenv(path.c_str())) {
    path = getenv(path.c_str());
    logger << "The user defined environment variable FERMATPATH for Fermat is "
              "set:\n"
           << path << "\n";
    return path;
  }
  return "-1";
}

int prepare_symmetry_invariants(
    std::string stringEq, std::string& variable, unsigned num,
    lst& invariants4sym, lst& invariantsRev, lst& invariantsReplacement,
    lst& invariantsReplacementRev,
    vector<GiNaC::possymbol>& invariantsPlaceholder, lst& invariantsList,
    std::vector<GiNaC::possymbol>& symbolInvariants) {
  stringEq = "(" + stringEq + ")";
  {
    vector<string> testString = {"(" + variable + "^", "+" + variable + "^",
                                 "-" + variable + "^", "*" + variable + "^"};

    for (size_t it = 0; it < testString.size(); it++) {
      size_t posVar = stringEq.find(testString[it]);

      if (posVar != std::string::npos) {

        std::string foundStr = stringEq.substr(posVar + 2 + (variable.size()));
        size_t posExp = foundStr.find_first_not_of("0123456789");

        if (posExp != std::string::npos) {

          int value = stoi(foundStr.substr(0, posExp));

          auto itF = find(invariantsPlaceholder.begin(), invariantsPlaceholder.end(), get_symbol("xKira" + to_string(num) + to_string(value) + "place"));

          if(itF != invariantsPlaceholder.end())
            continue;

          ex newRule = pow(get_symbol(variable), value) ==
                       get_symbol("xKira" + to_string(num)+to_string(value));

          invariants4sym.append(newRule);

          ex newRuleRev = get_symbol("xKira" + to_string(num)+to_string(value)) ==
                          pow(get_symbol(variable), value);

          invariantsRev.append(newRuleRev);

          invariantsList.append(get_symbol("xKira" + to_string(num)+to_string(value)));
          symbolInvariants.push_back(get_symbol("xKira" + to_string(num)+to_string(value)));

          invariantsPlaceholder.push_back(
              get_symbol("xKira" + to_string(num)+to_string(value) + "place"));

          invariantsReplacement.append(
              get_symbol("xKira" + to_string(num)+to_string(value)) ==
              get_symbol("xKira" + to_string(num)+to_string(value) + "place"));

          invariantsReplacementRev.append(
              get_symbol("xKira" + to_string(num)+to_string(value) + "place") ==
              get_symbol("xKira" + to_string(num)+to_string(value)));

//           return 1;
        }
      }
    }
  }

  {
    vector<string> testString = {"(" + variable, "+" + variable, "-" + variable,
                                 "*" + variable};

    for (size_t it = 0; it < testString.size(); it++) {
      size_t posVar = stringEq.find(testString[it]);

      if (posVar != std::string::npos) {

        auto itF = find(invariantsPlaceholder.begin(), invariantsPlaceholder.end(), get_symbol("xKira" + to_string(num) + "place"));

        if(itF != invariantsPlaceholder.end())
          continue;

        ex newRule =
            get_symbol(variable) == get_symbol("xKira" + to_string(num));

        invariants4sym.append(newRule);

        ex newRuleRev =
            get_symbol("xKira" + to_string(num)) == get_symbol(variable);

        invariantsRev.append(newRuleRev);

        invariantsList.append(get_symbol("xKira" + to_string(num)));
        symbolInvariants.push_back(get_symbol("xKira" + to_string(num)));

        invariantsPlaceholder.push_back(
            get_symbol("xKira" + to_string(num) + "place"));

        invariantsReplacement.append(
            get_symbol("xKira" + to_string(num)) ==
            get_symbol("xKira" + to_string(num) + "place"));

        invariantsReplacementRev.append(
            get_symbol("xKira" + to_string(num) + "place") ==
            get_symbol("xKira" + to_string(num)));

//         return 1;
      }
    }
  }
  return 0;
}

void Kira::read_kinematics(int flag_user_defined_system) {
  //   if(flag_user_defined_system==0)
  //     check_config_file("config/kinematics.yaml");

  if (file_exists("config/kinematics.yaml")) {
    Node doc = LoadFile("config/kinematics.yaml");
    Kinematics kinematics = doc["kinematics"].as<Kinematics>();

    dimension = get_symbol("d");

    /*read external incoming momentum*/
    for (size_t i = 0; i < kinematics.im.size(); i++) {
      externalVar.push_back(get_symbol(kinematics.im[i]));
      GiNaCSymbols[kinematics.im[i]] = get_symbol(kinematics.im[i]);
    }

    /*read external outgoing momentum*/
    for (size_t i = 0; i < kinematics.om.size(); i++) {
      externalVar.push_back(get_symbol(kinematics.om[i]));
      GiNaCSymbols[kinematics.om[i]] = get_symbol(kinematics.om[i]);
    }

    for (size_t i = 0; i < kinematics.ki.size(); i++) {
      invar.push_back(get_symbol(kinematics.ki[i].first));
      invarStr.push_back(kinematics.ki[i].first);
      invarDim.push_back(kinematics.ki[i].second);
      GiNaCSymbols[kinematics.ki[i].first] = get_symbol(kinematics.ki[i].first);

#ifdef KIRAFIREFLY
      if (kinematics.ki[i].first != kinematics.rpl) {
        symbols.emplace_back(kinematics.ki[i].first);
      }
#endif
    }

#ifdef KIRAFIREFLY
    if (!flag_user_defined_system) {
      symbols.emplace_back("d");
    }
#else
    // void cast to avoid compiler warning about unused parameter
    (void)flag_user_defined_system;
#endif

    GiNaCSymbols[kinematics.rpl] = get_symbol(kinematics.rpl);
    parser symbolReader(GiNaCSymbols);

    if (kinematics.rpl.size()) {
      mass2One.append(symbolReader(kinematics.rpl) == 1);
      massSet2One = symbolReader(kinematics.rpl);
    }
    logger << "One variable is set to 1: " << mass2One << "\n";

    massSet2OneDim = 0;
    for (size_t i = 0; i < invar.size(); i++) {
      if (something_string(invar[i]) == something_string(massSet2One))
        massSet2OneDim = invarDim[i];
    }

    /*read momentum conservation*/
    if (kinematics.mc.first.size() && kinematics.mc.second.size()) {
      momentConservation.append(symbolReader(kinematics.mc.first) ==
                                symbolReader(kinematics.mc.second));

      mom_uno = symbolReader(kinematics.mc.first);
    }

    /*read the scalarproduct rules into kinematic*/
    for (size_t i = 0; i < kinematics.sr.size(); i++) {
      kinematic.append(symbolReader(kinematics.sr[i].first.first) *
                           symbolReader(kinematics.sr[i].first.second) ==
                       symbolReader(kinematics.sr[i].second)
                           .subs(mass2One, subs_options::algebraic));
    }


    // read kinematic invariants for symmetries
    // collect symbols, for which the equations are linear

    for (size_t itE = 0; itE < invarStr.size(); itE++) {
      for (size_t i = 0; i < kinematics.sr.size(); i++) {
        if (prepare_symmetry_invariants(
                kinematics.sr[i].second, invarStr[itE], itE, invariants4sym,
                invariants4symRev, invariantsReplacement,
                invariantsReplacementRev, invariantsPlaceholder, invariantsList,
                symbolInvariants)) {
          break;
        }
      }
    }

    for (auto itE : invariantsList) {
      std::ostringstream ss;
      ss << itE;
      invarSol.push_back(ss.str());
    }
  }
  else {
    logger << "config/kinematics.yaml does not exist. Assume that userdefined\n"
              "system is reduced or the merge was used\n\n";
  }

}

void Kira::init_kinematics() {
  for (size_t k = 0; k < kinematic.nops(); k++) {
    kinematic[k] =
        kinematic[k].subs(momentConservation, subs_options::algebraic).expand();
    kinematicOld.append(kinematic[k]);
  }

  if (externalVar.size() && kinematic.nops()) {
    for (size_t i = 0; i < externalVar.size(); i++) {
      if (externalVar[i] == GiNaC::ex_to<GiNaC::symbol>(mom_uno)) {
        externalVar.erase(externalVar.begin() + i);
      }
    }
  }

  sort(externalVar.begin(), externalVar.end());
  externalVar.erase(unique(externalVar.begin(), externalVar.end()),
                    externalVar.end());

  size_t nExtVar = externalVar.size();
  size_t nKinematics = kinematic.nops();
  size_t binomial = (binomial_coeff(nExtVar, 2) + nExtVar);
  if (binomial > nKinematics) {
    logger << "Error: your kinematics in config/kinematics.yaml\n";
    logger << "seem to be wrong: not enough equations\n";
    exit(-1);
  }

  bS = new possymbol[kinematic.nops()];
  generate_symbols(bS, "bS", static_cast<int>(kinematic.nops()));

  int k = 0;

  for (size_t i = 0; i < externalVar.size(); i++) {
    kinematicShift.append(externalVar[i]*externalVar[i] == bS[k]);
    kinematicShiftR.append(bS[k] == externalVar[i]*externalVar[i]);
    unknownsExt.append(bS[k]);
    bSsymbols.push_back(bS[k]);
    k++;
  }

  for (size_t i = 0; i < externalVar.size(); i++) {
    for (size_t j = i + 1; j < externalVar.size(); j++) {
      kinematicShift.append(externalVar[i]*externalVar[j] == bS[k]);
      kinematicShiftR.append(bS[k] == externalVar[i]*externalVar[j]);
      unknownsExt.append(bS[k]);
      bSsymbols.push_back(bS[k]);
      k++;
    }
  }

  for (size_t k = 0; k < kinematic.nops(); k++) {
    kinematicR.append(
        kinematic[k].subs(kinematicShift, subs_options::algebraic));
  }


  ex solutionExt = lsolve(kinematicR, unknownsExt);

  delete[] bS;

  for (size_t k = 0; k < solutionExt.nops(); k++) {
    kinematicReverse.append(solutionExt[k]);
  }

  size_t nSolutions = solutionExt.nops();
  if (nSolutions != binomial) {
    logger << "Error: your kinematics in config/kinematics.yaml\n";
    logger << "seem to be wrong.";
    exit(-1);
  }
  for (size_t k = 0; k < kinematicShift.nops(); k++) {
    kinematic2.append(
        kinematicShift[k].subs(solutionExt, subs_options::algebraic));
  }
  kinematic = kinematic2;

  vector<ex> perm;
  for (unsigned i = 0; i < externalVar.size(); i++)
    perm.push_back(externalVar[i]);
  perm.push_back(mom_uno);

  int countZero = 0;

  for (unsigned i = 0; i < kinematicOld.nops(); i++) {
    if (is_a<numeric>(kinematicOld.op(i).rhs()) &&
        ex_to<numeric>(kinematicOld.op(i).rhs()).is_zero())
      countZero++;
    else
      specialKinematics.append(kinematicOld.op(i).rhs());
  }

  if (momentConservation.nops() > 0 && externalVar.size() > 1) {
    controlSymmetries = (1 << (specialKinematics.nops())) - 1;

    vector<uint32_t> array;


    uint32_t arraySize = externalVar.size() + 1;

    for (unsigned i = 0; i < arraySize; i++) {
      array.push_back(i);
    }

    int leaveTheLoop = 0;

    do {
      if (leaveTheLoop == 1) break;

      for (uint32_t gi = 0;
           gi < (static_cast<uint32_t>(1) << (arraySize)); gi++) {
        lst permMom;
        for (uint32_t g = 0; g < arraySize; g++) {
          if ((gi & (1 << g))) {
            permMom.append((perm[g] == (-1)*perm[array[g]]));
          }
          if (!(gi & (1 << g))) {
            permMom.append((perm[g] == perm[array[g]]));
          }
        }

        ex tk1 = (momentConservation.op(0).rhs());
        ex tk2 = (momentConservation.op(0).lhs());

        ex d1 = tk1.subs(permMom, subs_options::algebraic);
        ex d2 = tk2.subs(permMom, subs_options::algebraic);

        lst momConsTr;

        momConsTr.append(lsolve(lst{d2 == d1}, lst{mom_uno}));

        lst result;

        for (unsigned i = 0; i < kinematicOld.nops(); i++) {
          result.append(
              kinematicOld.op(i)
                  .subs(permMom, subs_options::algebraic)
                  .expand()
                  .subs(invariants4sym, subs_options::algebraic)
                  .subs(invariantsReplacement, subs_options::algebraic));
        }

        lst bn;

        int checkNonLinear = 0;

        for (unsigned i = 0; i < result.nops(); i++) {
          for (int expIt = -5; expIt < 6; expIt++) {
            for (auto itI : invariantsPlaceholder) {
              if (result.op(i).rhs().coeff(itI, expIt) != 0) {
                if (expIt != 1 && expIt != 0) checkNonLinear = expIt;
              }
            }
          }

          bn.append(expand(result.op(i)
                               .subs(momConsTr[0], subs_options::algebraic)
                               .expand()
                               .subs(kinematic, subs_options::algebraic)
                               .subs(invariants4sym, subs_options::algebraic)));
        }

        if (checkNonLinear != 0) {
          controlSymmetries = 0;
          lst nande;
          string a1 = "place", b1 = "holder";
          nande.append(get_symbol(a1) == get_symbol(b1));
          vector<string> c1;
          ex nande2 = get_symbol(a1) == get_symbol(b1);
          externalTransf.push_back(make_tuple(nande, nande, 0, nande2, c1));

          leaveTheLoop = 1;
          break;
        }

        ex sol = lsolve(bn, invariantsList);

        int maskP = 0;
        int testZero = 0;
        int setBit = 0;

        for (unsigned i = 0; i < bn.nops(); i++) {
          if (is_a<numeric>(bn[i].rhs()) &&
              ex_to<numeric>(bn[i].rhs()).is_zero() &&
              (bn[i].lhs().is_equal(bn[i].rhs())))
            testZero++;
        }

        for (unsigned i = 0; i < sol.nops(); i++) {
          if ((sol[i].lhs().is_equal(sol[i].rhs().subs(
                  invariantsReplacementRev, subs_options::algebraic)))) {
            setBit++;
          }
          else {
            maskP |= 1 << setBit;
            setBit++;
          }
        }

        // test if new momentum conservation is the same as the old momentum
        // conservation

        if ((testZero == countZero &&
             (momConsTr[0][0].lhs() - momentConservation[0].lhs()) == 0 &&
             (momConsTr[0][0].rhs() - momentConservation[0].rhs()) == 0) &&
            (sol.nops() || invariantsList.nops() == 0)) {
          std::vector<std::string> tmpString;

          for (size_t itY = 0; itY < sol.nops(); itY++) {
            std::ostringstream ss;
            ss << sol[itY].rhs().subs(invariantsReplacementRev,
                                      subs_options::algebraic);
            tmpString.push_back(ss.str());
          }

          // test sign of permMom.

          int sameMom = 0;
          for (auto itExt : externalTransf) {
            unsigned countProof = 0;
            for (size_t itMom = 0; itMom < get<0>(itExt).nops(); itMom++) {
              if (get<0>(itExt)[itMom].rhs() + permMom[itMom].rhs() == 0)
                countProof++;
            }
            if (countProof == get<0>(itExt).nops()) {
              sameMom = 1;
              break;
            }
          }

          if (!sameMom) {
            externalTransf.push_back(make_tuple(permMom, lst{momConsTr[0][0]},
                                                maskP, sol, tmpString));
          }
        }
      }

    } while (next_permutation(array.begin(), array.end()));
  }
  else {
    controlSymmetries = 0;
    lst nande;
    string a1 = "place", b1 = "holder";
    nande.append(get_symbol(a1) == get_symbol(b1));
    vector<string> c1;
    ex nande2 = get_symbol(a1) == get_symbol(b1);
    externalTransf.push_back(make_tuple(nande, nande, 0, nande2, c1));
  }
}

void Kira::read_integralfamilies(int flag_user_defined_system) {
  if (flag_user_defined_system == 0)
    check_config_file("config/integralfamilies.yaml");

  if (file_exists("config/integralfamilies.yaml")) {
    Node doc = LoadFile("config/integralfamilies.yaml");
    const Node& node = doc["integralfamilies"];

    for (unsigned it = 0; it < node.size(); it++) {
      Integral_F integralfamily = node[it].as<Integral_F>();

      integralfamily.topology = it;
      topology[integralfamily.name] = integralfamily;

      collectReductions.push_back(integralfamily.name);
      topologyNames.push_back(integralfamily.name);
    }
    string BASISLC = "BASISLC";
    if (topologyNames.size() > 0)
      topologyNames.push_back(BASISLC);
  }
  else {
    integralfamily.jule = 0;
  }
  if (flag_user_defined_system == 0){
   ofstream fileTopologyOrdering(
        (outputDir + "/sectormappings/topology_ordering"));

    for (size_t itC = 0; itC < collectReductions.size(); itC++) {
      fileTopologyOrdering << topology[collectReductions[itC]].name;
      fileTopologyOrdering << " " << topology[collectReductions[itC]].jule
                          << endl;
    }
  }
}

void Kira::destroy_integralfamilies() {
  collectReductions.clear();
  topologyNames.clear();
  for (map<string, Integral_F>::iterator iT = topology.begin();
       iT != topology.end(); iT++) {
    delete[](*iT).second.propSymb;
    delete[](*iT).second.mask;
    delete[](*iT).second.allowSector;
    delete[](*iT).second.skipSector;
    delete[](*iT).second.symVecReverse;
    delete[](*iT).second.symVec;
    delete[](*iT).second.relVec;
    for (ItVE idenIt = (*iT).second.identitiesIBP.begin();
         idenIt != (*iT).second.identitiesIBP.end(); ++idenIt) {
      (*idenIt)->delete_IBP();
      delete (*idenIt);
    }
    for (ItVE idenIt = (*iT).second.identitiesLI.begin();
         idenIt != (*iT).second.identitiesLI.end(); ++idenIt) {
      (*idenIt)->delete_IBP();
      delete (*idenIt);
    }
    delete[](*iT).second.invarID;
  }
  topology.clear();
}

std::pair<int, GiNaC::ex> Kira::test_quadratic(GiNaC::ex& start) {
// quadratic solver part 1
//   symbol x("x"), y("y");

//   ex start = /*pow(x,2)*pow(y,2)**/1;

  ex coefResult = 1;
  int success = 1;

  if (is_a<mul>(start)) {

    for (auto itX : start) {

      if (is_a<power>(itX)) {

        if (itX.op(1).info(info_flags::even)) {

          coefResult = coefResult*pow(itX.op(0), itX.op(1)/2);
        }
        else {
          success = 0;
          break;
        }
      }
      else {

        if (is_a<numeric>(itX) && itX.info(info_flags::positive)) {

          if (is_a<power>(sqrt(itX))) {
            success = 0;
            break;
          }
          else {
            coefResult = coefResult*sqrt(itX);
          }
        }
        else {
          success = 0;
          break;
        }

      }
    }
  }
  else if (is_a<power>(start)) {

    if (start.op(1).info(info_flags::even)) {

      coefResult = coefResult*pow(start.op(0), start.op(1)/2);
    }
    else {

      success = 0;
    }
  }
  else if (is_a<numeric>(start) && start.info(info_flags::positive)) {

    if (is_a<power>(sqrt(start))) {
      success = 0;
    }
    else {

      coefResult = coefResult*sqrt(start);
    }
  }
  else if (start == 0) {

    coefResult = 0;
    success = 0;
  }
  else {

    success = 0;
  }

  return make_pair(success, coefResult);
}

void Kira::init_integralfamilies() {

  for (map<string, Integral_F>::iterator iT = topology.begin();
       iT != topology.end(); iT++) {

    logger << "Kira prepares topology: " << (*iT).second.name;

    logger << " and top level sector: \n";

    for (vector<int>::iterator topIt = (*iT).second.topLevelSectors.begin();
         topIt != (*iT).second.topLevelSectors.end(); topIt++) {
      logger << *topIt << " ";
    }
    logger << "\n";

    for (size_t i = 0; i < (*iT).second.loop.size(); i++) {

      GiNaCSymbols[(*iT).second.loop[i]] = get_symbol((*iT).second.loop[i]);
    }

    parser symbolReader(GiNaCSymbols);

    /*
     * Check whether the propagators are written in terms of scalar products or
     * in terms of momenta (eg.: (l.l+2l.p... <--> (l+p)^2...))
     */

    {
      possymbol *scalLoop = new possymbol[(*iT).second.jule];
      generate_symbols(scalLoop, "h", (*iT).second.jule);
      lst scal2symb;

      int jSymb = 0;

      for (size_t ii = 0; ii < (*iT).second.loopVar.size(); ii++) {

        for (size_t i = ii; i < (*iT).second.loopVar.size(); i++) {

          (*iT).second.scalprod.append(
            (*iT).second.loopVar[i]*(*iT).second.loopVar[ii]);

          scal2symb.append(
            (*iT).second.loopVar[i]*(*iT).second.loopVar[ii] == scalLoop[jSymb++]);
        }
      }

      for (size_t ii = 0; ii < (*iT).second.loopVar.size(); ii++) {

        for (size_t i = 0; i < externalVar.size(); i++) {

          (*iT).second.scalprod.append(externalVar[i]*(*iT).second.loopVar[ii]);

          scal2symb.append(externalVar[i]*(*iT).second.loopVar[ii] ==
                           scalLoop[jSymb++]);
        }
      }

      if (static_cast<int>((*iT).second.scalprod.nops()) != (*iT).second.jule) {
        logger << "You need " << (*iT).second.scalprod.nops()
               << " propagators ";
        logger << "and not " << (*iT).second.jule << " propagators\n";
        exit(0);
      }

      ex momAnsatz = 0;

      int momAnsatzN = (*iT).second.loopVar.size() + externalVar.size();

      possymbol* unknownC = new possymbol[momAnsatzN];
      generate_symbols(unknownC, "c", momAnsatzN);

      jSymb = 0;

      for (size_t ii = 0; ii < (*iT).second.loopVar.size(); ii++) {

        momAnsatz += unknownC[jSymb++]*(*iT).second.loopVar[ii];
      }

      for (size_t i = 0; i < externalVar.size(); i++) {

        momAnsatz += unknownC[jSymb++]*externalVar[i];
      }


      ex generalProps = pow(momAnsatz, 2)
                            .expand()
                            .subs(scal2symb, subs_options::algebraic)
                            .subs(kinematicShift, subs_options::algebraic);

      (*iT).second.propsMomentaFlowMask = 0;

      for(int itY = 0; itY < (*iT).second.jule; itY++){

	lst ansatzResult;
	ex tempOriginal = symbolReader((*iT).second.propagator[itY].first).expand().subs(momentConservation,subs_options::algebraic).expand();;

	ex tempo = tempOriginal.subs(scal2symb, subs_options::algebraic).subs(kinematicShift,subs_options::algebraic);

	lst ansatzTerms;

	int countZeros = 0;

	for(int itX = 0; itX < (*iT).second.jule; itX++){

	  if(diff(tempo,scalLoop[itX])==0)
	    countZeros++;

	  ex diffOriginal = diff(tempo,scalLoop[itX]);

	  ansatzTerms.append(diffOriginal == diff(generalProps,scalLoop[itX]));
	}

        if (countZeros == (*iT).second.jule) {

          (*iT).second.propsMomentaFlowMask |= (1 << itY);

          (*iT).second.props.append((
              GiNaC::pow(tempOriginal, 2) -
              symbolReader((*iT).second.propagator[itY].second))
                  .subs(mass2One, subs_options::algebraic));

          (*iT).second.propsMomFlowA.append(tempOriginal);

          continue;
        }

        int insertOnce = 0;

        int stop = 0;

        for (int itX = 0; itX < (*iT).second.jule; itX++) {

          for (int itA = 0; itA < momAnsatzN; itA++) {

            if (coeff(ansatzTerms[itX].rhs(), unknownC[itA], 2) != 0) {

              ex tokenEx = ansatzTerms[itX].lhs();

              auto giveResult = test_quadratic(tokenEx);


              if (giveResult.first == 0) {
                stop = 1;
                break;
              }

              if (giveResult.first &&
                  !(insertOnce != 0 && giveResult.second != 0)) {
                ansatzResult.append(unknownC[itA] == giveResult.second);

                for (int itD = 0; itD < (*iT).second.jule; itD++) {
                  ansatzTerms[itD] = ansatzTerms[itD].subs(
                      (unknownC[itA] == giveResult.second),
                      subs_options::algebraic);

                }
              }
              if (giveResult.second != 0) {
                insertOnce = 1;
              }
              break;
            }
          }
          if (stop) break;
        }

        if (stop) {

          (*iT).second.props.append((tempOriginal
	  -symbolReader((*iT).second.propagator[itY].second)).subs(mass2One, subs_options::algebraic));

          lst nande;
          string a1 = "place", b1 = "holder";
          nande.append(get_symbol(a1) == get_symbol(b1));

          (*iT).second.propsMomFlowA.append(nande);

          continue;
        }

        for (int itA = 0; itA < momAnsatzN; itA++) {

          vector<ex> collectRes;

          for (int itX = (*iT).second.jule - 1; itX >= 0; itX--) {
            if (coeff(ansatzTerms[itX].rhs(), unknownC[itA], 1) != 0) {
              ex resSol = lsolve(ansatzTerms[itX], unknownC[itA]);

              collectRes.push_back(resSol);
            }
          }

          auto itUNION = std::unique(collectRes.begin(), collectRes.end());
          collectRes.resize(std::distance(collectRes.begin(), itUNION));

          ex subsRes;

          int foundSolution = 0;

          if (collectRes.size() > 1) {
            for (auto itU : collectRes) {

              if (itU != 0) {
                subsRes = itU;
                foundSolution = 1;
                break;
              }
            }
          }
          else if (collectRes.size() == 1) {
            subsRes = collectRes[0];
            foundSolution = 1;
          }

          if (foundSolution) {
            ansatzResult.append(unknownC[itA] == subsRes);

            for (int itD = 0; itD < (*iT).second.jule; itD++) {
              ansatzTerms[itD] = ansatzTerms[itD].subs(unknownC[itA] == subsRes,
                                                       subs_options::algebraic);

            }
          }
        }

        for (size_t itA = 0; itA < ansatzResult.nops(); itA++) {
          ansatzResult[itA] = ansatzResult[itA].lhs() ==
                              (ansatzResult[itA].rhs().subs(
                                  ansatzResult, subs_options::algebraic));
        }

        ex resAns =
            pow(momAnsatz.subs(ansatzResult, subs_options::algebraic), 2)
                .expand()
                .subs(kinematicShift, subs_options::algebraic)
                .subs(kinematicReverse, subs_options::algebraic);

        ex resOri = symbolReader((*iT).second.propagator[itY].first)
                        .expand()
                        .subs(kinematicShift, subs_options::algebraic)
                        .subs(kinematicReverse, subs_options::algebraic);

	if((resOri - resAns) == 0){

	  (*iT).second.propsMomentaFlowMask |= (1<<itY);

	  (*iT).second.props.append((pow(momAnsatz.subs(ansatzResult, subs_options::algebraic),2).expand()
	  -symbolReader((*iT).second.propagator[itY].second)).subs(mass2One, subs_options::algebraic));

          (*iT).second.propsMomFlowA.append(
              momAnsatz.subs(ansatzResult, subs_options::algebraic));
	}
	else{
          (*iT).second.props.append((tempOriginal
	  -symbolReader((*iT).second.propagator[itY].second)).subs(mass2One, subs_options::algebraic));

	  lst nande;
	  string a1="place", b1="holder";
	  nande.append(get_symbol(a1) == get_symbol(b1));

	  (*iT).second.propsMomFlowA.append(nande);
        }
      }

      delete[] unknownC;
      delete[] scalLoop;

    }

    for (size_t i = 0; i < (*iT).second.propagator.size(); i++) {
      (*iT).second.props[i] =
          (*iT)
              .second.props[i]
              .subs(momentConservation, subs_options::algebraic)
              .expand();
    }

    lst propsMomFlowB;
    for (size_t i = 0; i < (*iT).second.propagator.size(); i++) {
      propsMomFlowB.append((*iT).second.propsMomFlowA[i].subs(
          (*iT).second.loop2loop2, subs_options::algebraic));
    }
    (*iT).second.propsMomFlowB.push_back(propsMomFlowB);

    /*Create relations: propagators <-> scalar products*/
    (*iT).second.invarID = new int[(*iT).second.propagator.size()];

    for (size_t i = 0; i < (*iT).second.propagator.size(); i++) {
      vector<string>::iterator itSKIP = find(invarMap.begin(), invarMap.end(),
                                             (*iT).second.propagator[i].second);
      if (itSKIP == invarMap.end() &&
          (*iT).second.propagator[i].second != "0") {
        invarMap.push_back((*iT).second.propagator[i].second);
      }
    }

    for (size_t i = 0; i < (*iT).second.propagator.size(); i++) {
      (*iT).second.invarID[i] = 0;
      for (size_t j = 0; j < invarMap.size(); j++) {
        if (invarMap[j] == (*iT).second.propagator[i].second)
          (*iT).second.invarID[i] = static_cast<int>(j + 1);
      }
    }

    possymbol x("x");
    ex tempex;
    vector<ex> lip;

    lst propsMatrix;
    lst scal2Props;

    for (int i1 = 0; i1 < (*iT).second.jule; i1++) {
      tempex = (*iT).second.props[i1].expand();

      for (int i2 = 0; i2 < (*iT).second.jule; i2++) {
        tempex = tempex.expand().subs((*iT).second.scalprod[i2] == x,
                                      subs_options::algebraic);
        propsMatrix.append(diff(tempex, x));
        tempex = tempex.subs(x == 0, subs_options::algebraic);
      }
      lip.push_back(tempex);
    }

    matrix scaltoprops((*iT).second.jule, (*iT).second.jule, propsMatrix);

    matrix scaltopropsInverse = scaltoprops.inverse();

    (*iT).second.propSymb = new possymbol[(*iT).second.jule];
    generate_symbols((*iT).second.propSymb, "g", (*iT).second.jule);

    for (int i1 = 0; i1 < (*iT).second.jule; i1++) {
      ex coef = 0;
      for (int i2 = 0; i2 < (*iT).second.jule; i2++) {
        coef +=
            ((*iT).second.propSymb[i2] - lip[i2])*scaltopropsInverse(i1, i2);
      }
      fs<lst>(coef, kinematic);
      scal2Props.append((*iT).second.scalprod[i1] == coef);
    }
    (*iT).second.scal2Props.push_back(scal2Props);


    for (size_t i = 1; i < externalTransf.size(); i++) {

      propsMatrix.remove_all();
      scal2Props.remove_all();
      propsMomFlowB.remove_all();

      for (size_t j = 0; j < (*iT).second.propagator.size(); j++) {
        propsMomFlowB.append(
            (*iT)
                .second.propsMomFlowA[j]
                .subs((*iT).second.loop2loop2, subs_options::algebraic)
                .subs(get<0>(externalTransf[i]), subs_options::algebraic)
                .subs(get<1>(externalTransf[i]), subs_options::algebraic)
                .expand()
                .expand());
      }
      (*iT).second.propsMomFlowB.push_back(propsMomFlowB);

      lip.clear();
      for (int i1 = 0; i1 < (*iT).second.jule; i1++) {
        tempex = (*iT)
                     .second.props[i1]
                     .subs(get<0>(externalTransf[i]), subs_options::algebraic)
                     .subs(get<1>(externalTransf[i]), subs_options::algebraic)
                     .expand()
                     .expand();

        for (int i2 = 0; i2 < (*iT).second.jule; i2++) {
          tempex = tempex.expand().subs((*iT).second.scalprod[i2] == x,
                                        subs_options::algebraic);
          propsMatrix.append(diff(tempex, x));
          tempex = tempex.subs(x == 0, subs_options::algebraic);
        }
        lip.push_back(tempex);
      }

      matrix scaltoprops2((*iT).second.jule, (*iT).second.jule, propsMatrix);
      matrix scaltopropsInverse2 = scaltoprops2.inverse();

      for (int i1 = 0; i1 < (*iT).second.jule; i1++) {
        ex coef = 0;
        for (int i2 = 0; i2 < (*iT).second.jule; i2++) {
          coef += ((*iT).second.propSymb[i2] - lip[i2]) *
                  scaltopropsInverse2(i1, i2);
        }
        fs<lst>(coef, kinematic);
        scal2Props.append((*iT).second.scalprod[i1] == coef);
      }

      (*iT).second.scal2Props.push_back(scal2Props);
    }

    (*iT).second.mask = new Vint[(*iT).second.jule + 1];
    (*iT).second.allowSector = new Vint[(*iT).second.jule + 1];
    (*iT).second.skipSector = new std::set<int>[(*iT).second.jule + 1];
    (*iT).second.symVecReverse = new SYM[(1 << (*iT).second.jule) + 1];
    (*iT).second.symVec = new SYM[(1 << (*iT).second.jule) + 1];
    (*iT).second.relVec = new SYM[(1 << (*iT).second.jule) + 1];
  }



}

void Kira::read_config() {
  vector<string> namesFermat;
  namesFermat.push_back("fer64");
  namesFermat.push_back("ferls");
  namesFermat.push_back("feris64");
  namesFermat.push_back("ferl");

  int flag = 0;

  fermatPath = read_environment_variable();
  if (fermatPath != "-1")
    flag = check_helper(fermatPath);
  else {
    for (size_t it = 0; it < namesFermat.size(); it++) {
      string path = getenv("PATH");
      char* dir;
      for (dir = strtok(const_cast<char*>(path.c_str()), ":"); dir;
           dir = strtok(NULL, ":")) {
        string nameToken = dir;
        nameToken += "/";
        nameToken += namesFermat[it];
        struct stat sb;
        if (0 != stat(const_cast<char*>(nameToken.c_str()), &sb)) {
          continue;
        }

        if ((sb.st_mode & S_IXUSR) == 0) {
          continue;
        }

        flag = 1;
        logger << "Kira found this executable to Fermat: \n"
               << nameToken << "\n\n";
        fermatPath = nameToken;
        break;
      }
      if (flag == 1) break;
    }
  }

  if (flag == 0) {
    logger << "No executable to Fermat could be found.\n";
    logger << "The user defined environment variable FERMATPATH is not set. \n"
           << "If you want to run a Fermat executable not defined in the \n"
           << "environment variable PATH, then add the path to the Fermat \n"
           << "binary like this:\n"
           << "  # sh-shell:\n"
           << "  export FERMATPATH=\"/path/to/Fermat/binary\"\n"
           << "  # csh-shell:\n"
           << "  setenv FERMATPATH \"/path/to/Fermat/binary\"\n\n";
    exit(-1);
  }
}

bool removePlus(char ch) { return (ch == '+'); }

void Kira::collect_reductions_helper(
    std::string& /*itTopo*/,
    std::tuple<std::vector<std::string> /*topologies*/,
               std::vector<std::string> /*sectors*/, int /*rmax*/, int /*smax*/,
               int /*dmax*/>& itSpec) {

  if (get<1>(itSpec).size() == 0) {

    for (auto itSector : integralfamily.topLevelSectors) {

      int num_ones = 0;
      int testSector = itSector;
      for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {

        if ((testSector & 1) == 1)
          ++num_ones;
      }
      if (num_ones > get<2>(itSpec)) {

        logger << "rmax is to small in the option r: rmax.\n";
        exit(-1);
      }
      integralfamily.sector2Reduce.push_back(itSector);
    }
    integralfamily.reductSpec.push_back(
        make_tuple(integralfamily.topLevelSectors, get<2>(itSpec),
                   get<3>(itSpec), get<4>(itSpec)));
  }
  else {

    for (auto itSector : get<1>(itSpec)) {

      int num_ones = 0;

      int sectorsTmp = pyred::Integral::parse_sector(itSector,integralfamily.jule);

      int testSector = sectorsTmp;

      for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {

        if ((testSector & 1) == 1)
          ++num_ones;
      }

      if (num_ones > get<2>(itSpec)) {

        logger << "rmax is to small in the option r: rmax.\n";
        exit(-1);
      }

      integralfamily.sector2Reduce.push_back(sectorsTmp);
    }


    integralfamily.reductSpec.push_back(make_tuple(
        integralfamily.sector2Reduce, get<2>(itSpec), get<3>(itSpec), get<4>(itSpec)));
  }
}

void Kira::collect_reductions(Jobs& jobs) {

  for (unsigned itC = 0; itC < collectReductions.size(); itC++) {

    integralfamily = topology[collectReductions[itC]];

    for (auto itSpec : jobs.reductSpec) {
      if (get<0>(itSpec).size() == 0) {

        collect_reductions_helper(collectReductions[itC], itSpec);
      }
      for (auto itTopo : get<0>(itSpec)) {

        if (collectReductions[itC] == itTopo) {
          collect_reductions_helper(itTopo, itSpec);
        }
      }
    }

    vector<int> tmpSector;
    int biggestLine = 0;
    for (uint32_t iJobs = 0; iJobs < jobs.sector2Reduce.size(); iJobs++) {
      unsigned tokenD = 0;
      if (collectReductions[itC] == jobs.sector2Reduce[iJobs].first) {

        tokenD = pyred::Integral::parse_sector(jobs.sector2Reduce[iJobs].second,integralfamily.jule);

        tmpSector.push_back(tokenD);
        integralfamily.sector2Reduce.push_back(tokenD);

        int num_ones = 0;
        int testSector = tokenD;
        for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {
          if ((testSector & 1) == 1) ++num_ones;
        }
        if (num_ones > biggestLine) biggestLine = num_ones;
      }
    }

    vector<string> denMin;

    for (uint32_t i = 0; i < jobs.den.size(); i++) {
      int tmpInt = 0;
      int tmpRmax = -1;
      int tmpSmax = -1;
      int tmpDmax = numeric_limits<int>::max();
      size_t found;
      string line = jobs.den[i].second;

      if ((found = line.find_first_of("t")) != string::npos) {
        line.erase(line.begin() + found, line.begin() + found + 1);
        line.erase(remove_if(line.begin(), line.end(), removePlus), line.end());
        tmpRmax = biggestLine;
        if (line != "") istringstream(line) >> tmpInt;
        tmpRmax += tmpInt;
        tmpDmax = tmpInt;
      }
      else {
        istringstream(line) >> tmpRmax;
      }

      den.push_back(tmpRmax);

      denMin.push_back(jobs.den[i].first);

      istringstream(jobs.num[i].first) >> tmpInt;
      numMin.push_back(tmpInt);

      istringstream(jobs.num[i].second) >> tmpSmax;
      num.push_back(tmpSmax);

      if (den[i] < 0) {
        logger << "rmax is missing or is negative!";
        exit(1);
      }

      if (num[i] < 0) {
        logger << "smax is missing or is negative!";
        exit(1);
      }

      if (numMin[i] < 0) {
        logger << "smin is missing or is negative!";
        exit(1);
      }

      if (numMin[i] > num[i]) {
        logger << "smin is bigger then smax!";
        exit(1);
      }

      if (denMin[i] != "t") {
        logger << "Set rmin=t please, it is the only possible choice!";
        exit(1);
      }

      if (tmpDmax == numeric_limits<int>::max()) tmpDmax = -1;

      integralfamily.reductSpec.push_back(
          make_tuple(tmpSector, tmpRmax, tmpSmax, tmpDmax));
    }

    topology[collectReductions[itC]] = integralfamily;
  }

  if (collectReductions.size() < 2 && setSector.size() > 0) {
    integralfamily = topology[collectReductions[0]];
    uint32_t newSector = std::stoul(setSector, nullptr, 0);
    uint32_t newSectorTmp = newSector;
    int countSetNew = 0;
    while (newSectorTmp) {
      countSetNew += newSectorTmp & 1;
      newSectorTmp >>= 1;
    }

    tuple<std::vector<int>, int, int, int> newReduction;
    vector<int> newSectors;
    newSectors.push_back(newSector);

    for (auto it : integralfamily.reductSpec) {
      if (get<0>(it).size() > 1) {
        logger
            << "command line option set_sector conflicts with the reduction\n";
        logger << "set_sector is valid if only one sector is specified in "
                  "jobs file\n";
        exit(-1);
      }

      int countSetOld = 0;
      for (auto sectors : get<0>(it)) {
        int sectorsTmp = sectors;
        while (sectorsTmp) {
          countSetOld += sectorsTmp & 1;
          sectorsTmp >>= 1;
        }
      }
      int tmpR = 0;
      if ((countSetOld - countSetNew) > 0) {
        tmpR = (countSetOld - countSetNew) - 1;
      }
      newReduction =
          make_tuple(newSectors, get<1>(it) - tmpR, get<2>(it), get<3>(it));
    }
    integralfamily.reductSpec.clear();
    integralfamily.reductSpec.push_back(newReduction);

    topology[collectReductions[0]] = integralfamily;
    logger << "Command line option: set_sector changes sector to reduce: "
           << setSector << "\n";
  }
  else if (collectReductions.size() > 1 && setSector.size() > 0) {
    logger << "command line option set_sector conflicts with the reduction\n";
    logger << "set_sector is only valid if only one topology is defined in "
              "integralfamilies.yaml\n";
    exit(-1);
  }

  for (unsigned itC = 0; itC < collectReductions.size(); itC++) {
    integralfamily = topology[collectReductions[itC]];
    if (integralfamily.reductSpec.size() > 0) {
      logger << "Following reductions will be performed for the topology: ";
      logger << integralfamily.name << "\n";
      for (auto coutI : integralfamily.reductSpec) {
        for (auto itSector : get<0>(coutI)) {
          logger << "Sector: " << itSector << " ";
          logger << "rmax: " << get<1>(coutI) << " ";
          logger << "smax: " << get<2>(coutI) << " ";
          if (get<3>(coutI) != -1) logger << "dmax: " << get<3>(coutI) << " ";
          logger << "\n\n";
        }
      }
    }



  }
}

bool sortSecotrs(std::tuple<uint32_t, int>& l, std::tuple<uint32_t, int>& r) {
  if (get<1>(l) < get<1>(r)) return true;
  if (get<1>(l) > get<1>(r)) return false;

  if (get<0>(l) < get<0>(r)) return true;
  if (get<0>(l) > get<0>(r)) return false;

  return false;
}

void Kira::trim_the_system() {

  vector<tuple<string, vector<int>, string, int> > arraySeed;

  for (auto file : trimmedReduction) {

    read_integrals(file, arraySeed);
    logger << "Trim the system which contains the following integrals:\n";
    for (auto itMI : arraySeed) {

      logger << get<0>(itMI) << "[";

      for (auto itVI : get<1>(itMI)) {

        logger << " " << itVI;
      }
      logger << "]\n";
    }

    logger << "\n";
  }

  /*get first sector*/

  std::map<std::string, std::vector<std::tuple<uint32_t, int> > >
      mandatorySectors;
  std::map<std::string, std::vector<std::tuple<uint32_t, int> > >
      specialSectors;

  std::vector<std::tuple<std::string, uint32_t> > inititate_topo_sector;

  inititate_topo_sector = systemTrim;

  for (auto it : inititate_topo_sector) {
    logger << "trim the system for the topology: " << get<0>(it);
    logger << " and the sector: " << get<1>(it) << "\n";
  }

  for (auto integral : arraySeed) {
    integralfamily = topology[get<0>(integral)];

    int sector = 0;
    int count = 0;
    for (auto it : get<1>(integral)) {
      if (it > 0) {
        sector += 1 << count;
      }
      count++;
    }
    inititate_topo_sector.push_back(make_tuple(get<0>(integral), sector));
  }

  for (auto initS : inititate_topo_sector) {
    integralfamily = topology[get<0>(initS)];

    /*get all higher dependent sectos*/
    for (int count = 0; count < integralfamily.jule + 1; count++) {
      for (auto sec : integralfamily.mask[count]) {
        if ((sec & get<1>(initS)) == get<1>(initS)) {
          mandatorySectors[get<0>(initS)].push_back(make_tuple(sec, count));
        }
      }
    }
    trimmedSectors.push_back(make_tuple(get<1>(initS), integralfamily.name));

    /*find additional sectors to scan due to symmetries*/
    for (size_t itC = 0; itC < collectReductions.size(); itC++) {
      auto integralfamily = topology[collectReductions[itC]];

      for (int count = 0; count < integralfamily.jule; count++) {
        for (auto sec : integralfamily.mask[count]) {
          if (integralfamily.symVec[sec].size() == 0) continue;

          if (integralfamily.symVec[sec][0].sector ==
                  static_cast<int>(get<1>(initS)) &&
              collectReductions[integralfamily.symVec[sec][0].topology] ==
                  get<0>(initS)) {
            mandatorySectors[collectReductions[itC]].push_back(
                make_tuple(sec, count));
            specialSectors[collectReductions[itC]].push_back(
                make_tuple(sec, count));
          }
        }
      }
    }

    /*scan additional sectors caused by symmetries*/
    for (size_t itC = 0; itC < collectReductions.size(); itC++) {

      auto intfamily = topology[collectReductions[itC]];
      for (auto it : specialSectors[collectReductions[itC]]) {
        uint32_t sectorC = get<0>(it);

        for (int count = 0; count < integralfamily.jule; count++) {
          for (auto sec : intfamily.mask[count]) {
            if ((sec & sectorC) == sectorC) {
              mandatorySectors[collectReductions[itC]].push_back(
                  make_tuple(sec, count));
            }
          }
        }
      }
    }
  }

  for (size_t itC = 0; itC < collectReductions.size(); itC++) {
    if (mandatorySectors[collectReductions[itC]].size() == 0) continue;

    integralfamily = topology[collectReductions[itC]];

    integralfamily.zeroSector.clear();
    for (int count = 0; count < integralfamily.jule; count++) {
      integralfamily.mask[count].clear();
    }

    {
      sort(mandatorySectors[collectReductions[itC]].begin(),
           mandatorySectors[collectReductions[itC]].end(), sortSecotrs);

      ofstream output;
      string outputName = outputDir + "/sectormappings/" + integralfamily.name +
                          "/nonTrivialSector";

      output.open(outputName.c_str());
      logger << "Modify file: " << outputName << "\n";

      for (auto it : mandatorySectors[collectReductions[itC]]) {
        output << get<0>(it) << " " << get<1>(it) << endl;
        integralfamily.mask[get<1>(it)].push_back(get<0>(it));
      }
      output.close();
    }
    {
      ofstream fileZeroSector;
      string outputName = (outputDir + "/sectormappings/" +
                           integralfamily.name + "/trivialsector");
      fileZeroSector.open(outputName.c_str());

      logger << "Modify file: " << outputName << "\n";
      sort(mandatorySectors[collectReductions[itC]].begin(),
           mandatorySectors[collectReductions[itC]].end());

      int countZeros = 0;
      uint32_t upperbound = (1 << (integralfamily.jule));
      for (uint32_t jt = 0; jt < upperbound; jt++) {
        int continueFlag = 0;
        for (size_t it = 0;
             it < mandatorySectors[collectReductions[itC]].size(); it++) {
          if (jt == get<0>(mandatorySectors[collectReductions[itC]][it]))
            continueFlag = 1;
        }
        if (continueFlag == 0) {
          if (countZeros != 0) fileZeroSector << ",";
          fileZeroSector << jt;

          countZeros++;
          integralfamily.zeroSector.push_back(jt);
        }
      }
    }
  }
}

void Kira::get_topology_relations() {
  for (int jopp = 0; jopp < integralfamily.jule; jopp++) {

    suby.append(relational(integralfamily.propSymb[jopp], 0));
  }
  for (unsigned itC = 0; itC < collectReductions.size(); itC++) {

    integralfamily = topology[collectReductions[itC]];
    logger << "***********************************************************\n";
    logger << "Find IBP LI and symmetry relations for the topology: "
           << integralfamily.name << "\n";
    logger << "***********************************************************\n";

    mkdir((outputDir + "/sectormappings/" + integralfamily.name).c_str(),
          S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    mkdir((outputDir + "/results/" + integralfamily.name).c_str(),
          S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);

    string ibpFile =
        outputDir + "/sectormappings/" + integralfamily.name + "/IBP";
    string liFile =
        outputDir + "/sectormappings/" + integralfamily.name + "/LI";

    if (!file_exists(ibpFile.c_str()) || !file_exists(liFile.c_str())) {
      create_IBP();
      //       create_LEE();
      create_LI();
    }

    int skip = find_zero_sectors();

    if (skip == 1) continue;

    search_symmetry_relations();

    topology[collectReductions[itC]] = integralfamily;
  }

  for (unsigned itC = 0; itC < collectReductions.size(); itC++) {
    integralfamily = topology[collectReductions[itC]];

    logger << "***********************************************************\n";
    logger << "Prepare Symmetries for the topology: " << integralfamily.name
           << "\n";
    logger << "***********************************************************\n";

    if (!prepare_symmetry()) {
      for (unsigned op = 0; op < itC + 1; op++) {
        logger << "Build symmetries for " << integralfamily.name << " x "
               << collectReductions[op] << " \n";

        symmetry_relations(op);
      }
    }

    print_relations("/relations", integralfamily.symVec, itC);
    print_relations("/symmetries", integralfamily.relVec, itC);

    topology[collectReductions[itC]] = integralfamily;
  }

  trim_the_system();
  pyred::CoeffHelper::clear_invariants();
}

void Kira::print_relations(const string name, SYM*& sym, int itC) {
  if (!file_exists(
          (outputDir + "/sectormappings/" + collectReductions[itC] + name)
              .c_str())) {
    ofstream outputSyms;

    outputSyms.open((outputDir + "/sectormappings/" + collectReductions[itC] +
                     name + ".back")
                        .c_str());

    for (int sec = 0; sec < 1 << integralfamily.jule; sec++) {
      int symmetrieCounter = 0;
      for (vector<symmetries>::iterator symHandler = sym[sec].begin();
           symHandler != sym[sec].end(); symHandler++) {
        if ("/relations" == name && symmetrieCounter > 0) continue;
        symmetrieCounter++;

        string topoName = collectReductions[symHandler->topology];
        string topoNameOriginal = collectReductions[itC];

        if (symHandler->symDOTS == 1) {
          // test

          if (integralfamily.symbolicIBP.size() > 0 &&
              itC != symHandler->topology)
            continue;

          int continueTest = 0;
          for (auto itSymb : integralfamily.symbolicIBP) {
            if (symHandler->ing[itSymb] != itSymb &&
                symHandler->ing[itSymb] != -1) {
              continueTest = 1;
            }

            if ((symHandler->sector & (1 << itSymb)) &&
                symHandler->ing[itSymb] == -1 && continueTest == 0)
              continueTest = 1;

            if (continueTest == 1) {
              break;
            }
          }

          if (continueTest) continue;

          // print

          outputSyms << symHandler->symDOTS << endl;
          outputSyms << itC << " ";
          outputSyms << sec << endl;
          outputSyms << symHandler->topology << " ";
          outputSyms << symHandler->sector << endl;

          for (int proJt = 0; proJt < integralfamily.jule; proJt++) {
            if (symHandler->ing[proJt] != -1) {
              for (int proIt = 0; proIt < integralfamily.jule; proIt++) {
                if (symHandler->ing[proJt] == proIt) {
                  outputSyms << "1"
                             << " ";
                }
                else {
                  outputSyms << "0"
                             << " ";
                }
              }
            }
            else { // fake the files. distribute among the holes.

              int countOnce = 0;
              for (int proIt = 0; proIt < integralfamily.jule; proIt++) {
                if (!(symHandler->sector & (1 << proIt)) && !countOnce) {
                  // 		if(proIt == proJt){

                  outputSyms << "1"
                             << " ";
                  countOnce++;
                }
                else {
                  outputSyms << "0"
                             << " ";
                }
              }
            }
            outputSyms << "0 ";
            outputSyms << endl;
          }
          outputSyms << endl;
          continue;
        }

        vector<vector<pair<ex, int> > > exTerm;
        ex ausd2;

        for (int jT = 0; jT < topology[topoNameOriginal].jule; jT++) {
          vector<pair<ex, int> > uj;

          {
            ausd2 = topology[topoNameOriginal]
                        .props[jT]
                        .expand()
                        .subs(symHandler->subst, subs_options::algebraic)
                        .expand();

            fs<lst>(ausd2, kinematic);

            ausd2 = ausd2.subs(
                topology[topoName].scal2Props[symHandler->externalSymmetry],
                subs_options::algebraic);
          }

          ex traley;
          for (int jopp = 0; jopp < topology[topoNameOriginal].jule; jopp++) {
            uj.push_back(pair<ex, int>(
                ausd2.coeff(topology[topoNameOriginal].propSymb[jopp], 1),
                jopp));
          }
          if ((traley = ausd2.subs(suby, subs_options::algebraic)) != 0) {
            uj.push_back(pair<ex, int>(traley, -1));
          }
          exTerm.push_back(uj);
        }

        int count = 0;
        for (size_t iEx = 0; iEx < exTerm.size(); iEx++) {
          count = 0;
          if ((1 << iEx) & (sec)) {
            for (size_t jEx = 0; jEx < exTerm[iEx].size(); jEx++) {
              if (something_int(exTerm[iEx][jEx].first) != 0) {
                count++;
              }
            }
            if (count > 1) {
              logger << count << "\n";
              logger << "skip symmetry for the sector: " << sec << " "
                     << symHandler->sector << "\n";
              break;
            }
          }
        }

        if (count < 2) {

          // print

          outputSyms << symHandler->symDOTS << endl;
          outputSyms << itC << " ";
          outputSyms << sec << endl;
          outputSyms << symHandler->topology << " ";
          outputSyms << symHandler->sector << endl;

          for (size_t iEx = 0; iEx < exTerm.size(); iEx++) {
            for (size_t jEx = 0; jEx < exTerm[iEx].size(); jEx++) {
              outputSyms << exTerm[iEx][jEx].first << " ";
            }
            int sizeEX = exTerm[iEx].size();
            if (sizeEX == topology[topoNameOriginal].jule) outputSyms << "0 ";

            outputSyms << endl;
          }
          outputSyms << endl;
        }
        else {
          logger << count << "\n";
          logger << "skip symmetry for the sector: " << sec << "\n";
        }
      }
    }
    rename((outputDir + "/sectormappings/" + collectReductions[itC] + name +
            ".back")
               .c_str(),
           (outputDir + "/sectormappings/" + collectReductions[itC] + name)
               .c_str());
    remove((outputDir + "/sectormappings/" + collectReductions[itC] + name +
            ".back")
               .c_str());
  }
}

void Kira::select_spec_helper(
    int itC, std::vector<pyred::SeedSpec>& initiateMAN,
    std::tuple<std::vector<std::string> /*topologies*/,
               std::vector<std::string> /*sectors*/, int /*rmax*/, int /*smax*/,
               int /*dmax*/>& itSpec,
    int& countCHOICE) {

  if (get<1>(itSpec).size() == 0) {

    for (auto itSector : topology[collectReductions[itC]].topLevelSectors) {

      int num_ones = 0;
      unsigned testSector = itSector;

      for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {

        if ((testSector & 1) == 1) {
          ++num_ones;
        }
      }

      if (num_ones > get<2>(itSpec)) {
        logger << "rmax is to small in the option r: rmax in "
                  "select_mandatory_recursively.\n";
        logger << "\n";
        logger << "If the option kira2math, kira2form or kira2file is used\n";
        logger << "please make sure to specify the sectors: [...] which you want to extract.\n";
        exit(-1);
      }

      initiateMAN.push_back(pyred::Topology::id_to_topo(itC)->seed_spec(
          itSector, get<2>(itSpec), get<3>(itSpec), get<4>(itSpec), -1));

      logger << "Select integrals for: "
             << "topology: " << collectReductions[itC] << "\n";
      logger << " sectors: " << itSector << " rmax: " << get<2>(itSpec)
             << " smax: " << get<3>(itSpec);

      if (get<4>(itSpec) != -1) logger << " dmax: " << get<4>(itSpec);
      logger << "\n\n";
      countCHOICE++;
    }
  }
  else {

    for (auto itSector : get<1>(itSpec)) {

      int num_ones = 0;
      unsigned sectorsTmp = pyred::Integral::parse_sector(itSector,integralfamily.jule);

      unsigned testSector = sectorsTmp;

      for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {
        if ((testSector & 1) == 1) ++num_ones;
      }
      if (num_ones > get<2>(itSpec)) {
        logger << "rmax is to small in the option r: rmax in "
                  "select_mandatory_recursively.\n";
        exit(-1);
      }

      initiateMAN.push_back(pyred::Topology::id_to_topo(itC)->seed_spec(
          sectorsTmp, get<2>(itSpec), get<3>(itSpec), get<4>(itSpec), -1));

      logger << "Select integrals for: "
             << "topology: " << collectReductions[itC] << "\n";
      logger << " sectors: " << sectorsTmp << " rmax: " << get<2>(itSpec)
             << " smax: " << get<3>(itSpec);

      if (get<4>(itSpec) != -1) logger << " dmax: " << get<4>(itSpec);
      logger << "\n\n";
      countCHOICE++;
    }
  }
  if (setSector.size() > 0 && itC == 0) {

    logger << "command line option: set_sectors changes the recursive integral "
            "selection\n";
    for (auto it : integralfamily.reductSpec) {

      uint32_t countSetOld = 0;

      for (auto sectors : get<0>(it)) {

        uint32_t sectorsTmp = sectors;

        while (sectorsTmp) {
          countSetOld += sectorsTmp & 1;
          sectorsTmp >>= 1;
        }
      }
      initiateMAN.clear();
      initiateMAN.push_back(pyred::Topology::id_to_topo(itC)->seed_spec(
          get<0>(it)[0], get<1>(it), get<2>(it), get<3>(it), -1));
      logger << "Select integrals for: "
             << "topology: " << collectReductions[itC] << "\n";
      logger << " sectors: " << get<0>(it)[0] << " rmax: " << get<1>(it)
             << " smax: " << get<2>(it);
      logger << " dmax: " << get<4>(itSpec);
      logger << "\n\n";
    }
  }
}

void Kira::select_equations(vector<pyred::intid>& mandatory,
                            vector<pyred::intid>& /*optional*/, int itC,
                            Jobs& jobs, int flag_user_defined_system) {
  logger << "\n***** Select equations recursively ************************\n";

  std::vector<pyred::SeedSpec> initiateMAN;
  std::vector<pyred::SeedSpec> initiateOPT;

  int countCHOICE = 0;

  for (size_t i = 0; i < jobs.mandatoryRec.size(); i++) {
    if (jobs.mandatoryRec[i][0] == collectReductions[itC]) {
      int num_ones = 0;

      unsigned sectorsTmp = pyred::Integral::parse_sector(jobs.mandatoryRec[i][1],integralfamily.jule);

      unsigned testSector = sectorsTmp;

      for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {
        if ((testSector & 1) == 1) ++num_ones;
      }

      initiateMAN.push_back(pyred::Topology::id_to_topo(itC)->seed_spec(
          sectorsTmp,
          num_ones + something_int(jobs.mandatoryRec[i][2]),
          something_int(jobs.mandatoryRec[i][3]),
          something_int(jobs.mandatoryRec[i][2]), -1));
      countCHOICE++;
    }
  }

  for (auto itSpec : jobs.selectSpec) {
    if (get<0>(itSpec).size() == 0) {
      select_spec_helper(itC, initiateMAN, itSpec, countCHOICE);
    }
    else {
      for (auto itTopo : get<0>(itSpec)) {
        if (itTopo == collectReductions[itC]) {
          select_spec_helper(itC, initiateMAN, itSpec, countCHOICE);
        }
      }
    }
  }

  auto vectorSeeds = pyred::SeedSpec::integral_selector(initiateMAN);

  mandatory.insert(mandatory.end(), vectorSeeds.begin(), vectorSeeds.end());

  for (unsigned int i = 0; i < jobs.mandatoryFile.size(); i++) {
    if (collectReductions[itC] == jobs.mandatoryFile[i].first) {
      ConvertResult extract(*this, jobs.mandatoryFile[i].first, itC,
                            jobs.mandatoryFile[i].second, outputDir, mandatory);
      countCHOICE++;
    }
  }

  for (unsigned int i = 0; i < jobs.mandatoryFileVector.size(); i++) {
    ConvertResult extract(*this, "Tuserweight", 0,
                          jobs.mandatoryFileVector[i], outputDir, mandatory);
    countCHOICE++;
  }


  if (mandatory.size() == 0 && countCHOICE == 0 &&
      flag_user_defined_system == 0) {
    select_initial_integrals(initiateMAN);
    mandatory = pyred::SeedSpec::integral_selector(initiateMAN);
  }

  sort(mandatory.begin(), mandatory.end());

  mandatory.erase(unique(mandatory.begin(), mandatory.end()), mandatory.end());

  logger << "length of mandatory list: " << mandatory.size() << "\n";

  if (mandatory.size() == 0) {
    logger << "\n***** No equations selected *******************************\n";
  }
}


void Kira::read_equations(
    std::string fileMasters,
    std::vector<std::vector<std::tuple<std::string, std::vector<int>, std::string, int> > >& vector_equations) {

  ifstream mastersInput;
  mastersInput.open(fileMasters);

  string line;
  string coefficient;

  int checkCompatibility = -1;

  std::vector<std::tuple<std::string, std::vector<int>, std::string, int> > vector_integrals;

  while (getline(mastersInput, line)) {
    // get string indices

    string lineCopy = line;

    if (line.empty()){
      if(vector_integrals.size()>0){
        vector_equations.push_back(vector_integrals);
      }
      vector_integrals.clear();
    }
    else{

      line.erase(remove_if(line.begin(), line.end(), ::isspace), line.end());

      // convert string indices to integer array
      size_t found;
      int indicesCounter;
      vector<int> inputSeed;
      string topo;

      /*comments parser*/
      if ((found = line.find_first_of("#")) != string::npos) {
        line = line.substr(0, found);
      }

      /*original parser*/
      if ((found = line.find_first_of("[")) != string::npos) {

        if(checkCompatibility==-1)
          checkCompatibility = 0;

        if(checkCompatibility != 0){
          logger << "Error: Seed notaition is mixed with the weight bit ";
          logger << "notation in: " << lineCopy <<"\n";
          exit(-1);
        }

        istringstream(line.substr(0, found)) >> topo;

        line.erase(line.begin(), line.begin() + found + 1);

        if ((found = line.find_first_of("]")) == string::npos) {
          logger << "Incomplete integral in (missing ']'): " << lineCopy <<"\n";
          exit(-1);
        }

        if ((found = line.find_first_of("*")) == string::npos) {
          logger << "coefficient is missing in: " << lineCopy <<"\n";
          exit(-1);
        }

        coefficient = line.substr(found+1);

        if (coefficient.size() == 0) {
          logger << "Missing coefficient in: " << lineCopy <<"\n";
          exit(-1);
        }

        line.erase(line.begin() + found); // indices

        if ((found = line.find_first_of(",")) != string::npos) {
          bool has_only_digits = (line.substr(0, found).find_first_not_of(
                                      "0123456789+-") == string::npos);
          if (!has_only_digits) {
            istringstream(line.substr(0, found)) >> topo;
            line = line.substr(found + 1);
          }
        }

        while ((found = line.find_first_of(",")) != string::npos) {
          istringstream(line.substr(0, found)) >> indicesCounter;
          inputSeed.push_back(indicesCounter);
          line = line.substr(found + 1);
        }

        istringstream(line) >> indicesCounter;
        inputSeed.push_back(indicesCounter);

        int sec = 0;
        int count = 0;
        for (auto it : inputSeed) {
          if (it > 0) {
            sec += std::pow(2, count);
          }
          count++;
        }
        vector_integrals.push_back(make_tuple(topo, inputSeed, coefficient, sec));
      }
      /*weigth bit parser*/
      else if((found = line.find_first_of("*")) != string::npos){
        if(checkCompatibility==-1)
          checkCompatibility = 1;

        if(checkCompatibility != 1){
          logger << "Error: Weight bit notaition is mixed with the seed ";
          logger << "notation in: " << lineCopy <<"\n";
          exit(-1);
        }

        coefficient = line.substr(found);

        if (coefficient.size() == 0) {
          logger << "Missing coefficient in: " << lineCopy <<"\n";
          exit(-1);
        }

        line.erase(line.begin() + found); // weight

        if(line.find_first_not_of("0123456789") != string::npos){
          logger << "Wrong weight bit notation in: " << lineCopy <<"\n";
          exit(-1);
        }
        /*if inputSeed is empty, then topo is the weight bit*/
        vector_integrals.push_back(make_tuple(line, inputSeed, coefficient, 1));
      }
    }
  }
  if(vector_integrals.size()>0){
    vector_equations.push_back(vector_integrals);
  }
  vector_integrals.clear();
}


void Kira::read_integrals(
    std::string fileMasters,
    std::vector<std::tuple<std::string, std::vector<int>, std::string, int> >&
        arraySeed) {

  ifstream mastersInput;
  mastersInput.open(fileMasters);

  string line;
  string coefficient;

  logger.set_level(2);

  while (getline(mastersInput, line)) {
    // get string indices

    line.erase(remove_if(line.begin(), line.end(), ::isspace), line.end());

    // convert string indices to integer array
    size_t found;
    int indicesCounter;
    vector<int> inputSeed;
    string topo;

    /*comments parser*/
    if ((found = line.find_first_of("#")) != string::npos) {
      logger << "skip this line: " << line << "\n";

      line = line.substr(0, found);
    }

    /*original parser*/

    if ((found = line.find_first_of("[")) == string::npos) {
      logger << "skip this line: " << line << "\n";
      continue;
    }
    istringstream(line.substr(0, found)) >> topo;

    line.erase(line.begin(), line.begin() + found + 1);

    if ((found = line.find_first_of("]")) == string::npos) {
      logger << "skip this line: " << line << "\n";
      continue;
    }

    coefficient = line.substr(found+1);

    if (coefficient.size() == 0) {
      coefficient = "1";
    }

    if (coefficient.size() > 1) {

//       coefficient.erase(coefficient.begin());
      size_t coefFound;

      if (((coefFound = coefficient.find_first_of("*")) != string::npos) &&
          coefFound == 0) {

        coefficient.erase(coefficient.begin());
      }
      else{
        logger << "Wrong file input. * symbol is missing to identify the coefficient\n";
        exit(-1);
      }
    }

    line.erase(line.begin() + found); // indices

    if ((found = line.find_first_of(",")) != string::npos) {
      bool has_only_digits = (line.substr(0, found).find_first_not_of(
                                  "0123456789+-") == string::npos);
      if (!has_only_digits) {
        istringstream(line.substr(0, found)) >> topo;
        line = line.substr(found + 1);
      }
    }

    while ((found = line.find_first_of(",")) != string::npos) {
      istringstream(line.substr(0, found)) >> indicesCounter;
      inputSeed.push_back(indicesCounter);
      line = line.substr(found + 1);
    }

    istringstream(line) >> indicesCounter;
    inputSeed.push_back(indicesCounter);

    int sec = 0;
    int count = 0;
    for (auto it : inputSeed) {
      if (it > 0) {
        sec += std::pow(2, count);
      }
      count++;
    }
    arraySeed.push_back(make_tuple(topo, inputSeed, coefficient, sec));
  }

  logger.set_level(1);
}

void Kira::preferred_masters(std::string fileMasters) {
  /*missing check if preferred master was already defined*/
  if (!file_exists((outputDir + "/results/preferredMasters").c_str())) {
    if (file_exists(fileMasters.c_str())) {

      std::ifstream src(fileMasters, std::ios::binary);
      std::ofstream dst((outputDir + "/results/preferredMasters"),
                        std::ios::binary);

      dst << src.rdbuf();

      read_integrals(fileMasters, preferredMasterSectors);
    }
    else
      std::ofstream dst((outputDir + "/results/preferredMasters").c_str());
  }
  else{
    read_integrals((outputDir + "/results/preferredMasters"), preferredMasterSectors);
  }
}


void Kira::write_amplitude_file(pyred::intid generateID, std::vector<std::tuple<std::string, std::vector<int>, std::string, int> >& equation, std::string& amplitudeFile,int weightFlag){

  std::ofstream output(amplitudeFile);

  if(weightFlag == 0){
    output << "FORMFACTOR[1]*(-1)\n";
    for (auto itMI : equation) {

      output << get<0>(itMI) << "[";
      int check = 0;
      for(auto it: get<1>(itMI)){
        if(check++ == 0)
          output << it;
        else
          output << "," << it;
      }
      output << "]*(" << get<2>(itMI) << ")\n";

    }
  }
  else{
    output << generateID << "*(-1)\n";
    for (auto itMI : equation) {
      auto igl =
          pyred::Integral(topology[get<0>(itMI)].topology, get<1>(itMI));

      pyred::intid ID = igl.to_weight();
      if (pyred::Integral::is_zero(ID)) {
        logger << "integral is zero: " << get<0>(itMI)<< igl.m_powers << " this is an error? This integral is ignored.\n";
        continue;
      }
      output << ID << "*(" << get<2>(itMI) << ")\n";
    }
  }
}

void Kira::execute_jobs() {
  check_config_file(jobName, "Missing job file: ");

  Node doc3 = LoadFile(jobName.c_str());

  int initiateSeedsOnce = 1;

  for (size_t it = 0; it < doc3["jobs"].size(); it++) {
    if (!(doc3["jobs"][it]["merge"])) continue;

    logger << "\n*****Kira will merge the following database files*********\n";
    Merge merge = doc3["jobs"][it]["merge"].as<Merge>();
    if (merge.outputDir.size() != 0)
      outputDir = merge.outputDir;
    else
      outputDir = ".";

    for (auto it : merge.files2merge) {
      if (!file_exists(it.c_str())) {
        logger << "ERROR: file: " << it << " does not exist.\n";
        exit(0);
      }
      else
        logger << it << "\n";
    }

    if (mkpath(const_cast<char*>((outputDir + "/results/").c_str()),
               S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
      logger << "Kira failed to create" << (outputDir + "/results").c_str()
             << "\n";
      exit(0);
    }
    ifstream file2;
    file2.open(outputDir + "/results/kira.db");

    if (file2.fail()) {
      logger << "fail.\n";
    }
    DataBase* database = new DataBase(outputDir + "/results/kira.db");
    database[0].merge_databases(merge.files2merge);
    delete database;
  }

  read_kinematics(0);
  init_kinematics();

  for (size_t it = 0; it < doc3["jobs"].size(); it++) {
    if (!(doc3["jobs"][it]["dgl"])) continue;

    Dgl dgl = doc3["jobs"][it]["dgl"].as<Dgl>();


//     if (jobs.outputDir.size() != 0)
//       outputDir = jobs.outputDir;
//     else
      outputDir = ".";

    logger << "The directories for the temporary files, result files and the \n"
              "sector mapping files are: \n";
    logger << outputDir << "/tmp\n";
    logger << outputDir << "/results\n";
    logger << outputDir << "/sectormappings\n";



    if (mkpath(const_cast<char*>((outputDir + "/tmp/").c_str()),
                S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
      logger << "Kira failed to create" << (outputDir + "/tmp").c_str() << "\n";
      exit(0);
    }
    if (mkpath(const_cast<char*>((outputDir + "/results/").c_str()),
               S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
      logger << "Kira failed to create" << (outputDir + "/results").c_str()<<"\n";
      exit(0);
    }
    if (mkpath(const_cast<char*>((outputDir + "/sectormappings/").c_str()),
               S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
      logger << "Kira failed to create"
             << (outputDir + "/sectormappings").c_str() << "\n";
      exit(0);
    }

    read_integralfamilies(0);
    init_integralfamilies();

    for (unsigned itC = 0; itC < collectReductions.size(); itC++) {

      integralfamily = topology[collectReductions[itC]];

      initiate_fermat(0, 1, 1);

      get_topology_relations();

      generate_dgl();

      destroy_fermat(1, 1);
    }
    for (auto itFile : dgl.filesDGL) {
      auto seedsDGL = read_seeds_dgl(itFile);

      insert_seeds2DGL(seedsDGL);
    }
  }

  for (size_t it = 0; it < doc3["jobs"].size(); it++) {

    if (!((doc3["jobs"][it]["reduce_sectors"])))
      continue;

    kiraMode = "reduce_sectors";

    Jobs jobs = doc3["jobs"][it][kiraMode].as<Jobs>();

    if (jobs.outputDir.size() != 0)
      outputDir = jobs.outputDir;
    else
      outputDir = ".";

    logger << "The directories for the temporary files, result files and the "
              "sector mapping files are: \n";

    if(jobs.fileAmplitude.size()>0)
      logger << outputDir << "/input_kira\n";

    if(jobs.level != std::numeric_limits<int>::max()){
      logger << outputDir << "/input_kira\n";
    }
    else{
      logger << outputDir << "/tmp\n";
    }
    logger << outputDir << "/results\n";
    logger << outputDir << "/sectormappings\n";

    if(jobs.fileAmplitude.size()>0){
      if (mkpath(const_cast<char*>((outputDir + "/input_kira/").c_str()),
                S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
        logger << "Kira failed to create" << (outputDir + "/input_kira").c_str() << "\n";
        exit(0);
      }
    }

    /*input system*/
    if(jobs.level != std::numeric_limits<int>::max()){
      if (mkpath(const_cast<char*>((outputDir + "/input_kira/").c_str()),
                S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
        logger << "Kira failed to create" << (outputDir + "/input_kira").c_str() << "\n";
        exit(0);
      }
    }
    else{
      if (mkpath(const_cast<char*>((outputDir + "/tmp/").c_str()),
                S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
        logger << "Kira failed to create" << (outputDir + "/tmp").c_str() << "\n";
        exit(0);
      }
    }
    if (mkpath(const_cast<char*>((outputDir + "/results/").c_str()),
               S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
      logger << "Kira failed to create" << (outputDir + "/results").c_str()
             << "\n";
      exit(0);
    }
    if (mkpath(const_cast<char*>((outputDir + "/sectormappings/").c_str()),
               S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
      logger << "Kira failed to create"
             << (outputDir + "/sectormappings").c_str() << "\n";
      exit(0);
    }

    selectMastersReduction = jobs.selectMastersReduction;
    iterativeReduction = jobs.iterativeReduction;
    trimmedReduction = jobs.trimmedReduction;

    int reductionMask = 0;
    dataFile = 0;
    writeNumericalSystem = 0;
    pyredDatabase = 1;
    algebraicReconstruction = 0;
    LIflag = true;
    if (selectMastersReduction.size() > 0 || trimmedReduction.size() > 0)
      conditionalSystem = 0;
    else
      conditionalSystem = 1;

    if (jobs.runInitiate == "true") {
      reductionMask |= 1 << INIT;
    }
    if (jobs.pyredDatabase == "true") {
      pyredDatabase = 4;
    }
    if (jobs.runTriangular == "true" || jobs.runTriangular == "sectorwise") {
      reductionMask |= 1 << TRIANG;
    }
    if (jobs.runBacksubstitution == "true") {
      reductionMask |= 1 << BACKSUBS;
    }
    if (jobs.LIflag == "false") {
      LIflag = false;
    }
    if (jobs.runSymmetries == "true") {
      reductionMask |= 1 << SYMMETRY;
    }
    if (jobs.dataFile == "true") {
      logger << "Human readable data file (kira) and (id2int) is enabled\n";
      dataFile = 1;
    }
    if (jobs.writeNumericalSystem == "true") {
      writeNumericalSystem = 1;
    }
    if (jobs.conditional == "false") {
      conditionalSystem = 0;
    }
    else if (jobs.conditional == "true") {
      conditionalSystem = 1;
    }
    else if (jobs.algebraicReconstruction == "true") {
      algebraicReconstruction = 1;
    }
    if (integralOrdering != 9 && jobs.integralOrdering != 9 &&
        jobs.integralOrdering != integralOrdering) {
      logger << "ERROR: Your command line integral ordering: "
             << integralOrdering << "  differs from\n";
      logger << "the integral ordering from your job file: "
             << jobs.integralOrdering << ".\n";
      exit(-1);
    }

    if (integralOrdering == 9 && jobs.integralOrdering != integralOrdering)
      integralOrdering = jobs.integralOrdering;

    read_integralfamilies(0);
    init_integralfamilies();

    collect_reductions(jobs);

    initiate_fermat(0, 1, 1);

    get_topology_relations();

    destroy_fermat(1, 1);

    if (initiateSeedsOnce &&
        ((reductionMask >> BACKSUBS) & 1 || (reductionMask >> TRIANG) & 1 ||
         (reductionMask >> INIT) & 1 || (reductionMask >> PYRED) & 1 ||
         jobs.fileDenominators.size() > 0 ||
         !reductionMask)) {
      logger
          << "\n*****Integral ordering*************************************\n";

      DataBase* database = new DataBase(outputDir + "/results/kira.db");

      int tmpIntegralOrdering = database[0].get_integral_ordering();

      if (integralOrdering == 9 && tmpIntegralOrdering != 0) {
        integralOrdering = tmpIntegralOrdering;
      }

      if (integralOrdering == 9 && tmpIntegralOrdering == 0) {
        integralOrdering = 1; // set default value
      }

      if (tmpIntegralOrdering == 0) {
        database[0].create_weight_bits_table();
        database[0].create_integral_ordering_table();
        database[0].save_integral_ordering(integralOrdering);
      }
      else if (tmpIntegralOrdering != integralOrdering) {
        logger << "ERROR: Your integral ordering: " << integralOrdering
               << "  differs from\n";
        logger << "integral ordering:  " << tmpIntegralOrdering
               << "  which was used in the last Kira run.\n";
        exit(-1);
      }

      database[0].finalize();
      delete database;

      logger << "Kira will use the integral ordering: " << integralOrdering
             << ".\n";

      sectorOrdering = 1;
      if (integralOrdering > 4 && integralOrdering < 9) {
        sectorOrdering = 2;
        integralOrdering -= 4;
      }

      // verbosity>=2 prints the sector during equations generation.
      pyred::Config::verbosity(2);
      pyred::Config::johanntrick(true);

      // parallel = 0 means automatic (std::thread::hardware_concurrency());
      // for large systems it is more efficient to not count hyperthreading
      // "cores".
      int parallel{coreNumber};
      pyred::Config::parallel(parallel);
      pyred::Config::lookahead(-1);
      pyred::Config::insertion_tracer(pyredDatabase);
      if (file_exists((outputDir + "/results/insertions.db").c_str()))
        remove((outputDir + "/results/insertions.db").c_str());
      if (file_exists((outputDir + "/results/insertions.kb").c_str()))
        remove((outputDir + "/results/insertions.kb").c_str());
      pyred::Config::database_file((outputDir + "/results/insertions"));

      preferred_masters(jobs.masters);

      pyred::Integral::setup(
          sectorOrdering, integralOrdering, ("./config"),
          (outputDir + "/sectormappings"),
          (outputDir +
           "/results/preferredMasters") /*,(outputDir+"/masters3")!!!*/,
          LIflag);

      string nameI = "INTEGRALORDERING";
      string nameW = "WEIGHTBITS";

      database = new DataBase(outputDir + "/results/kira.db");
      DataBase* database2 = new DataBase(outputDir + "/results/kira.db");
      DataBase* database3 = new DataBase(outputDir + "/results/kira.db");

      if (!(database[0].checkTable(nameI) && !database2[0].checkTable(nameW))) {
        vector<uint32_t> weightBits;
        if (database3[0].table_weight_bits_empty()) {
          std::vector<pyred::SeedSpec> initiateMAN;
          for (unsigned itC = 0; itC < collectReductions.size(); itC++) {
            integralfamily = topology[collectReductions[itC]];
            select_initial_integrals(initiateMAN);
          }
          weightBits = pyred::Integral::assign_weight_bits(initiateMAN);
          database3[0].save_weight_bits(weightBits);
        }
        else {
          database3[0].get_weight_bits(weightBits);
          pyred::Integral::assign_weight_bits(weightBits);
        }
      }
      else {
        logger << "Since automatic weight bits were switched off before, thus "
                  "automatic weightbits are switched off now.\n";
      }

      initiateSeedsOnce = 0;

      database[0].finalize();
      delete database;

      database2[0].finalize();
      delete database2;

      delete database3;
    }

    for (unsigned itC = 0; itC < collectReductions.size(); itC++) {

      if(jobs.fileAmplitude.size()>0){
        mkdir((outputDir + "/input_kira/" + collectReductions[itC]).c_str(),
              S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
      }

      if(jobs.level != std::numeric_limits<int>::max()){
        /*input system*/
        mkdir((outputDir + "/input_kira/" + collectReductions[itC]).c_str(),
              S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
      }
      else{
        mkdir((outputDir + "/tmp/" + collectReductions[itC]).c_str(),
              S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
      }
      mkdir((outputDir + "/results/" + collectReductions[itC]).c_str(),
            S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    }

#ifdef KIRAFIREFLY
    /*Prepare prefactors to insert into the reduction over the finite fields*/
    for (auto file : jobs.filePrefactors) {
      multiply_factors = true; // TODO do only once

      vector<vector<tuple<string, vector<int>, string, int> > > vector_equations;

      read_equations(file, vector_equations);

      for(auto equation :vector_equations){

        map<pyred::intid,string> equationMap;

        if(equation.size() > 0 && pyred::parse_coeff<pyred::Coeff_int>(get<2>(equation[0])) != pyred::Coeff_int(1)){
          logger << "Error: the first coefficient in the equation insert_prefactors must be 1.\n";
          exit(-1);
        }

        for(auto integral: equation){

          pyred::intid ID;
          if(get<1>(integral).size()>0){
            auto igl =
              pyred::Integral(topology[get<0>(integral)].topology, get<1>(integral));
            ID = igl.to_weight();

            if (pyred::Integral::is_zero(ID)) {
              logger << "integral is zero: " << get<0>(integral)<< igl.m_powers << " this is an error? This integral is ignored.\n";
              continue;
            }
          }
          else{
            istringstream(get<0>(integral)) >> ID;
          }
          equationMap.insert(make_pair(ID,get<2>(integral)));
        }
        prefactorEquations.insert(make_pair(equationMap.rbegin()->first,equationMap));
      }
    }
#endif

    /*Amplitude is translated into the weigthbit notation*/
    for (auto file : jobs.fileAmplitude) {

      vector<vector<tuple<string, vector<int>, string, int> > > vector_equations;

      read_equations(file, vector_equations);

      logger
          << "\n***********************************************************\n";
      logger << "Loaded amplitude: "<<file << "\n";
      logger << "Translate the amplitude into the weight notation.";
      logger
          << "\n***********************************************************\n";

      vector<pyred::intid> mandatory;
      vector<pyred::intid> optional;
      int translateFlag = 1;
      pyred::intid generateID;
      string fileString = outputDir+"/input_kira/amplitude";

      for (unsigned itD = 0; itD < collectReductions.size(); itD++) {
        integralfamily = topology[collectReductions[itD]];
        select_equations(mandatory, optional, itD, jobs, 0);
      }

      logger <<"The biggest ID your generated system has : " << mandatory.back() << "\n\n";


      for(size_t eqNumber = 0; eqNumber < vector_equations.size(); eqNumber++){

        auto equation = vector_equations[eqNumber];

        if(!file_exists(fileString.c_str())){

          generateID = std::numeric_limits<pyred::intid>::max()-1;
        }
        else{
          logger << "The backup file " << fileString << " exists, lets take a peak\n\n";

          vector<tuple<pyred::intid, string, uint32_t> > stats;

          ifstream input(fileString.c_str());
          while (1) {
            pyred::intid ID;
            string fileName;
            uint32_t fileNumber;

            if (!(input >> ID)) break;
            if (!(input >> fileName)) break;
            if (!(input >> fileNumber)) break;
            stats.push_back(make_tuple(ID,fileName,fileNumber));
          }
          input.close();

          for(auto itStats: stats){
            if(get<1>(itStats) == file && get<2>(itStats) == eqNumber){
              logger << "This amplitude was already translated:\n";
              logger << get<0>(itStats) << " " << get<1>(itStats) << " " << get<2>(itStats) << "\n";
              translateFlag = 0;
            }
          }
          if(translateFlag==1){

            generateID = std::numeric_limits<pyred::intid>::max()-1;
            while(1){
              int flagExists = 0;
              for(auto itStats: stats){
                if(get<0>(itStats)==generateID){
                  flagExists = 1;
                }
              }
              if(flagExists){
                generateID-=1;
              }
              else{
                break;
              }
            }
          }
        }
        if(translateFlag == 1){

          string outputAmplitudeFile = outputDir+"/input_kira/amplitude_"+to_string(generateID);

          logger << "The amplitude is written to file: " << outputAmplitudeFile << "\n";
          tuple<string,uint32_t,uint32_t> integral;
          get_properties(generateID,integral);

          write_amplitude_file(generateID,equation,outputAmplitudeFile,jobs.weightMode);

          logger << "The amplitudes id number is: " << generateID << "\n";
          ofstream output(fileString, std::fstream::app);
          output << generateID << " " << file << " " << eqNumber << "\n";
        }
      }
    }



    for (auto file : jobs.fileDenominators) {
      vector<tuple<string, vector<int>, string, int> > arraySeed;
      read_integrals(file, arraySeed);
      logger << "Loaded denominators:\n";
      for (auto itMI : arraySeed) {
        logger << get<0>(itMI) << "[";
        for (auto itVI : get<1>(itMI)) {
          logger << " " << itVI;
        }
        logger << "]\n";
      }
      logger << "\n";

      vector<pyred::intid> idOfSeed;

      for (auto itMI : arraySeed) {
        auto igl =
            pyred::Integral(topology[get<0>(itMI)].topology, get<1>(itMI));

        pyred::intid ID = igl.to_weight();
        if (pyred::Integral::is_zero(ID)) {
          logger << "integral is zero: " << igl.m_powers << " this is an error?\n";
          exit(1);
        }
        idOfSeed.push_back(ID);
      }

      DataBase* databaseDen = new DataBase(outputDir + "/results/kiraDen.db");
      databaseDen->create_equation_table();

      databaseDen->begin_transaction();

      for (size_t itA = 0; itA < idOfSeed.size(); itA++) {
        databaseDen->prepare_backsubstitution();
        databaseDen->bind_denominators(idOfSeed[itA], get<2>(arraySeed[itA]),
                                       idOfSeed.size(), idOfSeed[0]);
      }
      databaseDen->commit_transaction();
      delete databaseDen;
    }

    for (unsigned itC = 0; itC < collectReductions.size(); itC++) {

      if(jobs.fileDenominators.size()>0)
        continue;

      integralfamily = topology[collectReductions[itC]];

      if (integralfamily.sector2Reduce.size() == 0) continue;

      logger
          << "\n***********************************************************\n";
      logger << "Kira starts the reduction of the topology: "
             << collectReductions[itC] << "\n";
      logger << "***********************************************************\n";

      if ((reductionMask >> INIT) & 1 || !reductionMask) {
        string checkSetUp =
            outputDir + "/tmp/" + collectReductions[itC] + "/SYSTEMconfig";

        if (file_exists(checkSetUp.c_str()) && !conditionalSystem) {
          logger << "Kira generated already in a previous run this system of "
                    "equations.\n";
          logger << "You hvae multiple choices now:\n";
          logger << "Chase 1:\n  Set \"conditional: true\" in your " << jobName
                 << " file to resume\n";
          logger << "  a previously aborted reduction process."
                 << "\n";
          logger << "Chase 2:\n  Delete all SYSTEM files in the " << outputDir
                 << "/tmp/" << collectReductions[itC] << " directory first,\n";
          logger << "  if you need to generate the setup system of equations "
                    "again.\n";
            logger << "Chase 3:\n  Maybe you wanted to initiate the option "
                      "\"run_triangular: true\"\n";
            logger << "  instead of \"run_initiate: true\" in your " << jobName
                   << " file?\n";

          exit(0);
        }

        if (!file_exists(checkSetUp.c_str())) {
          vector<pyred::intid> mandatory;
          vector<pyred::intid> optional;

          if(jobs.level != std::numeric_limits<int>::max()) {
            /*need to select all integrals for all topologies to generate the input system. else the symmetries are overlooked*/
            for (unsigned itD = 0; itD < collectReductions.size(); itD++) {
              select_equations(mandatory, optional, itD, jobs, 0);
            }
          }
          else{
            select_equations(mandatory, optional, itC, jobs, 0);
          }

          write_seeds_to_disk(mandatory);

          initiate_fermat(0, 1, 0);

          if(jobs.level != std::numeric_limits<int>::max()) {
            generate_input_system(mandatory, jobs.level, jobs.weightMode);
          }
          else{
            generate_SOE(mandatory);
          }

          destroy_fermat(1, 0);
        }
      }

      if(jobs.level != std::numeric_limits<int>::max() || jobs.fileAmplitude.size()>0) {
        topology[integralfamily.name] = integralfamily;
        mastersSetZero.clear();
        masterVectorSkip.clear();
        continue;
      }

      set_masters2zero();

#ifdef KIRAFIREFLY
      vector<pyred::intid> mandatory;
      vector<pyred::intid> optional;

      if (jobs.ff_recon == "true") {
        select_equations(mandatory, optional, itC, jobs, 0);

        int factor_scan = -1;
        if (jobs.factor_scan == "true") {
          factor_scan = 1;
        }
        else if (jobs.factor_scan == "false") {
          factor_scan = 0;
        }

        run_firefly(mandatory, 0, collectReductions[itC], factor_scan);
      }
#endif

#ifndef KIRAFIREFLY
      if (((reductionMask >> TRIANG) & 1 || !reductionMask))
#else
      if (((reductionMask >> TRIANG) & 1 || !reductionMask) &&
          jobs.ff_recon != "true")
#endif

      {
        string checkSetUp =
            outputDir + "/tmp/" + collectReductions[itC] + "/VERconfig";

        if (file_exists(checkSetUp.c_str()) && !conditionalSystem) {
          logger << "Kira generated already in a previous run the triangular "
                    "form for\n";
          logger << "this system of equations.\n";
          logger << "You hvae multiple choices now:\n";
          logger << "Chase 1:\n  Set \"conditional: true\" in your " << jobName
                 << " file to resume\n";
          logger << "  a previously aborted reduction process."
                 << "\n";
          logger << "Chase 2:\n  Delete all VER files in the " << outputDir
                 << "/tmp/" << collectReductions[itC] << " directory first,\n";
          logger << "  if you need to generate the triangular form for this "
                    "system of equations\n";
          logger << "  again.\n";
          logger << "Chase 3:\n  Maybe you wanted to initiate the option "
                    "\"run_back_substitution: true\"\n";
          logger << "  instead of \"run_triangular: true\" in your " << jobName
                 << " file?\n";
          exit(0);
        }

        if (!file_exists(checkSetUp.c_str())) {
#ifndef KIRAFIREFLY
          vector<pyred::intid> mandatory;
          vector<pyred::intid> optional;
#endif
          initiate_fermat(0, 0, 0);
          select_equations(mandatory, optional, itC, jobs, 0);
          if (jobs.runTriangular == "sectorwise")
            complete_triangularSW(mandatory);
          else
            complete_triangular(mandatory);

          destroy_fermat(0, 0);
        }
      }

#ifndef KIRAFIREFLY
      if (((reductionMask >> BACKSUBS) & 1 || !reductionMask)) {
        initiate_fermat(0, 0, 0);
        complete_reduction();
        destroy_fermat(0, 0);
      }
#else
      if (((reductionMask >> BACKSUBS) & 1 || !reductionMask) &&
          (jobs.ff_recon != "true" || jobs.ff_recon != "back")) {
        initiate_fermat(0, 0, 0);
        complete_reduction();
        destroy_fermat(0, 0);
      }
      else if (jobs.ff_recon == "back") {
        if (mandatory.empty()) {
          select_equations(mandatory, optional, itC, jobs, 0);
        }

        int factor_scan = -1;
        if (jobs.factor_scan == "true") {
          factor_scan = 1;
        }
        else if (jobs.factor_scan == "false") {
          factor_scan = 0;
        }

        run_firefly(mandatory, 1, collectReductions[itC], factor_scan);
      }
#endif

      topology[collectReductions[itC]] = integralfamily;
      mastersSetZero.clear();
      masterVectorSkip.clear();
    }
    selectMastersReduction.clear();
    trimmedReduction.clear();

    denTPlus.clear();
    den.clear();
    num.clear();
    numMin.clear();
    reductVar.clear();
    destroy_integralfamilies();
  }

  for (size_t it = 0; it < doc3["jobs"].size(); it++) {
    if (!((doc3["jobs"][it]["reduce_user_defined_system"]))) continue;

    kiraMode = "reduce_user_defined_system";

    Jobs jobs = doc3["jobs"][it][kiraMode].as<Jobs>();

    if (jobs.outputDir.size() != 0)
      outputDir = jobs.outputDir;
    else
      outputDir = ".";

    logger << "The directories for the temporary files, result files and the "
              "sector mapping files are: \n";

    if(jobs.fileAmplitude.size()>0)
      logger << outputDir << "/input_kira\n";
    if(jobs.level != std::numeric_limits<int>::max()){
      logger << outputDir << "/input_kira\n";
    }
    else{
      logger << outputDir << "/tmp\n";
    }
    logger << outputDir << "/results\n";
    logger << outputDir << "/sectormappings\n";


    if(jobs.fileAmplitude.size()>0){
      if (mkpath(const_cast<char*>((outputDir + "/input_kira/").c_str()),
                S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
        logger << "Kira failed to create" << (outputDir + "/input_kira").c_str() << "\n";
        exit(0);
      }
    }

    /*input system*/
    if(jobs.level != std::numeric_limits<int>::max()){
      if (mkpath(const_cast<char*>((outputDir + "/input_kira/").c_str()),
                S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
        logger << "Kira failed to create" << (outputDir + "/input_kira").c_str() << "\n";
        exit(0);
      }
    }
    else{
      if (mkpath(const_cast<char*>((outputDir + "/tmp/").c_str()),
                S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
        logger << "Kira failed to create" << (outputDir + "/tmp").c_str() << "\n";
        exit(0);
      }
    }
    if (mkpath(const_cast<char*>((outputDir + "/results/").c_str()),
               S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
      logger << "Kira failed to create" << (outputDir + "/results").c_str()
             << "\n";
      exit(0);
    }
    if (mkpath(const_cast<char*>((outputDir + "/sectormappings/").c_str()),
               S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH) == -1) {
      logger << "Kira failed to create"
             << (outputDir + "/sectormappings").c_str() << "\n";
      exit(0);
    }

    selectMastersReduction = jobs.selectMastersReduction;
    iterativeReduction = jobs.iterativeReduction;
    trimmedReduction = jobs.trimmedReduction;

    int reductionMask = 0;
    dataFile = 0;
    writeNumericalSystem = 0;
    pyredDatabase = 1;
    magicRelations = 0;
    algebraicReconstruction = 0;
    LIflag = true;
    if (selectMastersReduction.size() > 0 || trimmedReduction.size() > 0)
      conditionalSystem = 0;
    else
      conditionalSystem = 1;

    if (jobs.runInitiate == "true") {
      reductionMask |= 1 << INIT;
    }
    if (jobs.pyredDatabase == "true") {
      pyredDatabase = 4;
    }
    if (jobs.runTriangular == "true" || jobs.runTriangular == "sectorwise") {
      reductionMask |= 1 << TRIANG;
    }
    if (jobs.runBacksubstitution == "true") {
      reductionMask |= 1 << BACKSUBS;
    }
    if (jobs.LIflag == "false") {
      LIflag = false;
    }
    if (jobs.runSymmetries == "true") {
      reductionMask |= 1 << SYMMETRY;
    }
    if (jobs.dataFile == "true") {
      logger << "Human readable data file (kira) and (id2int) is enabled\n";
      dataFile = 1;
    }
    if (jobs.writeNumericalSystem == "true") {
      writeNumericalSystem = 1;
    }
    if (jobs.conditional == "false") {
      conditionalSystem = 0;
    }
    else if (jobs.conditional == "true") {
      conditionalSystem = 1;
    }
    else if (jobs.algebraicReconstruction == "true") {
      algebraicReconstruction = 1;
    }
    if (integralOrdering != 9 && jobs.integralOrdering != 9 &&
        jobs.integralOrdering != integralOrdering) {
      logger << "ERROR: Your command line integral ordering: "
             << integralOrdering << "  differs from\n";
      logger << "the integral ordering from your job file: "
             << jobs.integralOrdering << ".\n";
      exit(-1);
    }

    if (integralOrdering == 9 && jobs.integralOrdering != integralOrdering)
      integralOrdering = jobs.integralOrdering;

    if(jobs.config == 1){
      read_integralfamilies(1);
      init_integralfamilies();
    }
    else{
      integralfamily.jule = 0;
    }

    collect_reductions(jobs);

    initiate_fermat(0, 1, 1);

    get_topology_relations();

    destroy_fermat(1, 1);


    pyred::System sys;

    int variante = 1;

    if (initiateSeedsOnce &&
        ((reductionMask >> BACKSUBS) & 1 || (reductionMask >> TRIANG) & 1 ||
         (reductionMask >> INIT) & 1 || (reductionMask >> PYRED) & 1 ||
         !reductionMask)) {
      logger
          << "\n*****Integral ordering*************************************\n";

      DataBase* database = new DataBase(outputDir + "/results/kira.db");

      int tmpIntegralOrdering = database[0].get_integral_ordering();

      if (integralOrdering == 9 && tmpIntegralOrdering != 0) {
        integralOrdering = tmpIntegralOrdering;
      }

      if (integralOrdering == 9 && tmpIntegralOrdering == 0) {
        integralOrdering = 1; // set default value
      }

      if (tmpIntegralOrdering == 0) {
        database[0].create_weight_bits_table();
        database[0].create_integral_ordering_table();
        database[0].save_integral_ordering(integralOrdering);
      }
      else if (tmpIntegralOrdering != integralOrdering) {
        logger << "ERROR: Your integral ordering: " << integralOrdering
               << "  differs from\n";
        logger << "integral ordering:  " << tmpIntegralOrdering
               << "  which was used in the last Kira run.\n";
        exit(-1);
      }

      logger << "Kira will use the integral ordering: " << integralOrdering
             << ".\n";

      sectorOrdering = 1;
      if (integralOrdering > 4 && integralOrdering < 9) {
        sectorOrdering = 2;
        integralOrdering -= 4;
      }

      // verbosity>=2 prints the sector during equations generation.
      pyred::Config::verbosity(2);
      // parallel = 0 means automatic (std::thread::hardware_concurrency());
      // for large systems it is more efficient to not count hyperthreading
      // "cores".
      int parallel{coreNumber};
      pyred::Config::parallel(parallel);
      pyred::Config::lookahead(-1);
      pyred::Config::insertion_tracer(pyredDatabase);
      if (file_exists((outputDir + "/results/insertions.db").c_str()))
        remove((outputDir + "/results/insertions.db").c_str());
      if (file_exists((outputDir + "/results/insertions.kb").c_str()))
        remove((outputDir + "/results/insertions.kb").c_str());
      pyred::Config::database_file((outputDir + "/results/insertions"));

      preferred_masters(jobs.masters);

      if (collectReductions.size() == 0 || jobs.config == 0) {


        pyred::Integral::setup(
            sectorOrdering, integralOrdering, "", "",
            (outputDir +
             "/results/preferredMasters"));

        if(jobs.inputSystem.size()>0){

          sys.file_retrieve(jobs.inputSystem, vector<string>{".kira",".kira.gz"}, {static_cast<pyred::intid>(0)}, [](pyred::eqdata &&){});

          if(pyred::Integral::np() == 0){
            sys = pyred::System();
          }
          else{
            sys = pyred::System(jobs.inputSystem);
          }
        }
        else if(get<0>(jobs.inputSystemTuple).size() > 0){

          sys.file_retrieve(get<0>(jobs.inputSystemTuple), vector<string>{".kira",".kira.gz"}, {static_cast<pyred::intid>(0)}, [](pyred::eqdata &&){});

          if(pyred::Integral::np() == 0 && get<2>(jobs.inputSystemTuple) == 1 ){

            sys = pyred::System();

            if(get<1>(jobs.inputSystemTuple) != std::numeric_limits<pyred::intid>::max() )
            {
              sys.reserve(get<1>(jobs.inputSystemTuple));
            }
          }
          else{
            sys = pyred::System(get<0>(jobs.inputSystemTuple));

          }
        }
        variante = 1;
      }
      else {
        pyred::Integral::setup(
            sectorOrdering, integralOrdering, "./config",
            (outputDir + "/sectormappings"),
            (outputDir +
             "/results/preferredMasters"), /*use_li*/ true);

        if(jobs.inputSystem.size()>0){
          sys = pyred::System(jobs.inputSystem);
        }
        else if(get<0>(jobs.inputSystemTuple).size() > 0){

          if(get<2>(jobs.inputSystemTuple) == 1){

            sys = pyred::System();

            if(get<1>(jobs.inputSystemTuple) != std::numeric_limits<pyred::intid>::max() )

              sys.reserve(get<1>(jobs.inputSystemTuple));
          }
          else{
            sys = pyred::System(get<0>(jobs.inputSystemTuple));
          }
        }
        variante = 2;
      }

      if (variante == 1) {
        int countTopology = 0;

        if(pyred::Integral::np() == 0){

          /* weight notation has no meaning for the number of propagator powers.
           * Per default all integrals belong to the same topology T and sector 1.
           * preferred masters are not supported with weight notation for a good
           * reason, see the documentation.
           */

          Integral_F integralfamilyToken;
          integralfamilyToken.name = "Tuserweight";

          integralfamilyToken.topology = countTopology;

          integralfamilyToken.jule = 1;
          integralfamilyToken.topLevelSectors.push_back(
              (1 << pyred::Integral::np()) - 1);
          topology["Tuserweight"] = integralfamilyToken;
          collectReductions.push_back("Tuserweight");
          topologyNames.push_back("Tuserweight");
          logger << "Defined topology " << "Tuserweight" << "\n";
          countTopology++;
          string BASISLC = "BASISLC";

          if (topologyNames.size() > 0)
            topologyNames.push_back(BASISLC);

          logger << "number of predefined topologies: "
                << pyred::Topology::get_topologies().size() << "\n";

          ofstream fileTopologyOrdering(
              (outputDir + "/sectormappings/topology_ordering"));

          for (size_t itC = 0; itC < collectReductions.size(); itC++) {
            fileTopologyOrdering << "Tuserweight";
            fileTopologyOrdering << " " << 1 << endl;
          }
        }
        else{
          for (const auto& topoptr : pyred::Topology::get_topologies()) {
            Integral_F integralfamilyToken;

            if(topoptr->name()=="Tuserweight"){
              logger << "The topology Tuserweight is reserved by Kira\n";
              logger << "for the integral weight notation integrals\n";
              logger << "and is not allowed.\n";
              exit(-1);
            }

            integralfamilyToken.name = topoptr->name();

            integralfamilyToken.topology = countTopology;

            integralfamilyToken.jule = pyred::Integral::np();

            integralfamilyToken.topLevelSectors.push_back(
                (1 << pyred::Integral::np()) - 1);

            topology[topoptr->name()] = integralfamilyToken;

            collectReductions.push_back(topoptr->name());
            topologyNames.push_back(topoptr->name());

            logger << "Defined topology " << topoptr->name() << "\n";

            countTopology++;
          }

          string BASISLC = "BASISLC";

          if (topologyNames.size() > 0) {

            topologyNames.push_back(BASISLC);
          }

          logger << "number of predefined topologies: "
                << pyred::Topology::get_topologies().size() << "\n";

          ofstream fileTopologyOrdering(
              (outputDir + "/sectormappings/topology_ordering"));

          for (size_t itC = 0; itC < collectReductions.size(); itC++) {
            fileTopologyOrdering << topology[collectReductions[itC]].name;
            fileTopologyOrdering << " " << topology[collectReductions[itC]].jule
                                << endl;
          }
        }
      }
      integralfamily = topology[collectReductions[0]];

      for (auto itCS : collectReductions) {

        mkdir((outputDir + "/results/" + itCS).c_str(),
              S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);

        if(jobs.fileAmplitude.size()>0)
          mkdir((outputDir + "/input_kira/" + itCS).c_str(),
            S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);

        if(jobs.level != std::numeric_limits<int>::max()){
          /*input system*/
          mkdir((outputDir + "/input_kira/" + itCS).c_str(),
            S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
        }
        else{
          mkdir((outputDir + "/tmp/" + itCS).c_str(),
              S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
        }

      }
      database[0].finalize();
      delete database;

      string nameI = "INTEGRALORDERING";
      string nameW = "WEIGHTBITS";

      database = new DataBase(outputDir + "/results/kira.db");
      DataBase* database2 = new DataBase(outputDir + "/results/kira.db");
      DataBase* database3 = new DataBase(outputDir + "/results/kira.db");

      if (!(database[0].checkTable(nameI) && !database2[0].checkTable(nameW))) {
        vector<uint32_t> weightBits;
        if (database3[0].table_weight_bits_empty()) {
          std::vector<pyred::SeedSpec> initiateMAN;
          for (unsigned itC = 0; itC < collectReductions.size(); itC++) {
            integralfamily = topology[collectReductions[itC]];
            select_initial_integrals(initiateMAN);
          }
          weightBits = pyred::Integral::assign_weight_bits(initiateMAN);
          database3[0].save_weight_bits(weightBits);
        }
        else {
          database3[0].get_weight_bits(weightBits);
          pyred::Integral::assign_weight_bits(weightBits);
        }
      }
      else {
        logger << "Since automatic weight bits were switched off before, thus "
                  "automatic weightbits are switched off now.\n";
      }

      initiateSeedsOnce = 0;

      database[0].finalize();
      delete database;

      database2[0].finalize();
      delete database2;

      delete database3;


      initiateSeedsOnce = 0;
    }

#ifdef KIRAFIREFLY
    /*Prepare prefactors to insert into the reduction over the finite fields*/
    for (auto file : jobs.filePrefactors) {
      multiply_factors = true; // TODO do only once

      vector<vector<tuple<string, vector<int>, string, int> > > vector_equations;

      read_equations(file, vector_equations);

      for(auto equation :vector_equations){

        map<pyred::intid,string> equationMap;

        if(equation.size() > 0 && pyred::parse_coeff<pyred::Coeff_int>(get<2>(equation[0])) != pyred::Coeff_int(1)){
          logger << "Error: the first coefficient in the equation insert_prefactors must be 1.\n";
          exit(-1);
        }

        for(auto integral: equation){
          pyred::intid ID;
          if(get<1>(integral).size()>0){
            auto igl =
              pyred::Integral(topology[get<0>(integral)].topology, get<1>(integral));
            ID = igl.to_weight();

            if (pyred::Integral::is_zero(ID)) {
              logger << "integral is zero: " << get<0>(integral)<< igl.m_powers << " this is an error? This integral is ignored.\n";
              continue;
            }
          }
          else{
            istringstream(get<0>(integral)) >> ID;
          }
          equationMap.insert(make_pair(ID,get<2>(integral)));
        }
        prefactorEquations.insert(make_pair(equationMap.rbegin()->first,equationMap));
      }
    }
#endif

    if (file_exists(jobs.inputSystem.c_str()) || file_exists(get<0>(jobs.inputSystemTuple)[0].c_str())) {
      logger
          << "\n***********************************************************\n";
      logger << "Kira starts the reduction of a user defined system: ";
      if(file_exists(jobs.inputSystem.c_str())){
        logger << jobs.inputSystem << "\n";
        logger << "***********************************************************\n";
      }
      else if(file_exists(get<0>(jobs.inputSystemTuple)[0].c_str())){
        logger << "multiple files\n";
        logger << "***********************************************************\n";
      }


      if ((reductionMask >> INIT) & 1 || !reductionMask) {
        string checkSetUp =
            outputDir + "/tmp/" + integralfamily.name + "/SYSTEMconfig";

        if (file_exists(checkSetUp.c_str()) && !conditionalSystem) {
          logger << "Kira imported already last time the user defined system "
                    "of equations.\n";
          logger << "You hvae multiple choices now:\n";
          logger << "Chase 1:\n  Set \"conditional: true\" in your " << jobName
                 << " file to resume\n";
          logger << "  a previously aborted reduction process."
                 << "\n";
          logger << "Chase 2:\n  Delete all SYSTEM files in the " << outputDir
                 << "/tmp/" << integralfamily.name << " directory first,\n";
          logger << "  if you want to import the user defined system of "
                    "equations again.\n";
          logger << "Chase 3:\n  Maybe you wanted to initiate the option "
                    "\"run_triangular: true\"\n";
          logger << "  instead of \"run_initiate: true\" in your " << jobName
                 << " file?\n";
          exit(0);
        }

        if (!file_exists(checkSetUp.c_str())) {

          vector<pyred::intid> mandatory;
          vector<pyred::intid> optional;

          for (size_t itC = 0; itC < collectReductions.size(); itC++) {

            select_equations(mandatory, optional, itC, jobs, 1);
          }


          if(jobs.inputSystem.size() > 0){

            if(variante == 2 && (pyred::Integral::np() == 0 && variante == 1)){

              vector<std::string> files;
              files.push_back(jobs.inputSystem);

              run_pyred_otf(mandatory, optional, sys, files);
            }
            else{
              run_pyred(mandatory, optional, sys);
            }

          }
          if(get<0>(jobs.inputSystemTuple).size() > 0){

            if((pyred::Integral::np() == 0 && get<2>(jobs.inputSystemTuple) == 1 && variante == 1) || (get<2>(jobs.inputSystemTuple) == 1 && variante == 2)){
              run_pyred_otf(mandatory, optional, sys, get<0>(jobs.inputSystemTuple));
            }
            else{
              run_pyred(mandatory, optional, sys);
            }
          }


          invar.clear();
          ofstream fileVariables((outputDir + "/sectormappings/variables"));

          for (auto itV : pyred::CoeffHelper::invariants()) {

            invar.push_back(get_symbol(itV));
            fileVariables << itV << endl;
          }
        }
      }

      invar.clear();
      string inputNameV = (outputDir + "/sectormappings/variables");
      if (file_exists(inputNameV.c_str())) {
#ifdef KIRAFIREFLY
        symbols.clear();
#endif
        ifstream fileVariables(inputNameV);
        while (1) {
          string variable;
          if (!(fileVariables >> variable)) break;
          invar.push_back(get_symbol(variable));
#ifdef KIRAFIREFLY
          symbols.push_back(variable);
#endif
        }
      }

      if(jobs.level != std::numeric_limits<int>::max() || jobs.fileAmplitude.size()>0){
        topology[integralfamily.name] = integralfamily;
        mastersSetZero.clear();
        masterVectorSkip.clear();
        continue;
      }
      set_masters2zero();

#ifdef KIRAFIREFLY
      vector<pyred::intid> mandatory;
      vector<pyred::intid> optional;

      if (jobs.ff_recon == "true") {
        for (size_t itC = 0; itC < collectReductions.size(); itC++) {
          select_equations(mandatory, optional, itC, jobs, 1);
        }

        int factor_scan = -1;
        if (jobs.factor_scan == "true") {
          factor_scan = 1;
        }
        else if (jobs.factor_scan == "false") {
          factor_scan = 0;
        }

        run_firefly(mandatory, 0, "custom", factor_scan);
      }
#endif

#ifndef KIRAFIREFLY
      if (((reductionMask >> TRIANG) & 1 || !reductionMask))
#else
      if (((reductionMask >> TRIANG) & 1 || !reductionMask) &&
          jobs.ff_recon != "true")
#endif

      {
        string checkSetUp =
            outputDir + "/tmp/" + integralfamily.name + "/VERconfig";

        if (file_exists(checkSetUp.c_str()) && !conditionalSystem) {
          logger << "Kira generated already in a previous run the triangular "
                    "form for\n";
          logger << "this system of equations.\n";
          logger << "You hvae multiple choices now:\n";
          logger << "Chase 1:\n  Set \"conditional: true\" in your " << jobName
                 << " file to resume\n";
          logger << "  a previously aborted reduction process."
                 << "\n";
          logger << "Chase 2:\n  Delete all VER files in the " << outputDir
                 << "/tmp/" << integralfamily.name << " directory first,\n";
          logger << "  if you need to generate the triangular form for this "
                    "system of equations\n";
          logger << "  again.\n";
          logger << "Chase 3:\n  Maybe you wanted to initiate the option "
                    "\"run_back_substitution: true\"\n";
          logger << "  instead of \"run_triangular: true\" in your " << jobName
                 << " file?\n";
          exit(0);
        }

        if (!file_exists(checkSetUp.c_str())) {
#ifndef KIRAFIREFLY
          vector<pyred::intid> mandatory;
          vector<pyred::intid> optional;
#endif

          for (size_t itC = 0; itC < collectReductions.size(); itC++) {
            select_equations(mandatory, optional, itC, jobs, 1);
          }
          initiate_fermat(0, 0, 0);
          if (jobs.runTriangular == "sectorwise"){
            complete_triangularSW(mandatory);
          }
          else{
            complete_triangular(mandatory);
          }
          destroy_fermat(0, 0);
        }
      }
#ifndef KIRAFIREFLY
      if (((reductionMask >> BACKSUBS) & 1 || !reductionMask)) {

        initiate_fermat(0, 0, 0);

        complete_reduction();

        destroy_fermat(0, 0);
      }
#else
      if (((reductionMask >> BACKSUBS) & 1 || !reductionMask) &&
          (jobs.ff_recon != "true" || jobs.ff_recon != "back")) {

        initiate_fermat(0, 0, 0);

        complete_reduction();

        destroy_fermat(0, 0);
      }
      else if (jobs.ff_recon == "back") {
        for (size_t itC = 0; itC < collectReductions.size(); itC++) {
          select_equations(mandatory, optional, itC, jobs, 1);
        }

        int factor_scan = -1;
        if (jobs.factor_scan == "true") {
          factor_scan = 1;
        }
        else if (jobs.factor_scan == "false") {
          factor_scan = 0;
        }

        run_firefly(mandatory, 1, "custom", factor_scan);
      }
#endif

      topology[integralfamily.name] = integralfamily;
      mastersSetZero.clear();
      masterVectorSkip.clear();
    }
    selectMastersReduction.clear();
    trimmedReduction.clear();
    denTPlus.clear();
    den.clear();
    num.clear();
    numMin.clear();
    reductVar.clear();
    if (variante == 2) {
      destroy_integralfamilies();
    }
    if (variante == 1) {
      topology.clear();
      collectReductions.clear();
      topologyNames.clear();
    }
  }

  for (size_t it = 0; it < doc3["jobs"].size(); it++) {
    int choice = -1;
    string names[3];

    names[0] = "kira2form";
    names[1] = "kira2math";
    names[2] = "kira2file";

    if (doc3["jobs"][it][names[0]]) {
      choice = 0;
    }

    if (doc3["jobs"][it][names[1]]) {
      choice = 1;
    }

    if (doc3["jobs"][it][names[2]]) {
      choice = 2;
    }

    //     read_kinematics(0);
    //     init_kinematics();

    if (choice != -1) {
      Kira2File kira2File = doc3["jobs"][it][names[choice]].as<Kira2File>();

      if (kira2File.inputDir.size() == 0)
        inputDir = ".";
      else
        inputDir = kira2File.inputDir;

      logger << "The input directory is set to:\n";
      logger << inputDir << "/results\n";

      int weightFlag = 0;

      string inputNameT = (inputDir + "/sectormappings/topology_ordering");
      if (file_exists(inputNameT.c_str())) {
        ifstream inputT;
        inputT.open(inputNameT.c_str());
        while (1) {
          uint32_t numberofInddices;
          string nameT;
          if (!(inputT >> nameT)) break;
          if (!(inputT >> numberofInddices)) break;
          if(nameT=="Tuserweight"){
            logger << "This is a reduction with integral in weight bit notation.\n";
            logger << "The only topology allowed is called Tuserweight automatically by Kira.\n";
            weightFlag = 1;
          }
        }
      }


      if (file_exists(inputNameT.c_str())) {
        ifstream inputT;
        inputT.open(inputNameT.c_str());
        while (1) {
          uint32_t numberofInddices;
          string nameT;
          Integral_F integralTopology;

          if (!(inputT >> nameT)) break;
          integralTopology.name = nameT;

          if (!(inputT >> numberofInddices)) break;
          integralTopology.topLevelSectors.push_back((1 << numberofInddices) -
                                                      1);
          integralTopology.jule = numberofInddices;

          collectReductions.push_back(nameT);
          topologyNames.push_back(nameT);

          topology[nameT] = integralTopology;
        }
        string BASISLC = "BASISLC";
        if (topologyNames.size() > 0)
          topologyNames.push_back(BASISLC);
      }
      else if(!weightFlag)
        read_integralfamilies(1);

      if (initiateSeedsOnce) {
        logger << "\n*****Integral "
                  "ordering*************************************\n";

        DataBase* database = new DataBase(inputDir + "/results/kira.db");
        //
        int tmpIntegralOrdering = database[0].get_integral_ordering();
        //
        if (integralOrdering == 9 && tmpIntegralOrdering != 0) {
          integralOrdering = tmpIntegralOrdering;
        }

        if (integralOrdering == 9 && tmpIntegralOrdering == 0) {
          integralOrdering = 1; // set default value
        }
        if (tmpIntegralOrdering == 0) {
          database[0].create_integral_ordering_table();
          database[0].save_integral_ordering(integralOrdering);
        }
        else if (tmpIntegralOrdering != integralOrdering) {
          logger << "ERROR: Your integral ordering: " << integralOrdering
                 << "  differs from\n";
          logger << "integral ordering:  " << tmpIntegralOrdering
                 << "  which was used in the last Kira run.\n";
          database[0].finalize();
          delete database;
          exit(-1);
        }
        database[0].finalize();
        delete database;

        logger << "Kira will use the integral ordering: " << integralOrdering
               << ".\n";

        int sectorOrdering = 1;
        if (integralOrdering > 4 && integralOrdering < 9) {
          sectorOrdering = 2;
          integralOrdering -= 4;
        }

        string mastersString = inputDir + "/results/preferredMasters";
        if (!file_exists(mastersString.c_str()))
          mastersString = "";

        if(weightFlag){
          pyred::Integral::setup(sectorOrdering, integralOrdering, "", "",
                                 mastersString);
          initiateSeedsOnce = 0;
        }
        else if (file_exists("config/integralfamilies.yaml")) {
          pyred::Integral::setup(sectorOrdering, integralOrdering,"./config",
                                 (inputDir + "/sectormappings"),
                                 mastersString, /*use_li*/ true);

          initiateSeedsOnce = 0;
        }

        string nameI = "INTEGRALORDERING";
        string nameW = "WEIGHTBITS";

        database = new DataBase(inputDir + "/results/kira.db");
        DataBase* database2 = new DataBase(inputDir + "/results/kira.db");
        DataBase* database3 = new DataBase(inputDir + "/results/kira.db");

        if (!(database[0].checkTable(nameI) && !database2[0].checkTable(nameW))) {
          vector<uint32_t> weightBits;

          if (database3[0].get_weight_bits(weightBits)) {

            pyred::Integral::assign_weight_bits(weightBits);

          }
        }
        else {
          logger << "Since automatic weight bits were switched off before, "
                    "thus automatic weightbits are switched off now.\n";
        }

        //         database[0].finalize();
        delete database;

        //         database2[0].finalize();
        delete database2;

        //         database3[0].finalize();
        delete database3;
      }

      int massReconstruction = 0;

      if (kira2File.reconstructMass == "true") {
        logger << "Mass reconstruction is enabled."
               << "\n";

        massReconstruction = 1;
      }

      if (mass2One.nops() == 0) {
        logger << "symbol_to_replace_by_one: x in ";
        logger << "kinematics.yaml is not set. \n";
        logger << "Mass reconstruction is disabled."
               << "\n";
        massReconstruction = 0;
      }

      string inputNameV = (inputDir + "/sectormappings/variables");

      if (file_exists(inputNameV.c_str())) {
        invar.clear();
        ifstream fileVariables(inputNameV);

        while (1) {
          string variable;
          if (!(fileVariables >> variable)) break;
          invar.push_back(get_symbol(variable));
        }
      }

      for (size_t itTarget = 0; itTarget < kira2File.target.size();
           itTarget++) {
        string topologyName = kira2File.target[itTarget].first;
        string seedsName = kira2File.target[itTarget].second;

        logger << "################################################\n";
        logger << names[choice] << ": Reconstruct results for " << topologyName
               << "\n";
        logger << "################################################\n\n";

        for (size_t itC = 0; itC < collectReductions.size(); itC++) {
          vector<pyred::intid> idOfSeed;
          if (topologyName == collectReductions[itC]) {
            ConvertResult extract(*this, topologyName, itC, seedsName, inputDir,
                                  idOfSeed);

            initiate_fermat(1, 1, 0);
            extract.output(*this, massReconstruction, idOfSeed, choice);
            destroy_fermat(1, 0);
          }
        }
      }

      for (size_t itTarget = 0; itTarget < kira2File.targetVector.size();
           itTarget++) {

        string topologyName = collectReductions[0];
        string seedsName = kira2File.targetVector[itTarget];

        logger << "################################################\n";
        logger << names[choice] << ": Reconstruct results" << "\n";
        logger << "################################################\n\n";


        vector<pyred::intid> idOfSeed;
        ConvertResult extract(*this, topologyName, 0, seedsName, inputDir,
                                idOfSeed);

        initiate_fermat(1, 1, 0);
        extract.output(*this, massReconstruction, idOfSeed, choice);
        destroy_fermat(1, 0);

      }

      for (size_t iRec = 0; iRec < kira2File.mandatoryRec.size(); iRec++) {
        string topologyName = kira2File.mandatoryRec[iRec][0];
        string seedsName = kira2File.mandatoryRec[iRec][1] + "_" +
                           kira2File.mandatoryRec[iRec][2] + "_" +
                           kira2File.mandatoryRec[iRec][3];

        logger << "################################################\n";
        logger << names[choice] << ": Reconstruct results for " << topologyName
               << "\n";
        logger << "################################################\n\n";

        for (unsigned itC = 0; itC < collectReductions.size(); itC++) {

          std::vector<pyred::SeedSpec> initiateMAN;
          vector<pyred::intid> idOfSeed;
          if (kira2File.mandatoryRec[iRec][0] == collectReductions[itC]) {
            int num_ones = 0;

            unsigned sectorsTmp = pyred::Integral::parse_sector(kira2File.mandatoryRec[iRec][1], integralfamily.jule);

            unsigned testSector = sectorsTmp;

            for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {
              if ((testSector & 1) == 1) ++num_ones;
            }

            initiateMAN.push_back(pyred::Topology::id_to_topo(itC)->seed_spec(
                sectorsTmp,
                num_ones + something_int(kira2File.mandatoryRec[iRec][2]),
                something_int(kira2File.mandatoryRec[iRec][3]),
                something_int(kira2File.mandatoryRec[iRec][2]), -1));

            auto listOfIntegrals =
                pyred::SeedSpec::list_integrals(initiateMAN, -1);

            logger << "Number of all integrals: " << listOfIntegrals.size()
                   << "\n";

            ConvertResult extract(*this, topologyName, itC, inputDir,
                                  listOfIntegrals, idOfSeed, seedsName);

            initiate_fermat(1, 1, 0);
            extract.output(*this, massReconstruction, idOfSeed, choice);
            destroy_fermat(1, 0);
          }
        }
      }

      for (unsigned itC = 0; itC < collectReductions.size(); itC++) {

        std::vector<pyred::SeedSpec> initiateMAN;
        vector<pyred::intid> idOfSeed;
        int countRef = 0;

        for (auto itSpec : kira2File.selectSpec) {
          if (get<0>(itSpec).size() == 0) {
            select_spec_helper(itC, initiateMAN, itSpec, countRef);
          }
          else {
            for (auto itTopo : get<0>(itSpec)) {
              if (itTopo == collectReductions[itC]) {
                select_spec_helper(itC, initiateMAN, itSpec, countRef);
              }
            }
          }
        }
        if (initiateMAN.size() != 0) {
          string seedsName = collectReductions[itC];

          logger << "################################################\n";
          logger << names[choice] << ": Reconstruct results for "
                 << collectReductions[itC] << "\n";
          logger << "################################################\n\n";

          auto listOfIntegrals =
              pyred::SeedSpec::list_integrals(initiateMAN, -1);

          logger << "Number of all integrals: " << listOfIntegrals.size()
                 << "\n";

          ConvertResult extract(*this, collectReductions[itC], itC, inputDir,
                                listOfIntegrals, idOfSeed, seedsName);
          algebraicReconstruction = 0;
          initiate_fermat(1, 1, 0);
          extract.output(*this, massReconstruction, idOfSeed, choice);
          destroy_fermat(1, 0);
        }
      }
      collectReductions.clear();
      topologyNames.clear();
      topology.clear();

    }
  }
}
