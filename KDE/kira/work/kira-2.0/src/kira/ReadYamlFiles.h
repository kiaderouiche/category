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

#ifndef READYAMLFILES_H_
#define READYAMLFILES_H_

#include <algorithm>
#include <tuple>

#include "ginac/ginac.h"
#include "pyred/config.h"
#include "pyred/integrals.h"
#include "yaml-cpp/yaml.h"
#include "kira/integral.h"
#include "kira/tools.h"

#define SIZESYM 64
// #include "trivial_sym.h"

typedef std::vector<symmetries> SYM;
typedef SYM::iterator ItSYM;

typedef std::vector<BaseEquation*> VE;
typedef VE::iterator ItVE;

struct Jobs {
  std::vector<std::tuple<std::vector<std::string> /*topologies*/,
                         std::vector<std::string> /*sectors*/, int /*rmax*/,
                         int /*smax*/, int /*dmax*/> >
      reductSpec;

  std::vector<std::tuple<std::vector<std::string> /*topologies*/,
                         std::vector<std::string> /*sectors*/, int /*rmax*/,
                         int /*smax*/, int /*dmax*/> >
      selectSpec;

  std::vector<std::pair<std::string, std::string> > sector2Reduce;
  std::vector<std::pair<std::string, std::string> > den;
  std::vector<std::pair<std::string, std::string> > num;
  std::vector<std::pair<std::string, std::string> > mandatoryFile;
  std::vector<std::string> mandatoryFileVector;
#ifdef KIRAFIREFLY
  std::string ff_recon;
  std::string factor_scan;
#endif
  std::vector<std::vector<std::string> > mandatoryRec;
  std::vector<std::vector<std::string> > optionalRec;
  std::string masters;
  std::string specialname;
  std::string runBacksubstitution;
  std::string runTriangular;
  std::string pyredDatabase;
  std::string runInitiate;
  int level;
  int config;
  int integralOrdering;
  std::string runSymmetries;
  std::string dataFile;
  std::string outputDir;
  std::string writeNumericalSystem;
  std::string conditional;
  std::string LIflag;
  std::string algebraicReconstruction;
  unsigned resumeRun;
  std::multimap<std::string, std::vector<int> > selectMastersReduction;
  std::string iterativeReduction;
  std::vector<std::string> trimmedReduction;
  std::vector<std::string> fileDenominators;
  std::vector<std::string> fileAmplitude;
  int weightMode;
  std::vector<std::string> filePrefactors;
  std::string inputSystem;
  std::tuple<std::vector<std::string>, pyred::intid, int> inputSystemTuple;
};

struct Kira2File {
  std::vector<std::pair<std::string, std::string> > target;
  std::vector<std::string> targetVector;
  std::vector<std::vector<std::string> > mandatoryRec;
  std::string inputDir;
  std::string reconstructMass;
  std::vector<std::tuple<std::vector<std::string> /*topologies*/,
                         std::vector<std::string> /*sectors*/, int /*rmax*/,
                         int /*smax*/, int /*dmax*/> >
      selectSpec;
};

struct Merge {
  std::vector<std::string> files2merge;
  std::string outputDir;
};

struct Dgl {
  std::vector<std::string> filesDGL;
};

struct Integral_F {
  std::string name;
  std::vector<std::string> loop;
  std::vector<GiNaC::possymbol> loopVar;
  std::vector<GiNaC::possymbol> allVar;
  GiNaC::lst loop2loop, loop2loop2, loopVarList, loopVarList2;
  GiNaC::lst props, propsMomFlowA;
  std::vector<GiNaC::lst> scal2Props, propsMomFlowB;
  int jule;
  GiNaC::possymbol* propSymb;
  GiNaC::lst scalprod;
  GiNaC::ex G, Gsym, U, F; // U + F Polynomial
  GiNaC::lst FPolynom;
  std::vector<int>*mask, *allowSector;
  std::set<int>* skipSector;
  std::vector<int> zeroSector;

  VE identitiesIBP, identitiesLI, identitiesDGLmom, identitiesLEE,
      identitiesDGLmasses, identitiesDGLxKira;

  std::vector<std::pair<std::string, BaseEquation*> > identitiesDGL;

  SYM *symVec, *relVec, *symVecReverse;
  std::vector<int> sector2Reduce, bound;
  int biggestBound;
  int biggestSector2Reduce;
  std::vector<unsigned> lowestSectors;
  int topology;
  std::vector<std::pair<std::string, std::string> > propagator;
  int* invarID;
  std::vector<int> topLevelSectors;
  std::vector<int> userZeroSectors;
  std::vector<int> cutProps;
  unsigned maskCut;
  std::vector<int> permute;
  std::vector<std::tuple<std::vector<int>, int, int, int> > reductSpec;
  std::string magic_relations;
  std::unordered_map<
      int, std::vector<std::tuple<size_t, std::vector<std::vector<int> >, int, int> > >
      symmetries;
  std::unordered_map<
      int, std::vector<std::tuple<size_t, std::vector<std::vector<int> >, int, int> > >
      symmetriesCrossed;
  int propsMomentaFlowMask;
  std::vector<int> symbolicIBP;
};

