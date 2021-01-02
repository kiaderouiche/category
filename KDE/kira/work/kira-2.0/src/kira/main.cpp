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

#include <getopt.h>

#include "pyred/config.h" // for KIRAFIREFLY
#include "pyred/defs.h"
#include "kira/kira.h"
#include "kira/tools.h"

#ifdef KIRAFIREFLY
#include "firefly/config.hpp" // for WITH_MPI
#ifdef WITH_MPI
#include <mpi.h>
#include "firefly/MPIWorker.hpp"
#include "kira/mpi_work.h"
#endif
#endif


using namespace std;

static Loginfo& logger = Loginfo::instance();

class ParseOptions {
public:
  ParseOptions(int argc, char* argv[]) {
    silent_flag = 0;
    pyred_config = "";
    parallel = 1;
    integralOrdering = 9;
    int c;

    static struct option long_options[] = {
        {"help", no_argument, 0, 'h'},
        {"version", no_argument, 0, 'v'},
        {"silent", no_argument, &silent_flag, 1},
        {"set_value", required_argument, 0, 's'},
        {"set_sector", required_argument, 0, 'S'},
        {"trim", required_argument, 0, 't'},
        {"parallel", required_argument, 0, 'p'},
        {"integral_ordering", required_argument, 0, 'i'},
        {"pyred_config", required_argument, 0, 'c'},
#ifdef KIRAFIREFLY
        {"bunch_size", required_argument, 0, 'b'},
#endif
        {0, 0, 0, 0} // mark end of array
    };

    while (1) {
      {
        int option_index = 0;
        std::string tmpOptarg;
// 	opterr = 0;
#ifndef KIRAFIREFLY
        c = getopt_long_only(argc, argv, "hva:p:i:c:s:t:S:", long_options,
                             &option_index);
#else
        c = getopt_long_only(argc, argv, "hva:p:i:c:s:t:S:b:", long_options,
                             &option_index);
#endif

        /* Detect the end of the options. */
        if (c == -1) break;

        switch (c) {
          case 0:
            /* If this option set a flag, do nothing else now. */
            if (long_options[option_index].flag != 0) break;
            printf("option %s", long_options[option_index].name);
            if (optarg) printf(" with arg %s", optarg);
            printf("\n");
            break;
          case 'h':
            PrintUsage();
            exit(0);
          case 'v':
            logger << "Kira version: " << VERSION << "\n";
            exit(0);
          case 'p':
            parallel = atoi(optarg);
            if (0 < parallel)
              logger << "Kira will start " << parallel
                     << " different Fermat jobs in parallel."
                     << "\n";
            else {
              logger << "The option parallel is invalid."
                     << "\n";
              exit(-1);
            }
            break;
          case 'i':
            integralOrdering = atoi(optarg);
            if (1 > integralOrdering || integralOrdering > 8) {
              logger << "The option integral_ordering is invalid."
                     << "\n";
              exit(-1);
            }
            break;
          case 's':
            set_variables.push_back(optarg);
            logger <<"Set the symbol: " << optarg << "\n";
            break;
          case 'S':
            set_sector = optarg;
            logger <<"Force Kira to do the reduction of sector: " << optarg << "\n";
            break;
          case 't':
            trim.push_back(optarg);
            break;
          case 'c':
            pyred_config += optarg;
            break;
#ifdef KIRAFIREFLY
          case 'b':
            bunch_size = atoi(optarg);

            if (bunch_size > 0) {
              logger << "FireFly will use " << bunch_size
                     << " as maximum bunch size.\n";
            }
            else if((bunch_size & (bunch_size - 1)) != 0){
              logger << "The option bunch size accepts only numbers in power of 2\n";
            }
            else {
              logger << "The option bunch_size is invalid."
                     << "\n";
              exit(-1);
            }
            break;
#endif
          case '?':
          default:
            PrintUsage();
            abort();
        }
      }
    }

    /* Print any remaining command line arguments (not options). */
    if (optind != (argc - 1)) {
      logger << "\n"
             << "\n";
      logger << "Unexpected number of command line arguments,\n";
      logger << "expecting the name of the job file + options.\n";
      PrintUsage();
      logger << "Quit program.\n";
      logger << "\n"
             << "\n";
      exit(-1);
    }

#if defined(KIRAFIREFLY) && defined(WITH_MPI)
    int process;
    MPI_Comm_rank(MPI_COMM_WORLD, &process);

    if (0 == file_exists(argv[optind]) && process == firefly::master) {
#else
    if (0 == file_exists(argv[optind])) {
#endif
      logger << "\n"
             << "\n";
      logger << "Can not find job file: " << job_name << "\n";
      logger << "Quit program.\n";
      logger << "\n"
             << "\n";
      exit(-1);
    }

    job_name = argv[optind];

    if (silent_flag) {
      logger.silent_cout_buf();
    }
  }

  ~ParseOptions() {
    if (silent_flag) {
      logger.restore_silence(); // restore the original stream buffer
    }
  }

  int getCores() { return (parallel); }

  int get_integral_ordering() { return (integralOrdering); }

  std::string getPyred() { return (pyred_config); }

  string getJobname() { return (job_name); }

#ifdef KIRAFIREFLY
  uint32_t get_bunch_size() { return static_cast<uint32_t>(bunch_size); }
#endif

  vector<string> get_set_variables() { return (set_variables); }

  string get_set_sector() { return (set_sector); }

  vector<string> get_trim() { return (trim); }

  int get_silent() {return silent_flag;}

  void PrintUsage() {
    logger << "\n";
    logger << "Usage:\n";
    logger << "  kira FILE        Run the job specified in the job file FILE."
              "\n";
    logger << "                   The project directory is set"
              " to the working directory.\n";
    logger << " Options:\n";
    logger << "   --version       Print the Kira version and exit.\n";
    logger << "   --help          Print this help and exit.\n";
    logger << "   --silent        Switch to silent mode.\n";
    logger << "   --parallel=n    Run n instances of Fermat rsp. FireFly "
              "black-box evaluators in parallel.\n";
#ifdef KIRAFIREFLY
    logger << "   --bunch_size=n  Set FireFly's maximum bunch size to n.\n";
#endif
    logger << "   --integral_ordering=n    Use the n-th integral ordering "
              " (possible values: 1,...,8).\n";
    logger << "   --set_value=\"var=val\"    Set the value of the symbol "
              "\"var\" to \"val\".\n";
    logger << "   --set_sector=n           Perform only the reduction of "
              "sector n.\n";
    logger << "\n";
  }

private:
  int silent_flag;
  vector<string> set_variables;
  string set_sector;
  vector<string> trim;
  //   , algebra_flag;
  string job_name;
  ofstream fout;
  int parallel;
  int integralOrdering;
  std::string pyred_config;
#ifdef KIRAFIREFLY
  int bunch_size = 1;
#endif
  //   std::string algebra_config;
  ParseOptions(){};
};

int main(int argc, char* argv[]) {
#if defined(KIRAFIREFLY) && defined(WITH_MPI)
  // Initialization of MPI processes
  // ---------------------------------------------------------------------------
  int provided;
  MPI_Init_thread(NULL, NULL, MPI_THREAD_SERIALIZED, &provided);

  int process;
  MPI_Comm_rank(MPI_COMM_WORLD, &process);
  // ---------------------------------------------------------------------------

  if (process == firefly::master) {
#endif
    Clock clock;

    logger.set_logfile("kira.log");

    ParseOptions parseoptions(argc, argv);

#ifndef KIRAFIREFLY
    Kira kira(parseoptions.getJobname(),
              parseoptions.getCores() /*,parseoptions.getAlgebra()*/,
              parseoptions.getPyred(), parseoptions.get_integral_ordering(),
              parseoptions.get_set_variables(), parseoptions.get_trim(),
              parseoptions.get_set_sector());
#else
  Kira kira(parseoptions.getJobname(),
            parseoptions.getCores() /*,parseoptions.getAlgebra()*/,
            parseoptions.getPyred(), parseoptions.get_integral_ordering(),
            parseoptions.get_set_variables(), parseoptions.get_trim(),
            parseoptions.get_set_sector(), parseoptions.get_bunch_size(),
            parseoptions.get_silent());
#endif
    kira.read_config();
    kira.execute_jobs();

#if defined(KIRAFIREFLY) && defined(WITH_MPI)
    bool cont = false;
    MPI_Bcast(&cont, 1, MPI_CXX_BOOL, firefly::master, MPI_COMM_WORLD);
#endif

    logger << "Total time:\n( " << clock.eval_time() << " s )\n";
#if defined(KIRAFIREFLY) && defined(WITH_MPI)
  }
  else {
    ParseOptions parseoptions(argc, argv);
    mpi_work(static_cast<uint32_t>(parseoptions.getCores()),
             parseoptions.get_bunch_size());
  }

  MPI_Finalize();
#endif
  return 0;
}
