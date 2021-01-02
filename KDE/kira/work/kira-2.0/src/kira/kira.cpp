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

// jule is the number of propagators

#include <pthread.h>
#include <sys/stat.h>
#include <yaml-cpp/yaml.h>

#include <algorithm>
#include <fstream>

#include "kira/kira.h"
#include "kira/ReadYamlFiles.h"
#include "kira/dataBase.h"
#include "kira/integral.h"
#include "kira/tools.h"
#include "pyred/integrals.h"
#include "pyred/interface.h"
#include "gzstream/gzstream.h"
#include "sqlite3/sqlite3.h"

using namespace pyred;

using namespace std;
using namespace GiNaC;
using namespace YAML;

static Loginfo& logger = Loginfo::instance();

#ifndef KIRAFIREFLY
Kira::Kira(string name, int coreNumber_ /*,std::string algebra_*/,
           string pyred_config_, int integralOrdering_,
           vector<string> set_variable_, vector<string> trim_,
           string set_sector_) {
#else
Kira::Kira(string name, int coreNumber_ /*,std::string algebra_*/,
           string pyred_config_, int integralOrdering_,
           vector<string> set_variable_, vector<string> trim_,
           string set_sector_, uint32_t bunch_size, int silent_flag_) {
  max_bunch_size = bunch_size;
  silent_flag = silent_flag_;
#endif

  jobName = name;
  coreNumber = coreNumber_;

  pyred_config = pyred_config_;
  integralOrdering = integralOrdering_;

  for (auto it : set_variable_) {
    size_t found;
    string value;
    string variable;

    if ((found = it.find_first_of("=")) == string::npos) {
      logger << "wrong input: " << it << "\n";
      exit(-1);
    }

    istringstream(it.substr(0, found)) >> variable;
    istringstream(it.substr(found + 1, it.size())) >> value;

    setVariable.push_back(make_tuple(variable, value));
  }

  for (auto it : trim_) {
    size_t found;
    uint_fast32_t sector;
    string topology;

    if ((found = it.find_first_of(":")) == string::npos) {
      logger << "wrong input: " << it << "\n";
      exit(-1);
    }

    istringstream(it.substr(0, found)) >> topology;
    istringstream(it.substr(found + 1, it.size())) >> sector;

    systemTrim.push_back(make_tuple(topology, sector));
  }

  setSector = set_sector_;
}

void Kira::select_initial_integrals(std::vector<SeedSpec>& initiateSOE) {

  pyred::Config::symlimits(std::numeric_limits<int>::max(),
                           std::numeric_limits<int>::max());

  for (auto coutI : integralfamily.reductSpec) {

    int dmax = -1;
    if (numeric_limits<int>::max() != get<3>(coutI))
      dmax = get<3>(coutI);

    for (auto itSector : get<0>(coutI)) {

      initiateSOE.push_back(Topology::id_to_topo(integralfamily.topology)
                                ->seed_spec(itSector, get<1>(coutI),
                                            get<2>(coutI), dmax, -1,
                                            SeedSpec::Recursive::full));
    }

    for (auto itM : preferredMasterSectors) {

      int rmax = get<1>(coutI);

      if(get<1>(coutI) < static_cast<int>(count_set_bits(get<3>(itM)))){

        rmax = count_set_bits(get<3>(itM));
      }

      if (topology[get<0>(itM)].topology <= integralfamily.topology) {

        initiateSOE.push_back(
            Topology::id_to_topo(topology[get<0>(itM)].topology)
                ->seed_spec(get<3>(itM), rmax, get<2>(coutI), dmax, -1,
                            SeedSpec::Recursive::full));
      }
    }
  }

  for (auto coutI : integralfamily.reductSpec) {

    for (auto itSector : get<0>(coutI)) {

      int num = get<2>(coutI);
      int dmax = -1;
      // 	    if(get<2>(coutI) > 2)
      // 	      num = 2;
      if (numeric_limits<int>::max() != get<3>(coutI))
        dmax = get<3>(coutI);

      for (int it = 0; it < (1 << integralfamily.jule) + 1; it++) {

        if ((itSector & it) == it) {

          if (integralfamily.symVec[it].size() != 0) {

            initiateSOE.push_back(
                Topology::id_to_topo(integralfamily.symVec[it][0].topology)
                    ->seed_spec(integralfamily.symVec[it][0].sector,
                                get<1>(coutI), num, dmax, -1));
          }


        }
      }
    }
  }
}


std::vector<std::vector<SeedSpec> > initiateAll;
int nonRecursiveCount = 0;

void Kira::select_initial_integrals(std::vector<SeedSpec>& initiateSOE, int recursiveLevel) {

  vector<tuple<int,int,int,int,int> > seedInformation;
  int globalStart = -1;

  for (auto coutI : integralfamily.reductSpec) {

    for (auto itSector : get<0>(coutI)) {

      if(globalStart< (static_cast<int>(count_set_bits(itSector)) - recursiveLevel))
        globalStart = count_set_bits(itSector) - recursiveLevel;
    }
  }


  for (auto itM : preferredMasterSectors) {
    if(globalStart < (static_cast<int>(count_set_bits(get<3>(itM)))-recursiveLevel))
      globalStart = count_set_bits(get<3>(itM))-recursiveLevel;
  }

  for (auto coutI : integralfamily.reductSpec) {

    int num = get<2>(coutI);
    int dmax = -1;
    // 	    if(get<2>(coutI) > 2)
    // 	      num = 2;
    if (numeric_limits<int>::max() != get<3>(coutI))
      dmax = get<3>(coutI);

    for (auto itSector : get<0>(coutI)) {

      for (int it = 0; it < (1 << integralfamily.jule) + 1; it++) {

        if ((itSector & it) == it) {

          if (integralfamily.symVec[it].size() != 0) {

            initiateSOE.push_back(
                Topology::id_to_topo(integralfamily.symVec[it][0].topology)
                    ->seed_spec(integralfamily.symVec[it][0].sector,
                                get<1>(coutI), num, dmax, -1));

            seedInformation.push_back(make_tuple(integralfamily.symVec[it][0].topology, integralfamily.symVec[it][0].sector, get<1>(coutI), num, dmax));
          }

          initiateSOE.push_back(Topology::id_to_topo(integralfamily.topology)
                                ->seed_spec(it, get<1>(coutI),
                                            get<2>(coutI), dmax, -1,
                                            SeedSpec::Recursive::full));

          seedInformation.push_back(make_tuple(integralfamily.topology, it, get<1>(coutI), get<2>(coutI), dmax));

        }
      }
    }
  }


  for (auto coutI : integralfamily.reductSpec) {

    int dmax = -1;
    if (numeric_limits<int>::max() != get<3>(coutI))
      dmax = get<3>(coutI);

    for (auto itM : preferredMasterSectors) {

      int rmax = get<1>(coutI);

      if(get<1>(coutI) < static_cast<int>(count_set_bits(get<3>(itM))))

        rmax = count_set_bits(get<3>(itM));

      if (topology[get<0>(itM)].topology <= integralfamily.topology) {

        for(int jt = (count_set_bits(get<3>(itM))-1); jt >= 0; jt--){

          for (int it = 0; it < (1 << integralfamily.jule) + 1; it++) {

            if ((get<3>(itM) & it) == it) {
              initiateSOE.push_back(
                  Topology::id_to_topo(topology[get<0>(itM)].topology)
                      ->seed_spec(it, rmax, get<2>(coutI), dmax, -1, SeedSpec::Recursive::dotsp));

              seedInformation.push_back(make_tuple(topology[get<0>(itM)].topology, it, rmax, get<2>(coutI), dmax));
            }
          }
        }
      }
    }
  }

  sort(seedInformation.begin(),seedInformation.end());
  auto lastH = unique(seedInformation.begin(),seedInformation.end());
  seedInformation.resize( std::distance(seedInformation.begin(),lastH) );

  initiateAll.clear();
  nonRecursiveCount = 0;
  std::vector<SeedSpec> initiatePart;

  for(auto it: seedInformation){
    if(static_cast<int>(count_set_bits(get<1>(it))) > globalStart){
      initiatePart.push_back(Topology::id_to_topo(get<0>(it))
                      ->seed_spec(get<1>(it), get<2>(it), get<3>(it), get<4>(it), -1, SeedSpec::Recursive::dotsp));
      nonRecursiveCount++;
    }
  }
  if(initiatePart.size()>0){
    initiateAll.push_back(initiatePart);
    initiatePart.clear();
  }

  for(auto rit = seedInformation.rbegin(); rit != seedInformation.rend(); rit++){
    auto it=(*rit);
    if(static_cast<int>(count_set_bits(get<1>(it))) <= globalStart){

      int flagGo = 1;
      for(auto st: seedInformation){
        if(get<0>(it) == get<0>(st)
          && (get<1>(st) & get<1>(it)) == get<1>(it)
          && static_cast<int>(count_set_bits(get<1>(st))) <= globalStart
          && count_set_bits(get<1>(st)) > count_set_bits(get<1>(it))
        )
        flagGo = 0;
      }

      if(flagGo == 1){
        initiatePart.push_back(Topology::id_to_topo(get<0>(it))
                        ->seed_spec(get<1>(it), get<2>(it), get<3>(it), get<4>(it), -1, SeedSpec::Recursive::full));
        initiateAll.push_back(initiatePart);
        initiatePart.clear();
      }
    }
  }
  logger << "Different consecutive reductions generated: " << initiateAll.size() << ".\n";
  logger << "Number of sectors generated without a numerical reduction: " << nonRecursiveCount << ".\n";
}

void Kira::complement_initial_integrals(std::vector<SeedSpec>& complementSOE) {
  for (auto coutI : integralfamily.reductSpec) {
    int num = get<2>(coutI);
    int dmax = -1;
    //   	      if(get<2>(coutI) > 2)
    //                 num = 2;
    if (numeric_limits<int>::max() != get<3>(coutI)) dmax = get<3>(coutI);

    for (auto itSector : get<0>(coutI)) {
      for (int it = 0; it < (1 << integralfamily.jule) + 1; it++) {
        if ((itSector & it) == it) {
          if (integralfamily.symVec[it].size() != 0 &&
              integralfamily.symVec[it][0].symDOTS == 0) {
            complementSOE.push_back(
                Topology::id_to_topo(integralfamily.topology)
                    ->seed_spec(it, get<1>(coutI), num, dmax, -1,
                                SeedSpec::Recursive::dotsp));
          }
        }
      }
    }
  }
}

bool sort_rules7(eqdata& l, eqdata& r) {
  if (l[0].first < r[0].first)
    return true;
  else if (l[0].first > r[0].first)
    return false;

  unsigned length = 0;
  if (l.size() < r.size())
    length = l.size();
  else
    length = r.size();

  if (length > 1) {
    if (l[0].first < r[0].first)
      return true;
    else if (l[0].first > r[0].first)
      return false;
  }

  if (l.size() < r.size())
    return true;
  else if (l.size() > r.size())
    return false;

  for (unsigned it = 0; it < l.size(); it++) {
    if (l[it].first < r[it].first)
      return true;
    else if (l[it].first > r[it].first)
      return false;
  }

  return false;
}

void Kira::write_seeds_to_disk(vector<pyred::intid>& mandatory) {

  if (dataFile == 1) {

    ofstream id2int;

    id2int.open(
        (outputDir + "/results/" + integralfamily.name + "/id2int").c_str());

    logger << "\n*****Write seeds to hard disk***************************\n";

    for (auto ItSeed = mandatory.begin(); ItSeed != mandatory.end(); ItSeed++) {
      auto iglback = pyred::Integral(*ItSeed);

      auto property = iglback.properties(*ItSeed);

      id2int << "- [" << *ItSeed << ",";
      for (int itt = 0; itt < integralfamily.jule; itt++)
        id2int << iglback.m_powers[itt] << ",";
      id2int << property.sector << ",";
      id2int << property.topology << ",";
      id2int << property.lines << ",";
      id2int << property.dots << ",";
      id2int << property.sps << ",";
      id2int << "0";
      id2int << "]\n";
    }

    id2int.close();
  }
}

// void copyStream(string& file, string& content) {
//   rename(file.c_str(), (file + "B").c_str());
//
//   GZSTREAM_NAMESPACE::igzstream inputGZ((file + "B").c_str());
//
//   int iterFILE;
//
//   for (iterFILE = 0; inputGZ.eof() != true; iterFILE++)
//     content += inputGZ.get();
//
//   iterFILE--;
//   content.erase(content.end() - 1);
//
//   inputGZ.close();
//   remove((file + "B").c_str());
// }

string construct_string_sector(uint32_t sec){
  string constructSector = to_string(sec);
  if(constructSector.size()<2)
    constructSector = "000000000"+constructSector;
  if(constructSector.size()<3)
    constructSector = "00000000"+constructSector;
  if(constructSector.size()<4)
    constructSector = "0000000"+constructSector;
  if(constructSector.size()<5)
    constructSector = "000000"+constructSector;
  if(constructSector.size()<6)
    constructSector = "00000"+constructSector;
  if(constructSector.size()<7)
    constructSector = "0000"+constructSector;
  if(constructSector.size()<8)
    constructSector = "000"+constructSector;
  if(constructSector.size()<9)
    constructSector = "00"+constructSector;
  if(constructSector.size()<10)
    constructSector = "0"+constructSector;
  return constructSector;
}

class EquationGetter {
private:
  // Using a (copyable) pointer here is essential, because when an instance
  // of EquationGetter is bound to a std::function object, the EquationGetter
  // is copied. I.e. if we had a std::vector<eqdata> member instead,
  // the equations would be inserted into a copy of the system which is not
  // accessible through the EquationGetter instance.
  std::shared_ptr<eqdata> eq;
  std::shared_ptr<GZSTREAM_NAMESPACE::ogzstream> output;
  std::shared_ptr<GZSTREAM_NAMESPACE::ogzstream> TMPfile;
  std::shared_ptr<uint64_t> countT;
  std::string outputDir;
  std::string integralfamilyName;
  std::vector<std::string> topologyNames;
  int weightMode;
  int generateFlag;
  std::unordered_map<pyred::intid, pyred::intid> mastersMap;
  std::tuple<unsigned, unsigned> printControl;
  std::string topologyNames2;

public:
  EquationGetter(std::string& outputDir_, std::string& integralfamilyName_,
                 std::vector<std::string>& topologyNames_,
                 std::unordered_map<pyred::intid, pyred::intid>& mastersMap_, int generateFlag_, int weightMode_)
      : eq{std::make_shared<eqdata>()},
        output{std::make_shared<GZSTREAM_NAMESPACE::ogzstream>()},
        TMPfile{std::make_shared<GZSTREAM_NAMESPACE::ogzstream>()},
        countT{std::make_shared<uint64_t>()},
        outputDir{outputDir_},
        integralfamilyName{integralfamilyName_},
        topologyNames{topologyNames_},
        weightMode{weightMode_},
        generateFlag{generateFlag_},
        mastersMap{mastersMap_}{
    get<0>(printControl) = numeric_limits<unsigned>::max();
    get<1>(printControl) = numeric_limits<unsigned>::max();
    (*countT) = 0;
  }

  eqdata& getEquations() { return *eq; }

  void operator()(eqdata&& eq_) {
    (*eq) = std::move(eq_);

    for (std::size_t i = 0; i != (*eq).size(); ++i) {
      for (std::size_t j = i + 1; j != (*eq).size(); ++j) {
        if (((*eq).begin() + i)->first < ((*eq).begin() + j)->first) {
          iter_swap((*eq).begin() + i, (*eq).begin() + j);
        }
      }
    }

    std::tuple<std::string, unsigned, unsigned> integral;
    get_properties((*eq)[0].first, integral);

    if(generateFlag==1){
    /*input system option
     *Kira writes system of equations in weight notation*/

      if (get<2>(integral) != get<0>(printControl) ||
          get<1>(integral) != get<1>(printControl)) {
        get<1>(printControl) = get<1>(integral);
        get<0>(printControl) = get<2>(integral);

        (*TMPfile).close();

        string constructSector = construct_string_sector(get<2>(integral));

        string fileName = (outputDir + "/input_kira/" + integralfamilyName + "/SYSTEM_" + topologyNames[get<1>(integral)] + "_" +constructSector + ".kira.gz");

//         (*TMPfile).open(fileName.c_str(),std::ios::app);
        if (file_exists(fileName.c_str())) {

          int itF = 0;
          while(1){

            string tmpfileName = (outputDir + "/input_kira/" + integralfamilyName + "/SYSTEM_" + topologyNames[get<1>(integral)] + "_" + constructSector+ "_" + to_string(itF) + ".kira.gz");

            if (!file_exists(tmpfileName.c_str())) {
              (*TMPfile).open(tmpfileName.c_str());
              break;
            }
            itF++;
          }
        }
        else {
          (*TMPfile).open(fileName.c_str());
        }


      }

      if(weightMode){

        (*TMPfile) << (*eq)[0].first << "*(";
        (*TMPfile) << (*eq)[0].second << ")\n";

        for (std::size_t i = 1; i != (*eq).size(); ++i) {

          (*TMPfile) << (*eq)[i].first << "*(";
          (*TMPfile) << (*eq)[i].second << ")\n";
        }
        (*TMPfile) << "\n";
      }
      else{

        (*TMPfile) << topologyNames[get<1>(integral)] << "[" << get<0>(integral) << "]*(";
        (*TMPfile) << (*eq)[0].second << ")\n";

        for (std::size_t i = 1; i != (*eq).size(); ++i) {

          get_properties((*eq)[i].first, integral);
          (*TMPfile) << topologyNames[get<1>(integral)] << "[" << get<0>(integral) << "]*(";
          (*TMPfile) << (*eq)[i].second <<")\n";
        }
        (*TMPfile) << "\n";
      }
    }
    else{

      if (get<2>(integral) != get<0>(printControl) ||
          get<1>(integral) != get<1>(printControl)) {
        get<1>(printControl) = get<1>(integral);
        get<0>(printControl) = get<2>(integral);


        (*output).close();

        string fileName = (outputDir + "/tmp/" + integralfamilyName +
                              "/SYSTEM_" + topologyNames[get<1>(integral)] + "_" +
                              to_string(get<2>(integral)) + ".gz");

        if (file_exists(fileName.c_str())) {

          int itF = 0;
          while(1){

            string tmpfileName = (outputDir + "/tmp/" + integralfamilyName + "/SYSTEM_" + topologyNames[get<1>(integral)] + "_" + to_string(get<2>(integral))+ "_" + to_string(itF) + ".gz");

            if (!file_exists(tmpfileName.c_str())) {
              (*output).open(tmpfileName.c_str());
              break;
            }
            itF++;
          }
        }
        else {
          (*output).open(fileName.c_str());
        }
//         (*output).open(fileName.c_str(),std::ios::app);
      }
      (*output) << "Eq" << "\n";
      (*output) << (*eq)[0].first << "\n";
      (*output) << (*eq).size() << "\n";
      (*output) << (*eq).size() << " ";
      (*output) << (*eq)[0].second << " ";
      (*output) << (*eq)[0].first << " ";
      (*output) << get<2>(integral) << " ";
      (*output) << get<1>(integral) << " ";
      (*output) << 0 << "\n";


      for (std::size_t i = 1; i != (*eq).size(); ++i) {
        get_properties((*eq)[i].first, integral);

        (*output) << (*eq).size() << " ";
        (*output) << (*eq)[i].second << " ";
        (*output) << (*eq)[i].first << " ";
        (*output) << get<2>(integral) << " ";
        (*output) << get<1>(integral) << " ";
        (*output) << 0 << "\n";
      }
    }
    (*countT)++;
  };

  void finalize() {

    if(generateFlag==1){
      /*input system option is activated*/
      (*TMPfile).close();
    }
    else{
      (*output).close();
      ofstream outputConfig;
      outputConfig.open(
          (outputDir + "/tmp/" + integralfamilyName + "/SYSTEMconfig").c_str());
      outputConfig << (*countT) << endl;
      outputConfig.close();
    }

    logger << "\nNumber of selected equations to reduce: " << (*countT)
           << " equations\n";
  };
};

Fermat* Kira::fermat;
std::string Kira::treatcoeff2(const std::string& str_) {
  string str = str_;
  size_t found;

  if ((found = str.find_first_of("+")) != string::npos && found == 0) {
    str.erase(str.begin() + found, str.begin() + found + 1);
  }

  while ((found = str.find("(+")) != string::npos) {
    str.erase(str.begin() + found + 1, str.begin() + found + 2);
  }

  fermat[0].fermat_collect(const_cast<char*>(str.c_str()));

  fermat[0].fermat_calc();

  return fermat[0].g_baseout;
}


void Kira::generate_input_system(std::vector<pyred::intid>& /*selected_integrals*/, int recursiveLevel, int weightMode) {

  Clock clock;

  //   select integrals
  std::vector<SeedSpec> initiateSOE;
  select_initial_integrals(initiateSOE, recursiveLevel);


  //   complement integrals
  std::vector<SeedSpec> complementSOE;
  complement_initial_integrals(complementSOE);

  string unfinished_jobs = (outputDir + "/input_kira/unfinished_jobs_" + integralfamily.name);

  uint32_t todo = 0;

  if (file_exists(unfinished_jobs.c_str())){
    ifstream input(unfinished_jobs);
    while (1) {
      if (!(input >> todo)) break;
    }
  }
  else{
    ofstream output(unfinished_jobs);
    output << initiateAll.size();
    todo = initiateAll.size();
  }

  uint32_t counter = 0;

  for (auto initiateSeed: initiateAll){

    logger << "Generating equations step: " << (initiateAll.size()-todo) << " / " << initiateAll.size() << "\n";

    if((initiateAll.size()-todo) > counter){
      counter++;
      continue;
    }

    int cache_level{2};
    int auto_clear_cache_level{2};

    Integral::use_cache(cache_level);
    Integral::auto_clear_cache(auto_clear_cache_level);

    auto sys = System();
    const std::function<std::string(const std::string&)> treatcoeff = treatcoeff2;
    EquationGetter treateq{outputDir, integralfamily.name, topologyNames,
                              mastersMap, 1, weightMode};

    if(counter == 0 && nonRecursiveCount > 0){

      sys.generate_retrieve(initiateSeed, complementSOE, {},{}, treateq, treatcoeff);
      treateq.finalize();
    }
    else{
      auto sys = System();
      auto indep_eqnums = sys.generate_solve(initiateSeed, complementSOE, {});

      logger << IntegralRelations::cache<Coeff_int>().size();
      logger << " independent coefficients\n";

//       auto initial_seeds = sys.unreduced();
      std::vector<pyred::intid> initial_seeds;
      auto& content = sys.reduction_content();

      for (auto itContent: content) {
        initial_seeds.push_back(itContent.first);
      }

      std::pair<std::vector<intid>, std::vector<intid> > selection;

      selection = sys.select(initial_seeds, {});

      logger << "\nThe option generate input system does not give the\n";
      logger << "number of master integrals, yet.\n";
      logger << "Run the option reduce_user_defined_system in the job file\n";
      logger << "to get the number of master integrals.\n";

      auto masters = selection.second;

      logger << "Regenerate:\n";
      sys.generate_retrieve(std::move(selection.first), treateq, treatcoeff);
    }

    logger << "( " << clock.eval_time() << " s )\n";

    ofstream output(unfinished_jobs);
    output << (--todo);
    counter++;

  }
//   remove(unfinished_jobs.c_str());
}


void Kira::generate_SOE(std::vector<pyred::intid>& selected_integrals) {
  Clock clock;

  // Best performance with several threads: cache_level=2,
  // auto_clear_cache_level=2 (single threaded may be faster with cache_level=2,
  // auto_clear_cache_level=0).
  int cache_level{2};
  int auto_clear_cache_level{2};
  // cache_level: 0=(no cache), 1=(weight to integral only),
  //              2=(integral to weight only), 3=(both)
  Integral::use_cache(cache_level);
  Integral::auto_clear_cache(auto_clear_cache_level);

  //   select integrals
  std::vector<SeedSpec> initiateSOE;
  select_initial_integrals(initiateSOE);

  //   complement integrals
  std::vector<SeedSpec> complementSOE;
  complement_initial_integrals(complementSOE);

  //   Initiate system without symmetries
  //   auto sys = pyred::System(initiateSOE,
  //      {Topology::id_to_topo(0)->seed_spec(0,1,1)}/*, initiateSYMOE*/);

  //   Initiate system with symmetries
  auto sys = System();
  auto indep_eqnums = sys.generate_solve(initiateSOE, complementSOE, {});

  //   auto sys = pyred::System(initiateSOE, {}/*initiateSYMOE*/);

  logger << IntegralRelations::cache<Coeff_int>().size();
  logger << " independent coefficients\n";

  const std::function<std::string(const std::string&)> treatcoeff = treatcoeff2;

  EquationGetter treateq{outputDir, integralfamily.name, topologyNames,
                         mastersMap, 0, 0};

  //   Regenerate the system because we need unmodified equations to extract.
  logger << "Regenerate:\n";

  std::pair<std::vector<intid>, std::vector<intid> > selection;

  selection = sys.select(selected_integrals, {});

  auto masters = selection.second;
  //     logger << masters.size() << " master integrals\n";

  string pathMI = outputDir + "/results/" + integralfamily.name + "/masters";
  ofstream myfile;
  myfile.open(pathMI.c_str());

  logger << "\nNumber of master integrals: " << masters.size() << "\n";

  for (auto itg : masters) {
    tuple<string, unsigned, unsigned> integral;
    get_properties((itg), integral);
    logger << (itg) << ": ";
    logger << topologyNames[get<1>(integral)] << ": ";
    logger << get<0>(integral) << ": ";
    logger << get<2>(integral);
    logger << "\n";

    myfile << (itg) << ": ";
    myfile << topologyNames[get<1>(integral)] << ": ";
    myfile << get<0>(integral) << ": ";
    myfile << get<2>(integral);
    myfile << "\n";
  }

  sys.generate_retrieve(std::move(selection.first), treateq, treatcoeff);

  treateq.finalize();

  if (writeNumericalSystem) {
    auto& content = sys.reduction_content();

    ofstream output(
        (outputDir + "/results/" + integralfamily.name + "/reducedEqs")
            .c_str());

    for (auto itContent = content.begin(); itContent != content.end();
         ++itContent) {
      output << "integral ID: " << ((*itContent).first) << " "
             << "\n";
      output << "masters ID: ";

      auto vecTupel = get<1>((*itContent).second);

      for (auto iter = vecTupel.begin(); iter != vecTupel.end(); ++iter) {
        output << (*iter) << " ";
      }
      output << "\n";
    }

    output.close();
  }

  logger << "( " << clock.eval_time() << " s )\n";
}

void Kira::run_pyred(std::vector<pyred::intid>& mandatory,
                     std::vector<pyred::intid>& optional, pyred::System& sys) {
  Clock clock;
  logger << "\n***** Starting PYRED **************************************\n";

  logger << "mandatory: " << mandatory.size() << "\n";

  for (const auto& topoptr : pyred::Topology::get_topologies()) {
    logger << "Defined topology " << topoptr->name() << "\n";
  }

  /*auto indep_eqnums = */sys.solve();

  std::pair<std::vector<intid>, std::vector<intid> > selection;

  if (mandatory.size() == 0) {

    std::vector<pyred::intid> initial_seeds;
    auto& content = sys.reduction_content();

    for (auto itContent: content) {
      initial_seeds.push_back(itContent.first);
    }

    selection = sys.select(initial_seeds, optional);
  }
  else {
    selection = sys.select(mandatory, optional);
  }

  std::vector<pyred::eqdata> equations;
  equations = sys.retrieve(std::move(selection.first));

  auto masters = selection.second;
  string pathMI = outputDir + "/results/" + integralfamily.name + "/masters";
  ofstream myfile;
  myfile.open(pathMI.c_str());

  logger << "\nNumber of master integrals: " << masters.size() << "\n";

  for (auto itg : masters) {
    tuple<string, unsigned, unsigned> integral;
    get_properties((itg), integral);
    logger << (itg) << ": ";
    logger << topologyNames[get<1>(integral)] << ": ";
    logger << get<0>(integral) << ": ";
    logger << get<2>(integral);
    logger << "\n";

    myfile << (itg) << ": ";
    myfile << topologyNames[get<1>(integral)] << ": ";
    myfile << get<0>(integral) << ": ";
    myfile << get<2>(integral);
    myfile << "\n";
  }

  GZSTREAM_NAMESPACE::ogzstream output;
  uint64_t countT;
  std::tuple<unsigned, unsigned> printControl;

  get<0>(printControl) = numeric_limits<unsigned>::max();
  get<1>(printControl) = numeric_limits<unsigned>::max();
  countT = 0;

  for (auto eq : equations) {
    for (std::size_t i = 0; i != eq.size(); ++i) {
      for (std::size_t j = i + 1; j != eq.size(); ++j) {
        if ((eq.begin() + i)->first < (eq.begin() + j)->first) {
          iter_swap(eq.begin() + i, eq.begin() + j);
        }
      }
    }
    std::tuple<std::string, unsigned, unsigned> integral;

    get_properties(eq[0].first, integral);

    if (get<2>(integral) != get<0>(printControl) ||
        get<1>(integral) != get<1>(printControl)) {
      get<1>(printControl) = get<1>(integral);
      get<0>(printControl) = get<2>(integral);

      output.close();

      string fileName = (outputDir + "/tmp/" + integralfamily.name +
                           "/SYSTEM_" + topologyNames[get<1>(integral)] + "_" +
                           to_string(get<2>(integral)) + ".gz");

      if (file_exists(fileName.c_str())) {

        int itF = 0;
        while(1){
          string tmpfileName = (outputDir + "/tmp/" + integralfamily.name + "/SYSTEM_" + topologyNames[get<1>(integral)] + "_" + to_string(get<2>(integral))+ "_" + to_string(itF) + ".gz");

          if (!file_exists(tmpfileName.c_str())) {
            output.open(tmpfileName.c_str());
            break;
          }
          itF++;
        }
      }
      else {
        output.open(fileName.c_str());
      }
    }

    output << "Eq"
           << "\n";
    output << eq[0].first << "\n";
    output << eq.size() << "\n";
    output << eq.size() << " ";
    output << eq[0].second << " ";
    output << eq[0].first << " ";
    output << get<2>(integral) << " ";
    output << get<1>(integral) << " ";
    output << 0 << "\n";

    for (std::size_t i = 1; i != eq.size(); ++i) {
      get_properties(eq[i].first, integral);

      output << eq.size() << " ";
      output << eq[i].second << " ";
      output << eq[i].first << " ";
      output << get<2>(integral) << " ";
      output << get<1>(integral) << " ";
      output << 0 << "\n";
    }
    countT++;
  }

  output.close();
  ofstream outputConfig;
  outputConfig.open(
      (outputDir + "/tmp/" + integralfamily.name + "/SYSTEMconfig").c_str());
  outputConfig << countT << endl;
  outputConfig.close();
  logger << "\nNumber of selected equations to reduce: " << countT
         << " equations\n";

  logger << "( " << clock.eval_time() << " s )\n";
}

void Kira::run_pyred_otf(std::vector<pyred::intid>& mandatory,
                     std::vector<pyred::intid>& optional, pyred::System& sys, std::vector<std::string> & files) {
  Clock clock;
  logger << "\n***** Starting PYRED **************************************\n";

  logger << "mandatory: " << mandatory.size() << "\n";

  for (const auto& topoptr : pyred::Topology::get_topologies()) {
    logger << "Defined topology " << topoptr->name() << "\n";
  }

  sys.add_forward(files,vector<string> {".kira",".kira.gz"});

  std::vector<pyred::eqdata> equations;

  EquationGetter treateq{outputDir, integralfamily.name, topologyNames,
                         mastersMap, 0, 0};

  std::pair<std::vector<intid>, std::vector<intid> > selection;

  if (mandatory.size() == 0) {

    sys.backward();

//     auto initial_seeds = sys.unreduced();
    std::vector<pyred::intid> initial_seeds;
    auto& content = sys.reduction_content();

    for (auto itContent: content) {
      initial_seeds.push_back(itContent.first);
    }

    selection = sys.select(initial_seeds, optional);
  }
  else {
    sys.backward();
    selection = sys.select(mandatory, optional);
  }

  sys.file_retrieve(files, vector<string>{".kira",".kira.gz"}, std::move(selection.first), treateq);

  treateq.finalize();

  auto masters = selection.second;
  string pathMI = outputDir + "/results/" + integralfamily.name + "/masters";
  ofstream myfile;
  myfile.open(pathMI.c_str());

  logger << "\nNumber of master integrals: " << masters.size() << "\n";

  for (auto itg : masters) {
    tuple<string, unsigned, unsigned> integral;
    get_properties((itg), integral);
    logger << (itg) << ": ";
    logger << topologyNames[get<1>(integral)] << ": ";
    logger << get<0>(integral) << ": ";
    logger << get<2>(integral);
    logger << "\n";

    myfile << (itg) << ": ";
    myfile << topologyNames[get<1>(integral)] << ": ";
    myfile << get<0>(integral) << ": ";
    myfile << get<2>(integral);
    myfile << "\n";
  }
}


void Kira::set_masters2zero_sectorwise(std::vector<std::tuple<pyred::intid, std::string, std::string, std::string, uint32_t> >& masterVector) {

  uint32_t sectorTmp = std::numeric_limits<uint32_t>::max();

  for (size_t i = 0; i < masterVector.size(); i++) {

    if(std::numeric_limits<uint32_t>::max() == get<4>(masterVector[i])){
      logger << "Sector: " << std::numeric_limits<uint32_t>::max() << " is used\n";
      logger << "If you want to reduce sector: " << std::numeric_limits<uint32_t>::max() << " consult the Kira development team.\n";
      exit(0);
    }

    if( get<4>(masterVector[i]) != sectorTmp){

      if(i > 0){

        std::vector<uint64_t> vectorOfMasters;

        for (size_t j = 0; j < masterVector.size(); j++) {

          if(get<4>(masterVector[j]) != sectorTmp){

            vectorOfMasters.push_back(get<0>(masterVector[j]));
          }
        }
        mastersSetZero.push_back(vectorOfMasters);
        vectorOfMasters.clear();
      }

      sectorTmp = get<4>(masterVector[i]);
    }
  }

  std::vector<uint64_t> vectorOfMasters;

  for (size_t j = 0; j < masterVector.size(); j++) {

    if(get<4>(masterVector[j]) != sectorTmp){

      vectorOfMasters.push_back(get<0>(masterVector[j]));
    }
  }

  if(vectorOfMasters.size()>0){

    mastersSetZero.push_back(vectorOfMasters);
  }
  vectorOfMasters.clear();
}

void Kira::set_masters2zero_masterwise(std::vector<std::tuple<pyred::intid, std::string, std::string, std::string, uint32_t> >& masterVector) {

  for (size_t i = 0; i < masterVector.size(); i++) {

    std::vector<uint64_t> vectorOfMasters;

    for (size_t j = 0; j < masterVector.size(); j++) {

      if(get<0>(masterVector[i]) != get<0>(masterVector[j])){

        vectorOfMasters.push_back(get<0>(masterVector[j]));
      }
    }
    mastersSetZero.push_back(vectorOfMasters);
    vectorOfMasters.clear();
  }
}

void Kira::set_masters2zero() {
  string masterFileName =
      outputDir + "/results/" + integralfamily.name + "/masters";
  ifstream input;

  vector<tuple<pyred::intid, string, string, string, uint32_t> > masterVector;

  if (file_exists(masterFileName.c_str())) {
    input.open(masterFileName.c_str());
    while (1) {
      pyred::intid ID;
      string tmp1, tmp2, tmp3;
      uint32_t tmp4;
      if (!(input >> ID)) break;
      if ((input >> tmp1)) {
      };
      if ((input >> tmp2)) {
      };
      if ((input >> tmp3)) {
      };
      if ((input >> tmp4)) {
      };

      masterVector.push_back(make_tuple(ID, tmp1, tmp2, tmp3, tmp4));
    }
    input.close();
  }

  if (trimmedSectors.size() > 0) {

    std::vector<uint64_t> vectorOfMasters;

    for (size_t i = 0; i < masterVector.size(); i++) {

      int flagSetZero = 1;

      string topo = get<2>(masterVector[i]);
      topo.erase(topo.end() - 1, topo.end());

      for (auto itS : trimmedSectors) {

        if (get<4>(masterVector[i]) == get<0>(itS) && topo == get<1>(itS)) {

          flagSetZero = 0;
        }
      }
      if (flagSetZero) vectorOfMasters.push_back(get<0>(masterVector[i]));
    }
    mastersSetZero.push_back(vectorOfMasters);
  }

  auto ret = selectMastersReduction.equal_range(integralfamily.name);

  if (ret.first != selectMastersReduction.end()) {
    for (auto itRet = ret.first; itRet != ret.second; ++itRet) {
      std::vector<uint64_t> vectorOfMasters;

      for (size_t i = 0; i < masterVector.size(); i++) {
        auto findMaster =
            find((itRet->second).begin(), (itRet->second).end(), i + 1);

        if (findMaster == (itRet->second).end()) {
          vectorOfMasters.push_back(get<0>(masterVector[i]));
        }
      }
      mastersSetZero.push_back(vectorOfMasters);
    }
  }

  if(iterativeReduction == "sectorwise"){
    set_masters2zero_sectorwise(masterVector);
  }

  if(iterativeReduction == "masterwise"){

    set_masters2zero_masterwise(masterVector);
  }

  if(mastersSetZero.size()){
    logger << "Kira will start iterative reduction in mode: " << iterativeReduction << "\n";
    logger << "\nNumber of different consecutive bunches/reductions: " << mastersSetZero.size() << "\n";
  }
}

int Kira::complete_reduction() {

  DataBase* database = new DataBase(outputDir + "/results/kira.db");

  database->create_equation_table();

  delete database;

  string kiraSaveName = "kira";

  if (mastersSetZero.size()) {
    int counterMSZ = 0;
    for (auto masters2Skip : mastersSetZero) {

      logger << "\n***** Run the back substitution ***********************\n\n";
      logger << "Iterative reduction step: " << counterMSZ <<".\n";

      if( iterativeReduction == "sectorwise" || iterativeReduction == "masterwise"){
        kiraSaveName = "kira"+ to_string(counterMSZ);
        DataBase* database = new DataBase(outputDir + "/results/" + kiraSaveName + ".db");
        std::vector<std::string> copy{(outputDir + "/results/kira.db")};
        database->merge_databases(copy);
        delete database;

      }
      counterMSZ++;

      logger << "Set these master integrals to zero:\n";

      masterVectorSkip = masters2Skip;

      for (auto itM : masterVectorSkip) {
        tuple<string, unsigned, unsigned> integral;

        get_properties(itM, integral);

        logger << itM << ": ";
        logger << topologyNames[get<1>(integral)] << ": ";
        logger << get<0>(integral) << ": ";
        logger << get<2>(integral);
        logger << "\n";
      }

      if (!load_back_substitution(kiraSaveName)) {
        continue;
      }
      back_subs(kiraSaveName);
      clean_back_subs();
    }
  }
  else {
    logger << "\n***** Run the back substitution ***********************\n\n";

    if (!load_back_substitution(kiraSaveName)) {
//       clean_back_subs();
      return 0;
    }
    back_subs(kiraSaveName);
    clean_back_subs();
  }

  if( iterativeReduction == "sectorwise" || iterativeReduction == "masterwise"){
    logger << "\n***** Merge reduction files from iterative reductions \n\n";

    DataBase* database = new DataBase(outputDir + "/results/kira.db");
    int counterMSZ = 0;
    for (auto masters2Skip : mastersSetZero) {
      kiraSaveName = "kira"+ to_string(counterMSZ);

      std::vector<std::string> copy{(outputDir + "/results/" + kiraSaveName + ".db")};
      database->merge_databases(copy);
      counterMSZ++;
    }
    delete database;
  }


  return 1;
}

void Kira::clean_back_subs() {
  for (unsigned it = 0, end = totalReihen + 1; it != end; it++) {
    if (length[it]) {
      delete[] allEq[it][0];
    }
    if (allEq[it] != 0) delete[] allEq[it];
  }

  delete[] rdy2P;
  delete[] last_reduce;
  delete[] length;
  delete[] allEq;
  reduct2StartHere.clear();
  occurrence.clear();
  reverseLastReduce.clear();
  masterVectorSkip.clear();
}

void Kira::print_equationSW(BaseIntegral*& integral,
                            GZSTREAM_NAMESPACE::ogzstream& output,
                            ofstream& outputX,
                            tuple<int, int, unsigned, int>& printControl,
                            tuple<string, string>& dest, int& rememberID) {
  if (integral[0].characteristics[SECTOR] != get<0>(printControl) ||
      integral[0].characteristics[TOPOLOGY] != get<1>(printControl)) {
    get<0>(printControl) = integral[0].characteristics[SECTOR];
    get<1>(printControl) = integral[0].characteristics[TOPOLOGY];

    if (get<0>(printControl) != static_cast<int>(get<2>(printControl)) ||
        get<1>(printControl) != get<3>(printControl)) {

      output.close();
      outputX.close();
      get<0>(dest) = integralfamily.name + "/SYSTEMx";
      get<1>(dest) = "";
      string name = outputDir + "/tmp/" + get<0>(dest) + "_" +
                    topologyNames[get<1>(printControl)] + "_" +
                    something_string(get<0>(printControl)) + get<1>(dest);
      outputX.open(name.c_str(), std::fstream::app);
    }
    else {
      outputX.close();
      output.close();
      get<0>(dest) = integralfamily.name + "/VER";
      get<1>(dest) = ".tmp";
      string name = outputDir + "/tmp/" + get<0>(dest) + "_" +
                    topologyNames[get<1>(printControl)] + "_" +
                    something_string(get<0>(printControl)) + get<1>(dest) +
                    ".gz";
      output.open(name.c_str());
    }
  }
  if (get<1>(dest) != ".tmp") {
    integral[0].coefficientString = "-1";
    outputX << "Eq"
            << "\n";
    outputX << integral[0].id << "\n";
    outputX << integral[0].length << "\n";

    for (unsigned j = 0; j < integral[0].length; j++) {
      integral[j].length = integral[0].length;
      outputX << integral[j];
    }
  }
  else {
    rememberID++;
    output << "Eq"
           << "\n";
    output << integral[0].id << "\n";
    output << integral[0].length << "\n";

    for (unsigned j = 0; j < integral[0].length; j++) {
      integral[j].length = integral[0].length;
      output << integral[j];
    }
  }
}

void Kira::print_equation(BaseIntegral*& integral,
                          GZSTREAM_NAMESPACE::ogzstream& output,
                          ofstream& /*outputX*/,
                          tuple<int, int /*,unsigned,int*/>& printControl,
                          tuple<string, string>& dest) {
  if (integral[0].characteristics[SECTOR] != get<0>(printControl) ||
      integral[0].characteristics[TOPOLOGY] != get<1>(printControl)) {
    get<0>(printControl) = integral[0].characteristics[SECTOR];
    get<1>(printControl) = integral[0].characteristics[TOPOLOGY];

    output.close();

    get<0>(dest) = integralfamily.name + "/VER";
    get<1>(dest) = "";
    string name = outputDir + "/tmp/" + get<0>(dest) + "_" +
                  topologyNames[get<1>(printControl)] + "_" +
                  something_string(get<0>(printControl)) + get<1>(dest) + ".gz";

    int count = 1;
    while (file_exists(name.c_str())) {
      name = outputDir + "/tmp/" + get<0>(dest) + "_" +
             topologyNames[get<1>(printControl)] + "_" +
             something_string(get<0>(printControl)) + get<1>(dest) + "_" +
             to_string(count++) + ".gz";
    }

    output.open(name.c_str());
  }

  output << "Eq"
         << "\n";
  output << integral[0].id << "\n";
  output << integral[0].length << "\n";

  for (unsigned j = 0; j < integral[0].length; j++) {
    integral[j].length = integral[0].length;
    output << integral[j];
  }
}

void Kira::write_pyred(vector<vector<pair<pyred::intid, string> > >& eqs, /*
   vector<vector<int> > & arraySeed,*/
                       vector<pyred::intid>& /*independent_eqnums*/) {
  logger << "\nWrite with PYRED reduced system to hard disk \n";
  logger << "(--> " << outputDir << "/tmp/NUMconfig, " << outputDir
         << "/tmp/NUM###) \n";

  ofstream output;

  output.open(
      (outputDir + "/tmp/" + integralfamily.name + "/NUMconfig").c_str());
  output << eqs[eqs.size() - 1][0].first << "\n";

  pair<unsigned, unsigned> printControl;
  printControl.first = -1;
  printControl.second = -1;

  for (unsigned it = 0; it < eqs.size(); it++) {
    pyred::intid id = eqs[it][0].first;

    auto iglback = pyred::Integral(id);
    auto property = iglback.properties(id);

    if (property.sector != printControl.first          // sector
        || property.topology != printControl.second) { // topology
      printControl.first = property.sector;            // sector
      printControl.second = property.topology;         // topology
      output.close();
      string name = outputDir + "/tmp/" + integralfamily.name + "/NUM" + "_" +
                    topologyNames[printControl.second] + "_" +
                    something_string(printControl.first);
      output.open(name.c_str());
    }
    output << "Eq"
           << "\n";
    output << eqs[it][0].first << "\n";
    output << eqs[it].size() << "\n";

    for (size_t it2 = 0; it2 < eqs[it].size(); it2++) {
      output << eqs[it].size() << " ";
      output << eqs[it][it2].second << " ";
      output << eqs[it][it2].first << " ";
      output << property.sector << " ";
      output << property.topology << " ";
      output << "0"
             << "\n"; // flag2
    }
  }

  output.close();
}

void Kira::write_triangularSW(
    unsigned sectorNumber, int k,
    std::unordered_map<pyred::intid, std::tuple<BaseIntegral***, int> >&
        forwardRed,
    std::vector<pyred::intid>& reduce_please, int flagy) {
  logger << "\nWrite the triangular system to " << outputDir
         << "/tmp/ on hard disk\n";
  logger << "(--> " << outputDir << "/tmp/" << integralfamily.name
         << "/VERconfig, ";
  logger << outputDir << "/tmp/" << integralfamily.name << "/VER###) \n";

  GZSTREAM_NAMESPACE::ogzstream output;
  ofstream outputX;

  tuple<string, string> dest;

  tuple<int, int, unsigned, int> printControl;
  get<0>(printControl) = -1;
  get<1>(printControl) = -1;
  get<2>(printControl) = sectorNumber;
  get<3>(printControl) = k;
  int rememberID = 0;

  for (auto it = reduce_please.begin(); it < reduce_please.end(); it++) {
    BaseIntegral*** fwEQ;
    unsigned lengthEq;
    auto mapContent = forwardRed.find(*it);

    if (mapContent != forwardRed.end()) {
      tie(fwEQ, lengthEq) = mapContent->second;

      if (lengthEq /*&& fwEQ[0][0][0].flag2 == 0*/) {
        print_equationSW(fwEQ[0][0], output, outputX, printControl, dest,
                         rememberID);
      }
    }
  }

  output.close();

  ifstream inputConfig;
  unsigned tempNumber = 0;
  inputConfig.open(
      (outputDir + "/tmp/" + integralfamily.name + "/VERconfig.tmp").c_str());

  inputConfig >> tempNumber;
  inputConfig.close();

  ofstream outputConfig;
  outputConfig.open(
      (outputDir + "/tmp/" + integralfamily.name + "/VERconfig.tmp").c_str());

  if (flagy == 1) tempNumber += rememberID;

  outputConfig << tempNumber << "\n";
  outputConfig.close();

  rename((outputDir + "/tmp/" + integralfamily.name + "/VER" + "_" +
          topologyNames[k] + "_" + to_string(sectorNumber) + ".tmp.gz")
             .c_str(),
         (outputDir + "/tmp/" + integralfamily.name + "/VER" + "_" +
          topologyNames[k] + "_" + to_string(sectorNumber) + ".gz")
             .c_str());

  remove((outputDir + "/tmp/" + integralfamily.name + "/SYSTEMx" + "_" +
          topologyNames[k] + "_" + to_string(sectorNumber))
             .c_str());
}

void Kira::write_triangular(
    /*unsigned sectorNumber, int k,*/ std::unordered_map<
        pyred::intid, std::tuple<BaseIntegral***, int> >& forwardRed,
    std::vector<pyred::intid>& reduce_please, int /*flagy*/) {
  logger << "\nWrite the triangular system to " << outputDir
         << "/tmp/ on hard disk\n";
  logger << "(--> " << outputDir << "/tmp/" << integralfamily.name
         << "/VERconfig, ";
  logger << outputDir << "/tmp/" << integralfamily.name << "/VER###) \n";

  GZSTREAM_NAMESPACE::ogzstream output;
  ofstream outputX;

  tuple<string, string> dest;

  tuple<int, int /*,unsigned,int*/> printControl;
  get<0>(printControl) = -1;
  get<1>(printControl) = -1;
  //   get<2>(printControl) = sectorNumber;
  //   get<3>(printControl) = k;
  int rememberID = 0;

  for (auto it = reduce_please.begin(); it < reduce_please.end(); it++) {
    BaseIntegral*** fwEQ;
    unsigned lengthEq;
    auto mapContent = forwardRed.find(*it);

    if (mapContent != forwardRed.end()) {
      tie(fwEQ, lengthEq) = mapContent->second;

      if (lengthEq /*&& fwEQ[0][0][0].flag2 == 0*/) {
        print_equation(fwEQ[0][0], output, outputX, printControl, dest);
        rememberID++;
      }
    }
  }
  output.close();

  ofstream outputConfig;
  outputConfig.open(
      (outputDir + "/tmp/" + integralfamily.name + "/VERconfig").c_str());
  outputConfig << rememberID << "\n";
  outputConfig.close();
}

template <typename T>
void Kira::read_integral2(
    T& input, int eqLength,
    std::unordered_map<pyred::intid, std::tuple<BaseIntegral***, int> >&
        forwardRed,
    std::unordered_map<pyred::intid, int>& rdy2F) {

  BaseIntegral* integral = new BaseIntegral[eqLength];

  for (int j = 0; j < eqLength; j++) {
    if (!(input >> integral[j])) break;

    integral[j].length = eqLength;

    auto findSkipMaster =
        find(masterVectorSkip.begin(), masterVectorSkip.end(), integral[j].id);

    if (findSkipMaster != masterVectorSkip.end()) {
      integral[j].coefficientString = "0";
    }
  }

  auto mapContent = forwardRed.find(integral[0].id);

  if (mapContent != forwardRed.end()) {
    if (get<1>(mapContent->second) >= RED) {
      BaseIntegral*** put2map = new BaseIntegral**[1];
      put2map[0] = new BaseIntegral*[get<1>(mapContent->second) + 1];

      for (int kIt = 0; kIt < get<1>(mapContent->second); kIt++) {
        put2map[0][kIt] = get<0>(mapContent->second)[0][kIt];
      }

      delete[] get<0>(mapContent->second)[0];

      get<0>(mapContent->second)[0] = put2map[0];
    }

    get<0>(mapContent->second)[0][get<1>(mapContent->second)] = integral;
    get<1>(mapContent->second)++;
  }
  else {
    BaseIntegral*** put2map = new BaseIntegral**[1];
    put2map[0] = new BaseIntegral*[RED];
    put2map[0][0] = integral;
    forwardRed.insert(pair<pyred::intid, tuple<BaseIntegral***, int> >(
        integral[0].id, make_tuple(put2map, 1)));
    rdy2F.insert(pair<pyred::intid, int>(integral[0].id, 0));
  }
}

void Kira::skip_integral(GZSTREAM_NAMESPACE::igzstream& input, int eqLength) {
  BaseIntegral* integral = new BaseIntegral[eqLength];

  for (int j = 0; j < eqLength; j++) {
    if (!(input >> integral[j])) break;
  }
  delete[] integral;
}

void Kira::trace_integral(GZSTREAM_NAMESPACE::igzstream& input, int eqLength) {
  BaseIntegral* integral = new BaseIntegral[eqLength];

  for (int j = 0; j < eqLength; j++) {
    if (!(input >> integral[j])) break;

    auto occContent = occurrence.find(integral[j].id);
    if (occContent != occurrence.end()) {
      (occContent->second)++;
    }
    else {
      occurrence.insert(pair<pyred::intid, unsigned>(integral[j].id, 1));
    }
  }
  delete[] integral;
}

void Kira::read_integral(BaseIntegral*& integral,
                         GZSTREAM_NAMESPACE::igzstream& input,
                         int eqLength) {
  integral = new BaseIntegral[eqLength];

  for (int j = 0; j < eqLength; j++) {
    if (!(input >> integral[j])) break;

    integral[j].length = eqLength;

    auto findSkipMaster =
        find(masterVectorSkip.begin(), masterVectorSkip.end(), integral[j].id);
    if (findSkipMaster != masterVectorSkip.end()) {
      integral[j].coefficientString = "0";
    }
  }
}

void Kira::record_masters(
    std::pair<std::vector<pyred::intid>, std::vector<pyred::intid> >& subsys) {
  ofstream output(
      (outputDir + "/results/" + integralfamily.name + "/masters").c_str());
  ofstream tmpoutput(
      (outputDir + "/tmp/" + integralfamily.name + "/masters").c_str());

  //   for (unsigned i=0; i<subsys.second.size(); i++){
  //
  //     auto mapContent = mastersReMap.find(subsys.second[i]);
  //
  //     if(mapContent != mastersReMap.end()){
  //       subsys.second[i]=mapContent->second;
  //     }
  //   }

  std::sort(subsys.second.begin(), subsys.second.end());
  subsys.second.resize(
      distance(subsys.second.begin(),
               unique(subsys.second.begin(), subsys.second.end())));

  logger << "Master integrals: (" << subsys.second.size() << ")\n";
  //   output << "Master integrals: (" << subsys.second.size() << ")\n";

  for (unsigned i = 0; i < subsys.second.size(); i++) {
    tuple<string, unsigned, unsigned> integral;

    get_properties(subsys.second[i], integral);

    logger << subsys.second[i] << ": ";
    logger << topologyNames[get<1>(integral)] << ": ";
    logger << get<0>(integral) << ": ";
    logger << get<2>(integral);
    logger << "\n";

    output << subsys.second[i] << ": ";
    output << topologyNames[get<1>(integral)] << ": ";
    output << get<0>(integral) << ": ";
    output << get<2>(integral);
    output << "\n";

    tmpoutput << subsys.second[i] << "\n";
  }
  output.close();
}

void Kira::complete_triangular(vector<pyred::intid>& mandatory) {
  logger << "\n***** Bring system in triangular form *********************\n";

  Clock clock;

  set<pyred::intid> setMandatory(mandatory.begin(), mandatory.end());
  std::unordered_map<pyred::intid, std::tuple<BaseIntegral***, int> >
      forwardRed;
  std::vector<pyred::intid> reduce_please;
  std::unordered_map<pyred::intid, int> rdy2F;

  for (unsigned k = 0; k < collectReductions.size(); k++) {
    for (int sectorNumber = 0; sectorNumber < (1 << integralfamily.jule);
         sectorNumber++) {

      load_triangular(k, sectorNumber, forwardRed, reduce_please,
                      rdy2F);
    }
  }

  for (auto toIt = forwardRed.begin(); toIt != forwardRed.end();
       toIt++) { // collect all keys to iterate

    if (get<1>(toIt->second) > 1) {
      reduce_please.push_back(get<0>(toIt->second)[0][0]->id);
    }
  }

  sort(reduce_please.begin(), reduce_please.end());

  tuple<int, int> printControl;
  get<0>(printControl) = -1;
  get<1>(printControl) = -1;
  ;
  run_reduction(forwardRed, reduce_please, rdy2F, setMandatory, printControl);

  write_triangular(/*sectorNumber, k,*/ forwardRed, reduce_please, 1);

  // Clean Up
  for (auto toIt = forwardRed.begin(); toIt != forwardRed.end(); toIt++) {
    if (get<1>(toIt->second) > 0) {
      delete[] get<0>(toIt->second)[0][0];
    }

    delete[] get<0>(toIt->second)[0];
    delete[] get<0>(toIt->second);
  }
  forwardRed.clear();
  rdy2F.clear();
  reduce_please.clear();

  logger << "\nTriangular form completed after ( " << clock.eval_time()
         << " s )\n";
}

void Kira::complete_triangularSW(vector<pyred::intid>& mandatory) {
  logger << "\n***** Bring system in triangular form *********************\n";

  Clock clock;

  for (int k = collectReductions.size() - 1; k >= 0; k--) {
    for (int sectorNumber = (1 << integralfamily.jule) - 1; sectorNumber >= 0;
         sectorNumber--) {
      std::unordered_map<pyred::intid, std::tuple<BaseIntegral***, int> >
          forwardRed;
      std::vector<pyred::intid> reduce_please;
      std::unordered_map<pyred::intid, int> rdy2F;

      if (file_exists((outputDir + "/tmp/" + integralfamily.name + "/VER" +
                       "_" + collectReductions[k] + "_" +
                       to_string(sectorNumber) + ".gz")
                          .c_str()))
        continue;

      if (!load_triangular(k, sectorNumber, forwardRed, reduce_please,
                           rdy2F))
        continue;

      logger << "Loaded topology: " << collectReductions[k]
             << " Loaded sector: " << sectorNumber << "\n";
      for (auto toIt = forwardRed.begin(); toIt != forwardRed.end();
           toIt++) { // collect all keys to iterate

        if (get<1>(toIt->second) > 1) {
          reduce_please.push_back(get<0>(toIt->second)[0][0]->id);
        }
      }

      sort(reduce_please.begin(), reduce_please.end());

      set<pyred::intid> setMandatory;
      string stringMandatory =
          outputDir + "/tmp/" + integralfamily.name + "/VERmandatory";
      if (file_exists((stringMandatory).c_str())) {
        ifstream inputMandatory(stringMandatory);
        while (1) {
          uint64_t tmpU;
          if (!(inputMandatory >> tmpU)) break;

          setMandatory.insert(tmpU);
        }
      }
      else {
        copy(mandatory.begin(), mandatory.end(),
             inserter(setMandatory, setMandatory.begin()));
      }
      //       stringMandatory =
      //       outputDir+"/tmp/"+integralfamily.name+"/VERmandatory";

      tuple<int, int> printControl;
      get<0>(printControl) = sectorNumber;
      get<1>(printControl) = k;

      run_reduction(forwardRed, reduce_please, rdy2F, setMandatory,
                    printControl);

      ofstream outputMandatory((stringMandatory + ".tmp"));
      for (auto itM : setMandatory) {
        outputMandatory << itM << endl;
      }
      rename((stringMandatory + ".tmp").c_str(), (stringMandatory).c_str());

      write_triangularSW(sectorNumber, k, forwardRed, reduce_please, 1);

      // Clean Up
      for (auto toIt = forwardRed.begin(); toIt != forwardRed.end();
           toIt++) { // collect all keys to iterate

        if (get<1>(toIt->second) > 0) {
          delete[] get<0>(toIt->second)[0][0];
        }

        delete[] get<0>(toIt->second)[0];
        delete[] get<0>(toIt->second);
      }
      forwardRed.clear();
      rdy2F.clear();
      reduce_please.clear();
    }
  }

  rename((outputDir + "/tmp/" + integralfamily.name + "/VERconfig.tmp").c_str(),
         (outputDir + "/tmp/" + integralfamily.name + "/VERconfig").c_str());

  logger << "\nTriangular form completed after ( " << clock.eval_time()
         << " s )\n";
}

int Kira::load_triangular(unsigned k, int sectorNumber,
    std::unordered_map<pyred::intid, std::tuple<BaseIntegral***, int> >&
        forwardRed,
    std::vector<pyred::intid>& /*reduce_please*/,
    std::unordered_map<pyred::intid, int>& rdy2F) {

  BaseIntegral* integral = new BaseIntegral[1];

  vector<string> add;
  add.push_back("");
  add.push_back("x");

  for (size_t ll = 0; ll < add.size(); ll++) {
    if (ll == 0) {
      string inputName = outputDir + "/tmp/" + integralfamily.name + "/SYSTEM" +
                  add[ll] + "_" + collectReductions[k] + "_" +
                  to_string(sectorNumber) + ".gz";

      if (file_exists(inputName.c_str())) {
        GZSTREAM_NAMESPACE::igzstream input;
        input.open(inputName.c_str());
        while (1) {
          int eqLength;
          pyred::intid ID;
          string line;
          if (!(input >> line)) break;
          if (!(input >> ID)) break;
          if (!(input >> eqLength)) break;

          read_integral2<GZSTREAM_NAMESPACE::igzstream>(input, eqLength,
                                                        forwardRed, rdy2F);
        }
        input.close();
      }

      int itF = 0;
      while(1){

        string inputExtraName = outputDir + "/tmp/" + integralfamily.name + "/SYSTEM" + add[ll] + "_" + collectReductions[k] + "_" +
                  to_string(sectorNumber)+ "_" + to_string(itF) + ".gz";

        if(file_exists(inputExtraName.c_str())){
          GZSTREAM_NAMESPACE::igzstream input;
          input.open(inputExtraName.c_str());
          while (1) {
            int eqLength;
            pyred::intid ID;
            string line;
            if (!(input >> line)) break;
            if (!(input >> ID)) break;
            if (!(input >> eqLength)) break;

            read_integral2<GZSTREAM_NAMESPACE::igzstream>(input, eqLength,
                                                          forwardRed, rdy2F);
          }
          input.close();
          itF++;
        }
        else
          break;
      }
    }
    else {
      string inputName = outputDir + "/tmp/" + integralfamily.name + "/SYSTEM" +
                  add[ll] + "_" + collectReductions[k] + "_" +
                  to_string(sectorNumber);
      if (file_exists(inputName.c_str())) {
        ifstream input;
        input.open(inputName.c_str());
        while (1) {
          int eqLength;
          pyred::intid ID;
          string line;
          if (!(input >> line)) break;
          if (!(input >> ID)) break;
          if (!(input >> eqLength)) break;

          read_integral2<ifstream>(input, eqLength, forwardRed, rdy2F);
        }
        input.close();
      }
    }
  }
  delete[] integral;

  if (forwardRed.size() == 0)
    return 0;
  else
    return 1;
}

void Kira::check_reduced_integrals(uint32_t sectorNumber, uint32_t k,
                                   DataBase databaseEQ[]) {

  string inputName = outputDir + "/tmp/" + integralfamily.name + "/VER" + "_" +
                     collectReductions[k] + "_" +
                     something_string(sectorNumber) + ".gz";

  int countF = 1;

  while (file_exists(inputName.c_str())) {

    int num_ones = 0;
    unsigned testSector = sectorNumber;

    for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {

      if ((testSector & 1) == 1){
        ++num_ones;
      }
    }

    GZSTREAM_NAMESPACE::igzstream input;

    input.open(inputName.c_str());

    while (1) {

      unsigned eqLength;
      pyred::intid ID;
      string line;

      if (!(input >> line)) break;
      if (!(input >> ID)) break;
      if (!(input >> eqLength)) break;

      if (conditionalSystem) {
        if (databaseEQ[0].bind_id_get_BSequation(
                ID, allEq[eqnum][0], masterVectorSkip, occurrence, 1)) {
          skip_integral(input, eqLength);
          delete[] allEq[eqnum][0];
        }
        else {
          trace_integral(input, eqLength);
        }
      }
      else {
        trace_integral(input, eqLength);
      }

      eqnum++;
    }
    inputName = outputDir + "/tmp/" + integralfamily.name + "/VER" + "_" +
                collectReductions[k] + "_" + something_string(sectorNumber) +
                "_" + to_string(countF++) + ".gz";
  }
}

void Kira::load_all_integrals(
    uint32_t sectorNumber, uint32_t k, DataBase databaseEQ[],
    std::vector<std::pair<uint32_t, uint32_t> >& setofS,
    uint32_t& reducedReihen, uint32_t& skipReihen) {
  string inputName = outputDir + "/tmp/" + integralfamily.name + "/VER" + "_" +
                     collectReductions[k] + "_" +
                     something_string(sectorNumber) + ".gz";

  int countF = 1;

  while (file_exists(inputName.c_str())) {
    int num_ones = 0;
    unsigned testSector = sectorNumber;

    for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {
      if ((testSector & 1) == 1) ++num_ones;
    }
    int it = 0;
    GZSTREAM_NAMESPACE::igzstream input;
    input.open(inputName.c_str());
    while (1) {
      unsigned eqLength;
      pyred::intid ID;
      string line;
      if (!(input >> line)) break;
      if (!(input >> ID)) break;
      if (!(input >> eqLength)) break;

      auto occContent = occurrence.find(ID);

      if (conditionalSystem) {
        if (databaseEQ[0].bind_id_get_BSequation(
                ID, allEq[eqnum][0], masterVectorSkip, occurrence, 0)) {
          // this integral is already in the database

          if (occContent != occurrence.end() && (occContent->second) < 2) {
            skip_integral(input, eqLength);
            skipReihen++;
            delete[] allEq[eqnum][0];
            continue;
          }

          skip_integral(input, eqLength);
          reducedReihen++;
          rdy2P[eqnum] = 6;
        }
        else {
          read_integral(allEq[eqnum][0], input, eqLength);
          rdy2P[eqnum] = 3;
        }
      }
      else {
        read_integral(allEq[eqnum][0], input, eqLength);
        rdy2P[eqnum] = 3;
      }

      last_reduce[eqnum] = ID;
      reverseLastReduce.insert(pair<pyred::intid, unsigned>(ID, eqnum));
      length[eqnum]++;

      if (num_ones < SEEDSIZE && !(it++)) {
        int flagy = 0;
        for (size_t itt = 0; itt < setofS.size(); itt++) {
          if ((setofS[itt].first /*&*/ == sectorNumber) /*== setofS[itt].first*/
              && setofS[itt].second == k) {
            flagy = 1;
            break;
          }
        }
        if (!flagy) {
          setofS.push_back(make_pair(sectorNumber, k));
          reduct2StartHere.push_back(eqnum);
        }
      }
      eqnum++;
    }
    input.close();
    inputName = outputDir + "/tmp/" + integralfamily.name + "/VER" + "_" +
                collectReductions[k] + "_" + something_string(sectorNumber) +
                "_" + to_string(countF++) + ".gz";
  }
}

int Kira::load_back_substitution(string& kiraSaveName) {

  logger << "Load all files from " << outputDir << "/tmp/\n";

  ifstream inputConfig(
      (outputDir + "/tmp/" + integralfamily.name + "/VERconfig").c_str());

  inputConfig >> reihen;
  totalReihen = reihen;

  if (reihen == 0) {
    logger << "The system you try to reduce contains no equations.\n";
    return 0;
  }

  DataBase* databaseEQ = new DataBase(outputDir + "/results/" + kiraSaveName + ".db");

  databaseEQ[0].prepare_lookup_id();

  reduct2StartHere.clear();
  occurrence.clear();
  reverseLastReduce.clear();

  uint32_t skipReihen = 0;
  uint32_t reducedReihen = 0;

  inputConfig.close();

  allEq = new BaseIntegral**[reihen + 1];
  last_reduce = new pyred::intid[reihen + 1];
  length = new unsigned[reihen + 1];
  rdy2P = new unsigned[reihen + 1];


  for (unsigned i = 0; i < reihen + 1; i++) {
    allEq[i] = new BaseIntegral*[1];
    length[i] = 0;
    rdy2P[i] = 0;
  }

  eqnum = 0;

  if (sectorOrdering == 2) {
    for (size_t k = 0; k < collectReductions.size(); k++) {
      for (int itBound = 0; itBound < integralfamily.jule + 1; itBound++) {
        for (size_t sectorNumber = 0;
             sectorNumber < static_cast<uint32_t>((1 << integralfamily.jule));
             sectorNumber++) {
          int num_ones = 0;
          unsigned testSector = sectorNumber;

          for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {
            if ((testSector & 1) == 1) ++num_ones;
          }

          if (num_ones == itBound)
            check_reduced_integrals(sectorNumber, k, databaseEQ);
        }
      }
    }

    eqnum = 0;
    vector<pair<unsigned, unsigned> > setofS;

    for (size_t k = 0; k < collectReductions.size(); k++) {
      for (int itBound = 0; itBound < integralfamily.jule + 1; itBound++) {
        for (size_t sectorNumber = 0;
             sectorNumber < static_cast<uint32_t>((1 << integralfamily.jule));
             sectorNumber++) {
          int num_ones = 0;
          unsigned testSector = sectorNumber;

          for (size_t i = 0; i < SEEDSIZE; ++i, testSector >>= 1) {
            if ((testSector & 1) == 1) ++num_ones;
          }
          if (num_ones == itBound)
            load_all_integrals(sectorNumber, k, databaseEQ, setofS,
                               reducedReihen, skipReihen);
        }
      }
    }
  }
  else {
    for (size_t k = 0; k < collectReductions.size(); k++) {

      for (size_t sectorNumber = 0;
           sectorNumber < static_cast<uint32_t>((1 << integralfamily.jule));
           sectorNumber++) {
        check_reduced_integrals(sectorNumber, k, databaseEQ);
      }
    }
    eqnum = 0;
    vector<pair<unsigned, unsigned> > setofS;

    for (size_t k = 0; k < collectReductions.size(); k++) {

      for (size_t sectorNumber = 0;
           sectorNumber < static_cast<uint32_t>((1 << integralfamily.jule));
           sectorNumber++) {

        load_all_integrals(sectorNumber, k, databaseEQ, setofS, reducedReihen,
                           skipReihen);

      }
    }
  }


  reihen = (reihen - skipReihen);
  logger << "Take " << reihen << " equations to reduce "
         << (reihen - reducedReihen);
  logger << " missing equations"
         << "\n";

  databaseEQ[0].finalize();
  delete databaseEQ;

  if (eqnum == 0) {
    clean_back_subs();
    logger << "The system is already reduced.\n";
    return 0;
  }

  return 1;
}

ConvertResult::ConvertResult(Kira& /*kira*/, string topologyName_,
                             int topologyNumber_, string& inputName_,
                             const string& inputDir_,
                             vector<pyred::intid>& idOfSeed) {
  topologyName = topologyName_;
  topologyNumber = topologyNumber_;
  inputDir = inputDir_;
  inputName = inputName_;

  if (!(file_exists(inputName.c_str()))) {
    logger << "\nMissing file with a list of integrals: " << inputName << "\n";
    exit(-1);
  }

  seedsInput.open(inputName.c_str());


  database = new DataBase(inputDir + "/results/kira.db");

  for (const auto &igl : pyred::TopoConfigData::import_integrals(inputName,topologyNumber)) {

    auto ID = igl.to_weight();

    if (Integral::is_zero(ID)) {
      zeroIntegrals.push_back(make_tuple(igl.m_powers,igl.m_topoid));
      continue;
    }
    idOfSeed.push_back(ID);
  }
}

ConvertResult::ConvertResult(Kira& /*kira*/, string topologyName_,
                             int topologyNumber_, const string& inputDir_,
                             std::vector<pyred::Integral>& listOfIntegrals,
                             vector<pyred::intid>& idOfSeed,
                             string& inputName_) {
  topologyName = topologyName_;
  topologyNumber = topologyNumber_;
  inputDir = inputDir_;
  inputName = inputName_;

  for (auto igl : listOfIntegrals) {
    pyred::intid ID = igl.to_weight();
    if (Integral::is_zero(ID)) {
      zeroIntegrals.push_back(make_tuple(igl.m_powers,igl.m_topoid));
      continue;
    }
    idOfSeed.push_back(ID);
  }

  database = new DataBase(inputDir + "/results/kira.db");
}

ConvertResult::~ConvertResult() { delete database; }

void ConvertResult::reconstruct_mass(Kira& kira,
                                     vector<DBintegral>& integralV) {
  for (size_t iterator = 0; iterator != integralV.size(); iterator++) {
    int massDimension =
        integralV[iterator].massDimension - integralV[0].massDimension;

    Perl2Kira perlKira(kira.invar, kira.massSet2One, kira.invarDim,
                       kira.massSet2OneDim);
    perlKira.pipe_kira();
    perlKira.put_pipe(integralV[iterator].coefficient);
    perlKira.close_pipe();
    perlKira.read_pipe(integralV[iterator].coefficient);
    stringstream ss;
    ss << "*" << kira.massSet2One << "^(" << massDimension * 2 << "/"
       << kira.massSet2OneDim << ")";
    string MD = ss.str();
    integralV[iterator].coefficient =
        "(" + integralV[iterator].coefficient + ")" + MD;
    kira.fermat[0].fermat_collect(
        const_cast<char*>(integralV[iterator].coefficient.c_str()));
    kira.fermat[0].fermat_calc();
    integralV[iterator].coefficient.assign(kira.fermat[0].g_baseout);
  }
}

void ConvertResult::prepare_FORM(vector<DBintegral>& integralV) {
  for (size_t iterator = 0; iterator != integralV.size(); iterator++) {
    Perl2Kira perlKira;
    perlKira.pipe_kira();
    perlKira.put_pipe(integralV[iterator].coefficient);
    perlKira.close_pipe();
    perlKira.read_pipe(integralV[iterator].coefficient);
  }
}

int ConvertResult::output(Kira& kira, int massReconstruction,
                          vector<pyred::intid>& idOfSeed, int choice) {
  kiraOutput outString(choice);
  string reducefile = inputDir + "/results/kira.db";

  if (!(file_exists(reducefile.c_str()))) {
    logger << "\nMissing file " << reducefile << ".\n";
    logger << "\nUnable to export results to " << outString.str[0] << "\n";
    return 0;
  }
  string name = "EQUATION";
  if (!database[0].checkTable(name)) {
    logger << "\nNo reductions found in " << reducefile << ".\n";
    logger << "\nUnable to export results to " << outString.str[0] << "\n";
    database[0].finalize();
    return 0;
  }

  string masterFileName = inputDir + "/results/" + topologyName + "/masters";
  ifstream input;

  vector<pyred::intid> masterVector;

  if (file_exists(masterFileName.c_str())) {
    input.open(masterFileName.c_str());
    string tmp;
    while (1) {
      pyred::intid ID;
      if (!(input >> ID)) break;
      if ((input >> tmp)) {
      };
      if ((input >> tmp)) {
      };
      if ((input >> tmp)) {
      };
      if ((input >> tmp)) {
      };
      masterVector.push_back(ID);
    }
    input.close();
  }

  string chars = "/";
  inputName.erase(remove_if(inputName.begin(), inputName.end(),
                            [&chars](const char& c) {
                              return chars.find(c) != string::npos;
                            }),
                  inputName.end());

  string mathematicafile = inputDir + "/results/" + topologyName + "/kira_" +
                           inputName + outString.str[1];
  Output.open(mathematicafile.c_str());

  Output << outString.str[2];

  for (unsigned int it = 0; it != zeroIntegrals.size(); it++) {

    Output << outString.str[3];
    if(!(kira.topologyNames[(get<1>(zeroIntegrals[it]))] == "Tuserweight" && choice == 2)){
      Output << kira.topologyNames[(get<1>(zeroIntegrals[it]))];
      Output << outString.str[5];
    }

    for (unsigned int iterator = 0; iterator < get<0>(zeroIntegrals[it]).size();
         iterator++) {
      Output << get<0>(zeroIntegrals[it])[iterator];

      if (iterator != get<0>(zeroIntegrals[it]).size() - 1)
        Output << ",";
    }
    if(kira.topologyNames[(get<1>(zeroIntegrals[it]))] == "Tuserweight" && choice == 2)
      Output << outString.str[12];
    else
      Output << outString.str[7];



    Output << outString.str[4] << outString.str[10];
    if (it != (zeroIntegrals.size() - 1))
      Output << outString.str[6];
  }

  database[0].prepare_lookup_id();

  int counter = 0;
  uint32_t unreduced = 0;
  for (size_t it = 0; it != idOfSeed.size(); it++) {
    vector<DBintegral> integralV;
    database[0].bind_id_get_equation(idOfSeed[it], integralV);

    if (integralV.size() > 0)
      counter++;

    if (counter == 1 && zeroIntegrals.size() > 0 && integralV.size() > 0)
      Output << outString.str[6];

    if (counter > 1 && integralV.size() > 0)
      Output << outString.str[6];

    if (massReconstruction)
      reconstruct_mass(kira, integralV);

    if (choice == 0)
      prepare_FORM(integralV);

    for (size_t iterator = 0; iterator != integralV.size(); iterator++) {
      if (iterator == 0){
        Output << outString.str[3];
        if(!(kira.topologyNames[integralV[iterator].topology] == "Tuserweight" && choice == 2)){
          Output << kira.topologyNames[integralV[iterator].topology]
               << outString.str[5];
        }
      }
      else{
        Output << outString.str[4];
        if(!(kira.topologyNames[integralV[iterator].topology] == "Tuserweight" && choice == 2)){
          Output << kira.topologyNames[integralV[iterator].topology]
                << outString.str[5];
        }
      }

      //       if(choice==2)
      // 	Output << integralV[iterator].id << ",";

      Output << integralV[iterator].indices;

      if (iterator == 0){
        if(!(kira.topologyNames[integralV[iterator].topology] == "Tuserweight" && choice == 2))
          Output << outString.str[7];
        else
          Output << outString.str[12];
      }
      else{
        if(!(kira.topologyNames[integralV[iterator].topology] == "Tuserweight" && choice == 2)){
          Output << outString.str[8];
        }
        else{
          Output << outString.str[13];

        }
        Output << integralV[iterator].coefficient << outString.str[9];
      }
    }

    if (integralV.size() == 1)
      Output << outString.str[10];

    if (integralV.size() == 0 && idOfSeed[it] != 0) {
      auto itM = find(masterVector.begin(), masterVector.end(), idOfSeed[it]);
      if (itM != masterVector.end()) {
        logger << "This integral is identified as a master integral: ";
        tuple<string, unsigned, unsigned> integral;
        get_properties(idOfSeed[it], integral);
        logger << (idOfSeed[it]) << ": ";
        logger << kira.topologyNames[get<1>(integral)] << ": ";
        logger << get<0>(integral) << ": ";
        logger << get<2>(integral);
        logger << "\n";
      }
      else {
        logger.set_level(2);
        logger << "This integral is is unreduced: ";
        tuple<string, unsigned, unsigned> integral;
        get_properties(idOfSeed[it], integral);
        logger << (idOfSeed[it]) << ": ";
        logger << kira.topologyNames[get<1>(integral)] << ": ";
        logger << get<0>(integral) << ": ";
        logger << get<2>(integral);
        logger << "\n";
        logger.set_level(1);
        unreduced++;
      }
    }

    if (integralV.size() == 0 && idOfSeed[it] == 0)
      logger << "One integral is zero.\n";
  }

  logger << "unreduced integrals: " << unreduced << ".\n";

  database[0].finalize();

  Output << outString.str[11] << "\n";
  logger << "\n";
  return 1;
}