struct Kinematics {
  std::vector<std::string> im;
  std::vector<std::string> om;
  std::string rpl;
  std::pair<std::string, std::string> mc;
  std::vector<std::pair<std::string, int> > ki;
  std::vector<GiNaC::possymbol> invariantsPlaceholder;
  GiNaC::lst invariantsReplacement, invariantsReplacementRev;
  std::vector<std::pair<std::pair<std::string, std::string>, std::string> > sr;
};

namespace YAML {
template <>
struct convert<Jobs> {
  static bool decode(const Node& node, Jobs& rhs) {
    for (YAML::const_iterator it = node.begin(); it != node.end(); ++it) {
      std::string token = (*it).first.as<std::string>();
      if (token != "algebraic_reconstruction" &&
          token != "input_system" &&
          token != "reduce" &&
          token != "sector_selection" &&
          token != "identities" &&
          token != "select_integrals" &&
          token != "select_masters" &&
          token != "preferred_masters" &&
          token != "run_triangular" &&
          token != "run_back_substitution" &&
          token != "integral_ordering" &&
          token != "run_initiate" &&
          token != "run_symmetries" &&
          token != "alt_dir" &&
          token != "data_file" &&
          token != "write_numerical_system" &&
          token != "select_masters_reduction" &&
          token != "create_denominator_database" &&
          token != "amplitude_translate" &&
          token != "weight_notation" &&
          token != "conditional" &&
          token != "set_zero_sectors" &&
          token != "lorenz_invariance" &&
          token != "iterative_reduction" &&
          token != "generate_input"
#ifndef KIRAFIREFLY
          && token != "pyred_database") {
#else
          && token != "insert_prefactors"
          && token != "pyred_database"
          && token != "run_firefly"
          && token != "factor_scan") {
#endif
        std::cout << "\n*******************************************************"
                     "****\n";
        std::cout << "***Kira does not know the option: " << token << std::endl;
        std::cout << "***in the job file.";
        std::cout << "\n*******************************************************"
                     "****\n";
        exit(-1);
      }
    }

    if (node["run_triangular"])
      rhs.runTriangular = node["run_triangular"].as<std::string>();
    if (node["run_back_substitution"])
      rhs.runBacksubstitution = node["run_back_substitution"].as<std::string>();
    if (node["pyred_database"])
      rhs.pyredDatabase = node["pyred_database"].as<std::string>();
    if (node["run_initiate"])
      rhs.runInitiate = node["run_initiate"].as<std::string>();
    if (node["run_symmetries"])
      rhs.runSymmetries = node["run_symmetries"].as<std::string>();
    if (node["data_file"]) rhs.dataFile = node["data_file"].as<std::string>();
    if (node["alt_dir"]) rhs.outputDir = node["alt_dir"].as<std::string>();
    if (node["write_numerical_system"])
      rhs.writeNumericalSystem =
          node["write_numerical_system"].as<std::string>();
    if (node["conditional"])
      rhs.conditional = node["conditional"].as<std::string>();
    if (node["lorenz_invariance"]) {
      rhs.LIflag = node["lorenz_invariance"].as<std::string>();
    }
    if (node["algebraic_reconstruction"]) {
      rhs.algebraicReconstruction =
          node["algebraic_reconstruction"].as<std::string>();
    }


    if (node["reduce"]) {
      const Node& nodeibp = node["reduce"];

      for (unsigned i = 0; i < nodeibp.size(); i++) {
        std::vector<std::string> topologies;
        std::vector<std::string> sectors;
        int rmax = -1;
        int smax = -1;
        int dmax = std::numeric_limits<int>::max();

        if (nodeibp[i]["topologies"]) {
          for (unsigned itT = 0; itT != nodeibp[i]["topologies"].size();
               itT++) {
            topologies.push_back(
                nodeibp[i]["topologies"][itT].as<std::string>());
          }
        }

        if (nodeibp[i]["sectors"]) {
          for (unsigned itT = 0; itT != nodeibp[i]["sectors"].size(); itT++){

            sectors.push_back(nodeibp[i]["sectors"][itT].as<std::string>());
          }
        }

        if (nodeibp[i]["r"] && nodeibp[i]["r"].size() == 0)
          rmax = nodeibp[i]["r"].as<int>();

        if (nodeibp[i]["s"] && nodeibp[i]["s"].size() == 0)
          smax = nodeibp[i]["s"].as<int>();

        if (nodeibp[i]["d"] && nodeibp[i]["d"].size() == 0)
          dmax = nodeibp[i]["d"].as<int>();

        if (rmax < 0) {
          std::cout
              << "rmax should be a positive number in the option r: rmax.\n";
          exit(-1);
        }
        if (smax < 0) {
          std::cout
              << "smax should be a positive number in the option s: smax.\n";
          exit(-1);
        }
        if (dmax < 0) {
          std::cout
              << "dmax should be a positive number in the option d: dmax.\n";
          exit(-1);
        }

        if (dmax == std::numeric_limits<int>::max()) dmax = -1;

        rhs.reductSpec.push_back(
            std::make_tuple(topologies, sectors, rmax, smax, dmax));

        if (nodeibp[i]["r"] && nodeibp[i]["r"].size() == 2)
          rhs.den.push_back(make_pair(nodeibp[i]["r"][0].as<std::string>(),
                                      nodeibp[i]["r"][1].as<std::string>()));
        if (nodeibp[i]["s"] && nodeibp[i]["s"].size() == 2)
          rhs.num.push_back(make_pair(nodeibp[i]["s"][0].as<std::string>(),
                                      nodeibp[i]["s"][1].as<std::string>()));
      }
    }

    rhs.level = std::numeric_limits<int>::max();
    if (node["generate_input"]) {
      if(node["generate_input"]["level"]){
        rhs.level = node["generate_input"]["level"].as<int>();
      }
      else if (node["generate_input"].size()==0 && node["generate_input"].as<std::string>()=="true"){
        rhs.level = 0;
      }
      else if (node["generate_input"].size()==0 && node["generate_input"].as<std::string>()=="false"){
        rhs.level = std::numeric_limits<int>::max();
      }
      else{
        std::cout << "The only input is either 'true', 'false' or {level: <int>}.\n";
        exit(-1);
      }
      if(rhs.level<0){
        std::cout << "Negative values for the option level: are not allowed.\n";
        exit(-1);
      }
      rhs.dataFile = "true";
    }


    rhs.config = 1;
    if (node["input_system"]) {

      if(node["input_system"].size()==0){
        rhs.inputSystem = node["input_system"].as<std::string>();
      }
      else if(node["input_system"]["files"]){

        std::vector<std::string> files;
        pyred::intid numberOfEqs = std::numeric_limits<pyred::intid>::max();
        int otf = 0;

        if(node["input_system"]["files"].size() == 0){

          files.push_back(node["input_system"]["files"].as<std::string>());
        }
        else if(node["input_system"]["files"].size() > 0){

          for (auto it: node["input_system"]["files"]) {

            files.push_back(it.as<std::string>());
          }
        }
        if(node["input_system"]["size"] && node["input_system"]["size"].size() == 0){
          numberOfEqs = node["input_system"]["size"].as<pyred::intid>();
        }
        else if (node["input_system"]["size"] && node["input_system"]["size"].size() > 0){
          std::cout << "***Warning*** size: accepts only one numeric value without square brackets.\n";
          std::cout << "If multiple files or a directory containing multiple\n"; std::cout << "files is used, please enter the cumulative number of equations.\n";
          exit(-1);
        }

        if(node["input_system"]["config"] && node["input_system"]["config"].size()==0){
          if(node["input_system"]["config"].as<std::string>() == "false"){
            rhs.config = 0;
          }
          else if(node["input_system"]["config"].as<std::string>() == "true"){
            rhs.config = 1;
          }
          else{
            std::cout << "Failed to understand the option config: \n";;
            std::cout << "Alowed values are true and false.\n";
            exit(-1);
          }
        }


        if(node["input_system"]["otf"] && node["input_system"]["otf"].size() == 0){
          if(node["input_system"]["otf"].as<std::string>() == "true"){
            otf = 1;
          }
          else if(node["input_system"]["otf"].as<std::string>() == "false"){
            otf = 0;
          }
          else{
            std::cout << "Option otf: " << node["input_system"]["otf"].as<std::string>();
            std::cout << "not known.\n";
            std::cout << "Make a choice: true or false\n";
            exit(-1);
          }
        }
        rhs.inputSystemTuple = make_tuple(files,numberOfEqs,otf);
      }
      else{
        std::cout << "Wrong input in input_system: option\n";
        exit(-1);
      }
    }

    if (node["sector_selection"]) {
      for (YAML::const_iterator it = node["sector_selection"].begin();
           it != node["sector_selection"].end(); ++it) {
        std::string token = (*it).first.as<std::string>();
        if (token != "select_recursively") {
          std::cout << "\n*****************************************************"
                       "******\n";
          std::cout << "***Kira does not know the option: " << token
                    << std::endl;
          std::cout << "***In the job file.";
          std::cout << "\n*****************************************************"
                       "******\n";
          exit(-1);
        }
      }

      if (node["sector_selection"]["select_recursively"]) {
        const Node& nodeb = node["sector_selection"]["select_recursively"];

        for (unsigned i = 0; i < nodeb.size(); i++) {
          rhs.sector2Reduce.push_back(make_pair(nodeb[i][0].as<std::string>(),
                                                nodeb[i][1].as<std::string>()));
        }
      }
    }

    if (node["identities"]) {
      for (YAML::const_iterator it = node["identities"].begin();
           it != node["identities"].end(); ++it) {
        std::string token = (*it).first.as<std::string>();
        if (token != "ibp") {
          std::cout << "\n*****************************************************"
                       "******\n";
          std::cout << "***Kira does not know the option: " << token
                    << std::endl;
          std::cout << "***In the job file.";
          std::cout << "\n*****************************************************"
                       "******\n";
          exit(-1);
        }
      }

      if (node["identities"]["ibp"]) {
        const Node& nodeibp = node["identities"]["ibp"];

        for (unsigned i = 0; i < nodeibp.size(); i++) {
          if (nodeibp[i]["r"] && nodeibp[i]["r"].size() == 2)
            rhs.den.push_back(make_pair(nodeibp[i]["r"][0].as<std::string>(),
                                        nodeibp[i]["r"][1].as<std::string>()));
          if (nodeibp[i]["s"] && nodeibp[i]["s"].size() == 2)
            rhs.num.push_back(make_pair(nodeibp[i]["s"][0].as<std::string>(),
                                        nodeibp[i]["s"][1].as<std::string>()));
        }
      }
    }

    if (node["select_masters"]) {
      const Node& nodeibp = node["select_masters"];

      rhs.masters = nodeibp.as<std::string>();
    }

    if (node["preferred_masters"]) {
      const Node& nodeibp = node["preferred_masters"];

      rhs.masters = nodeibp.as<std::string>();
    }

    if (node["select_integrals"]) {
      for (YAML::const_iterator it = node["select_integrals"].begin();
           it != node["select_integrals"].end(); ++it) {
        std::string token = (*it).first.as<std::string>();
        if (token != "select_mandatory_list" &&
            token != "select_optional_list" &&
            token != "select_mandatory_recursively" &&
            token != "select_optional_recursively" &&
            token != "select_masters" && token != "preferred_masters") {
          std::cout << "\n*****************************************************"
                       "******\n";
          std::cout << "***Kira does not know the option: " << token
                    << std::endl;
          std::cout << "***In the job file.";
          std::cout << "\n*****************************************************"
                       "******\n";
          exit(-1);
        }
      }

      if (node["select_integrals"]["select_masters"]) {
        const Node& nodeibp = node["select_integrals"]["select_masters"];

        rhs.masters = nodeibp.as<std::string>();
      }

      if (node["select_integrals"]["preferred_masters"]) {
        const Node& nodeibp = node["select_integrals"]["preferred_masters"];

        rhs.masters = nodeibp.as<std::string>();
      }

      if (node["select_integrals"]["select_mandatory_list"]) {
        const Node& nodeselect = node["select_integrals"]["select_mandatory_list"];

        for (unsigned i = 0; i < nodeselect.size(); i++) {

         if(nodeselect[i].size()==1){
           rhs.mandatoryFileVector.push_back(
              nodeselect[i][0].as<std::string>());
         }
         else if(nodeselect[i].size()==2){
           rhs.mandatoryFile.push_back(
            make_pair(nodeselect[i][0].as<std::string>(),
                      nodeselect[i][1].as<std::string>()));
          }
        }

        if(rhs.level != std::numeric_limits<int>::max()){
          std::cout << "The option select_mandatory_list is not allowed\n";
          std::cout << "together with the option generate_input.\n";
          std::cout << "Use select_mandatory_recursively instead.\n";
          exit(-1);
        }
      }

      if (node["select_integrals"]["select_mandatory_recursively"]) {
        const Node& nodeselect =
            node["select_integrals"]["select_mandatory_recursively"];

        for (unsigned i = 0; i < nodeselect.size(); i++) {
          if (nodeselect[i]["r"] && nodeselect[i]["s"]) {
            std::vector<std::string> topologies;
            std::vector<std::string> sectors;
            int rmax = -1;
            int smax = -1;
            int dmax = std::numeric_limits<int>::max();

            if (nodeselect[i]["topologies"]) {
              for (unsigned itT = 0; itT != nodeselect[i]["topologies"].size();
                   itT++) {
                topologies.push_back(
                    nodeselect[i]["topologies"][itT].as<std::string>());
              }
            }

            if (nodeselect[i]["sectors"]) {

              for (unsigned itT = 0; itT != nodeselect[i]["sectors"].size(); itT++){

                sectors.push_back(nodeselect[i]["sectors"][itT].as<std::string>());
              }
            }

            if (nodeselect[i]["r"] && nodeselect[i]["r"].size() == 0)
              rmax = nodeselect[i]["r"].as<int>();

            if (nodeselect[i]["s"] && nodeselect[i]["s"].size() == 0)
              smax = nodeselect[i]["s"].as<int>();

            if (nodeselect[i]["d"] && nodeselect[i]["d"].size() == 0)
              dmax = nodeselect[i]["d"].as<int>();

            if (rmax < 0) {
              std::cout << "rmax should be a positive number in the option r: "
                           "rmax.\n";
              exit(-1);
            }

            if (smax < 0) {
              std::cout << "smax should be a positive number in the option s: "
                           "smax.\n";
              exit(-1);
            }
            if (dmax < 0) {
              std::cout << "dmax should be a positive number in the option d: "
                           "dmax.\n";
              exit(-1);
            }

            if (dmax == std::numeric_limits<int>::max())
              dmax = -1;

            rhs.selectSpec.push_back(
                std::make_tuple(topologies, sectors, rmax, smax, dmax));
          }
          else if (nodeselect[i].size() == 4) {
            std::vector<std::string> info;
            info.push_back(nodeselect[i][0].as<std::string>());
            info.push_back(nodeselect[i][1].as<std::string>());
            info.push_back(nodeselect[i][2].as<std::string>());
            info.push_back(nodeselect[i][3].as<std::string>());
            rhs.mandatoryRec.push_back(info);
          }
        }
      }

      if (node["select_integrals"]["select_optional_recursively"]) {
        const Node& nodeselect =
            node["select_integrals"]["select_optional_recursively"];
        for (unsigned i = 0; i < nodeselect.size(); i++) {
          std::vector<std::string> info;
          info.push_back(nodeselect[i][0].as<std::string>());
          info.push_back(nodeselect[i][1].as<std::string>());
          info.push_back(nodeselect[i][2].as<std::string>());
          info.push_back(nodeselect[i][3].as<std::string>());

          rhs.optionalRec.push_back(info);
        }
      }
    }

    if (node["create_denominator_database"]) {
      const Node& nodeTop = node["create_denominator_database"];

      for (unsigned iM = 0; iM < nodeTop.size(); iM++) {
        if (nodeTop[iM].size() == 0) {
          rhs.fileDenominators.push_back(nodeTop[iM].as<std::string>());
          continue;
        }
      }
    }

    if (node["amplitude_translate"]) {

      if(!(
        ((node["reduce"] && node["reduce"].size()>0)||(node["input_system"]))
          )
        ){
        std::cout << "The option amplitude translate only works\n";
        std::cout << "if we specify the reduction with the option\n";
        std::cout << "reduce or input_system.\n";
        std::cout << "Your integrals should map correctly to the\n";
        std::cout << "identification numbers (weight bits)\n";
        std::cout << "internally used by Kira.\n";
        exit(-1);
      }
      const Node& nodeTop = node["amplitude_translate"];

      for (unsigned iM = 0; iM < nodeTop.size(); iM++) {
        rhs.fileAmplitude.push_back(nodeTop[iM].as<std::string>());
      }
    }
    rhs.weightMode = 1;
    if(node["weight_notation"]){
      if(!(
        ((node["reduce"] && node["reduce"].size()>0)||(node["input_system"])))){
        std::cout << "The option weight notation works only together with\n";
        std::cout << "the options 'reduce' or 'input_system'\n";
        exit(-1);
      }
      if(node["weight_notation"].as<std::string>()=="true"){
        rhs.weightMode = 1;
      }
      else if(node["weight_notation"].as<std::string>()=="false"){
        rhs.weightMode = 0;
      }
      else{
        std::cout << "Not known option in option weight_notation: " << node["weight_notation"].as<std::string>() << "\n";
        exit(-1);
      }

    }

    if (node["insert_prefactors"]) {

      if(!(node["run_firefly"])){
        std::cout << "The option insert prefactors makes only sense if\n";
        std::cout << "the option run_firefly is used.\n";
        exit(-1);
      }
      const Node& nodeTop = node["insert_prefactors"];

      for (unsigned iM = 0; iM < nodeTop.size(); iM++) {
        rhs.filePrefactors.push_back(nodeTop[iM].as<std::string>());

      }
    }

    if(node["iterative_reduction"]){

      rhs.iterativeReduction = node["iterative_reduction"].as<std::string>();

      if(rhs.iterativeReduction != "masterwise" && rhs.iterativeReduction != "sectorwise"){

        std::cout << "Your option: " << rhs.iterativeReduction << " is not supported.\n";
        std::cout << "Please use options: 'masterwise' or 'sectorwise'\n";
        exit(-1);
      }

    }

    if (node["select_masters_reduction"]) {

      const Node& nodeTop = node["select_masters_reduction"];

      for (unsigned iM = 0; iM < nodeTop.size(); iM++) {
        if (nodeTop[iM].size() == 0) {
          rhs.trimmedReduction.push_back(nodeTop[iM].as<std::string>());
          continue;
        }

        if (nodeTop[iM].size() != 2) {
          std::cout << "Wrong options in:\n";
          std::cout << "select_masters_reduction\n";
          continue;
        }
        std::vector<int> token;
        for (unsigned jM = 0; jM < nodeTop[iM][1].size(); jM++) {
          token.push_back(nodeTop[iM][1][jM].as<int>());
        }
        rhs.selectMastersReduction.insert(
            std::make_pair(nodeTop[iM][0].as<std::string>(), token));
      }
    }

    if (node["set_zero_sectors"]) {

      const Node& nodeTop = node["set_zero_sectors"];

      if(nodeTop["files"]){

        for (auto it: nodeTop["files"]) {

          rhs.trimmedReduction.push_back(it.as<std::string>());
        }
      }
    }

    rhs.integralOrdering = 9;
    if (node["integral_ordering"]) {
      if (node["integral_ordering"].as<int>() < 1 ||
          node["integral_ordering"].as<int>() > 8) {
        std::cout << "The option integral_ordering in your job file is invalid."
                  << std::endl;
        exit(-1);
      }
      rhs.integralOrdering = node["integral_ordering"].as<int>();
    }

#ifdef KIRAFIREFLY
    if (node["run_firefly"])
      rhs.ff_recon = node["run_firefly"].as<std::string>();
    if (node["factor_scan"])
      rhs.factor_scan = node["factor_scan"].as<std::string>();
#endif

    return true;
  }
};

template <>
struct convert<Kira2File> {
  static bool decode(const Node& node, Kira2File& rhs) {
    for (YAML::const_iterator it = node.begin(); it != node.end(); it++) {
      std::string token = (*it).first.as<std::string>();
      if (token != "target" && token != "reconstruct_mass" &&
          token != "alt_dir") {
        std::cout << "\n*******************************************************"
                     "****\n";
        std::cout << "***Kira does not know the option: " << token << std::endl;
        std::cout << "***In the job file.";
        std::cout << "\n*******************************************************"
                     "****\n";
      }
    }

    if (node["target"]) {
      const Node& nodet = node["target"];

      for (unsigned i = 0; i < nodet.size(); i++) {

        if (nodet[i]["r"] && nodet[i]["s"]) {

          std::vector<std::string> topologies;
          std::vector<std::string> sectors;
          int rmax = -1;
          int smax = -1;
          int dmax = std::numeric_limits<int>::max();

          if (nodet[i]["topologies"]) {
            for (unsigned itT = 0; itT != nodet[i]["topologies"].size();
                 itT++) {
              topologies.push_back(
                  nodet[i]["topologies"][itT].as<std::string>());
            }
          }

          if (nodet[i]["sectors"]) {
            for (unsigned itT = 0; itT != nodet[i]["sectors"].size(); itT++){

              sectors.push_back(nodet[i]["sectors"][itT].as<std::string>());

            }
          }

          if (nodet[i]["r"] && nodet[i]["r"].size() == 0)
            rmax = nodet[i]["r"].as<int>();

          if (nodet[i]["s"] && nodet[i]["s"].size() == 0)
            smax = nodet[i]["s"].as<int>();

          if (nodet[i]["d"] && nodet[i]["d"].size() == 0)
            dmax = nodet[i]["d"].as<int>();

          if (rmax < 0) {
            std::cout
                << "rmax should be a positive number in the option r: rmax.\n";
            exit(-1);
          }

          if (smax < 0) {
            std::cout
                << "smax should be a positive number in the option s: smax.\n";
            exit(-1);
          }
          if (dmax < 0) {
            std::cout
                << "dmax should be a positive number in the option d: dmax.\n";
            exit(-1);
          }

          if (dmax == std::numeric_limits<int>::max()) dmax = -1;

          rhs.selectSpec.push_back(
              std::make_tuple(topologies, sectors, rmax, smax, dmax));
        }
        else if (nodet[i].size() == 2) {
          rhs.target.push_back(make_pair(nodet[i][0].as<std::string>(),
                                         nodet[i][1].as<std::string>()));
        }
        else if (nodet[i].size() == 4) {
          std::vector<std::string> info;
          info.push_back(nodet[i][0].as<std::string>());
          info.push_back(nodet[i][1].as<std::string>());
          info.push_back(nodet[i][2].as<std::string>());
          info.push_back(nodet[i][3].as<std::string>());
          rhs.mandatoryRec.push_back(info);
        }
        else if (nodet[i].size() == 1) {
          rhs.targetVector.push_back(nodet[i][0].as<std::string>());
        }
      }
    }

    if (node["alt_dir"]) rhs.inputDir = node["alt_dir"].as<std::string>();
    if (node["reconstruct_mass"])
      rhs.reconstructMass = node["reconstruct_mass"].as<std::string>();

    return true;
  }
};

template <>
struct convert<Merge> {
  static bool decode(const Node& node, Merge& rhs) {
    for (YAML::const_iterator it = node.begin(); it != node.end(); it++) {
      std::string token = (*it).first.as<std::string>();
      if (token != "files2merge" && token != "alt_dir") {
        std::cout << "\n*******************************************************"
                     "****\n";
        std::cout << "***Kira does not know the option: " << token << std::endl;
        std::cout << "***In the job file.";
        std::cout << "\n*******************************************************"
                     "****\n";
      }
    }

    if (node["files2merge"]) {
      const Node& nodet = node["files2merge"];

      for (unsigned i = 0; i < nodet.size(); i++) {
        rhs.files2merge.push_back(node["files2merge"][i].as<std::string>());
      }
    }
    if (node["alt_dir"]) rhs.outputDir = node["alt_dir"].as<std::string>();

    return true;
  }
};

template <>
struct convert<Dgl> {
  static bool decode(const Node& node, Dgl& rhs) {
    for (YAML::const_iterator it = node.begin(); it != node.end(); it++) {
      std::string token = (*it).first.as<std::string>();
      if (token != "derive_dgl") {
        std::cout << "\n*******************************************************"
                     "****\n";
        std::cout << "***Kira does not know the option: " << token << std::endl;
        std::cout << "***In the job file.";
        std::cout << "\n*******************************************************"
                     "****\n";
      }
    }

    if (node["derive_dgl"]) {
      std::cout << "fff" << std::endl;
      const Node& nodet = node["derive_dgl"];

      for (unsigned i = 0; i < nodet.size(); i++) {
        rhs.filesDGL.push_back(node["derive_dgl"][i].as<std::string>());
      }
    }

    return true;
  }
};

template <>
struct convert<Kinematics> {
  static bool decode(const Node& node, Kinematics& rhs) {
    for (YAML::const_iterator it = node.begin(); it != node.end(); ++it) {
      std::string token = (*it).first.as<std::string>();

      if (token != "incoming_momenta" && token != "outgoing_momenta" &&
          token != "momentum_conservation" && token != "kinematic_invariants" &&
          token != "scalarproduct_rules"
          && token != "symbol_to_replace_by_one") {
        std::cout << "Kira does not know the option: " << token << std::endl;
        std::cout << "In config/kinematics.yaml" << std::endl;
        exit(-1);
      }
    }

    if (node["incoming_momenta"]) {
      const Node& nodei = node["incoming_momenta"];
      for (unsigned i = 0; i < nodei.size(); i++) {
        rhs.im.push_back(nodei[i].as<std::string>());
      }
    }
    if (node["outgoing_momenta"]) {
      const Node& nodeo = node["outgoing_momenta"];
      for (unsigned i = 0; i < nodeo.size(); i++) {
        rhs.om.push_back(nodeo[i].as<std::string>());
      }
    }

    if (node["momentum_conservation"]) {
      const Node& nodem = node["momentum_conservation"];
      if (nodem.size())
        rhs.mc =
            make_pair(nodem[0].as<std::string>(), nodem[1].as<std::string>());
    }

    if (node["kinematic_invariants"]) {
      const Node& nodek = node["kinematic_invariants"];
      for (unsigned i = 0; i < nodek.size(); i++) {
        rhs.ki.push_back(std::pair<std::string, int>(
            nodek[i][0].as<std::string>(), nodek[i][1].as<int>()));

        std::string invariantsToken = rhs.ki[i].first + "2place";

        rhs.invariantsPlaceholder.push_back(get_symbol(invariantsToken));

        rhs.invariantsReplacement.append(
            get_symbol(rhs.ki[i].first) ==
            get_symbol(invariantsToken)); // inv == inv'

        rhs.invariantsReplacementRev.append(
            get_symbol(invariantsToken) ==
            get_symbol(rhs.ki[i].first)); // inv' == inv
      }
    }
    if (node["scalarproduct_rules"]) {
      const Node& nodes = node["scalarproduct_rules"];
      for (unsigned i = 0; i < nodes.size(); i++) {
        std::pair<std::string, std::string> pure(
            nodes[i][0][0].as<std::string>(), nodes[i][0][1].as<std::string>());
        rhs.sr.push_back(
            std::pair<std::pair<std::string, std::string>, std::string>(
                pure, nodes[i][1].as<std::string>()));
      }
    }

    if (node["symbol_to_replace_by_one"]) {
      const Node noderpl = node["symbol_to_replace_by_one"];
      rhs.rpl = noderpl.as<std::string>();
    }

    return true;
  }
};

template <>
struct convert<Integral_F> {
  static bool decode(const Node& node, Integral_F& rhs) {
    for (YAML::const_iterator it = node.begin(); it != node.end(); ++it) {
      std::string token = (*it).first.as<std::string>();
      if (token != "propagators" && token != "loop_momenta" &&
          token != "name" && token != "top_level_sectors" &&
          token != "magic_relations" && token != "cut_propagators" &&
          token != "permute_propagators" && token != "symbolic_ibp" &&
          token != "zero_sectors") {
        std::cout << "Kira does not know the option: " << token << std::endl;
        std::cout << "In config/integralfamilies.yaml" << std::endl;
        exit(-1);
      }
    }

    if (!node["propagators"]) {
      std::cout << "Option propagators is missing in"
                << "config/integralfamilies.yaml" << std::endl;
      exit(-1);
    }
    if (!node["loop_momenta"]) {
      std::cout << "Option loop_momenta is missing in"
                << "config/integralfamilies.yaml" << std::endl;
      exit(-1);
    }
    if (!node["name"]) {
      std::cout << "Option name is missing in"
                << "config/integralfamilies.yaml" << std::endl;
      exit(-1);
    }

    if(node["name"].as<std::string>()=="Tuserweight"){
      std::cout << "The topology Tuserweight is reserved by Kira\n";
      std::cout << "for the integral weight notation integrals\n";
      std::cout << "and is not allowed.\n";
      exit(-1);
    }

    rhs.name = node["name"].as<std::string>();


    if (node["magic_relations"])
      rhs.magic_relations = node["magic_relations"].as<std::string>();
    else
      rhs.magic_relations = "false";

    const Node& nodet = node["loop_momenta"];
    for (unsigned i = 0; i < nodet.size(); i++) {
      rhs.loop.push_back(nodet[i].as<std::string>());
      rhs.allVar.push_back(get_symbol(nodet[i].as<std::string>()));
      rhs.loopVar.push_back(get_symbol(nodet[i].as<std::string>()));
      rhs.loopVarList.append(get_symbol(nodet[i].as<std::string>()));

      std::string loop2 = rhs.loop[i] + "2";
      rhs.loopVarList2.append(get_symbol(loop2));

      rhs.loop2loop2.append(rhs.loopVar[i] == get_symbol(loop2)); // k == k'
      rhs.loop2loop.append(get_symbol(loop2) == rhs.loopVar[i]);  // k' == k
    }

    if (node["permute_propagators"]) {
      const Node& nodeTop = node["permute_propagators"];

      for (unsigned i = 0; i < nodeTop.size(); i++) {
        rhs.permute.push_back(nodeTop[i].as<int>());
      }
    }

    const Node& nodep = node["propagators"];

    for (unsigned i = 0; i < nodep.size(); i++) {
      unsigned entry = i;
      if (rhs.permute.size() == nodep.size()) {
        entry = rhs.permute[i] - 1;
      }

      if (nodep[entry]["bilinear"]) {
        const Node& bilinear = nodep[entry]["bilinear"];
        rhs.propagator.push_back(std::pair<std::string, std::string>(
            "(" + bilinear[0][0].as<std::string>() + ")*(" +
                bilinear[0][1].as<std::string>() + ")",
            bilinear[1].as<std::string>()));
      }
      else {
        rhs.propagator.push_back(std::pair<std::string, std::string>(
            nodep[entry][0].as<std::string>(),
            nodep[entry][1].as<std::string>()));
      }
    }

    rhs.jule = static_cast<int>(nodep.size());

    int usedOption = 0;

    if (node["top_level_sectors"]) {
      const Node& nodeTop = node["top_level_sectors"];

      for (unsigned i = 0; i < nodeTop.size(); i++) {

        int sectorsTmp = pyred::Integral::parse_sector(nodeTop[i].as<std::string>(),rhs.jule);

        std::cout << "sector number: " << sectorsTmp << std::endl;
        rhs.topLevelSectors.push_back(sectorsTmp);

        int countBount = 0;

        for (int jIt = 0; jIt < rhs.jule; jIt++) {
          if (sectorsTmp & 1 << jIt) {
            countBount++;
          }
        }
        rhs.bound.push_back(countBount);
      }
      usedOption = 1;
    }

    if (node["zero_sectors"]) {
      const Node& nodeTop = node["zero_sectors"];

      for (unsigned i = 0; i < nodeTop.size(); i++) {

        int sectorsTmp = pyred::Integral::parse_sector(nodeTop[i].as<std::string>(),rhs.jule);

        rhs.userZeroSectors.push_back(sectorsTmp);
      }
    }

    rhs.maskCut = 0;

    if (node["cut_propagators"]) {
      const Node& nodeTop = node["cut_propagators"];

      for (unsigned i = 0; i < nodeTop.size(); i++) {
        rhs.cutProps.push_back(nodeTop[i].as<int>());
        rhs.maskCut += (1 << (nodeTop[i].as<int>() - 1));
      }
    }

    if (usedOption == 0) {
      rhs.topLevelSectors.push_back((1 << rhs.jule) - 1);
      rhs.bound.push_back(rhs.jule);
    }

    if (rhs.bound.size() > 0)
      rhs.biggestBound = rhs.bound[0];
    else
      rhs.biggestBound = 0;

    for (unsigned itB = 0; itB < rhs.bound.size(); itB++) {
      if (rhs.bound[itB] > rhs.biggestBound) rhs.biggestBound = rhs.bound[itB];
    }

    if (node["symbolic_ibp"]) {
      const Node& nodeS = node["symbolic_ibp"];
      for (unsigned i = 0; i < nodeS.size(); i++) {
        rhs.symbolicIBP.push_back((nodeS[i].as<int>()) - 1);
      }
    }
    return true;
  }
};

template <>
struct convert<IBPIntegral> {
  static bool decode(const Node& node, IBPIntegral& rhs) {
    const Node& noderef = node;

    rhs.id = noderef[0].as<int>();
    rhs.flag2 = noderef[1].as<int>();
    rhs.characteristics[SECTOR] = noderef[2].as<int>();
    rhs.characteristics[DOTS] = noderef[3].as<int>();
    rhs.characteristics[NUM] = noderef[4].as<int>();
    rhs.length = noderef[5].as<int>();
    for (unsigned i = 6; i < noderef.size() - 1; i++) {
      rhs.indices[i - 6] = noderef[i].as<int>();
    }
    rhs.coefficientString = noderef[noderef.size() - 1].as<std::string>();
    return true;
  }
};
} // namespace YAML

#endif
