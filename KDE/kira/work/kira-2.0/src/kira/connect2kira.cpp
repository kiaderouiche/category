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

#ifdef __linux__
#include <signal.h>
#include <sys/prctl.h>
#endif

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <unistd.h>

#include <fstream>
#include <mutex>
#include <sstream>

#include "kira/connect2kira.h"
#include "kira/tools.h"

using namespace std;
using namespace GiNaC;

#define READEND 0
#define WRITEND 1

static Loginfo &logger = Loginfo::instance();

std::mutex mutexFermat;

void Connect2Kira::pipe_kira() {
  if (pipe(fdin) == -1) {
    logger << "pipe to fdin failed\n";
    exit(-1);
  }

  if (pipe(fdout) == -1) {
    logger << "pipe to fdout failed\n";
    exit(-1);
  }

  switch (g_childpid = fork()) {
    case -1:
      logger << "Error: could not fork.\n";
      logger << "Decrease DELTA_OUT in connect2kira.h or run Kira with less "
                "cores.\n";
      exit(EXIT_FAILURE);

    case 0: // child

#ifdef __linux__
      prctl(PR_SET_PDEATHSIG, SIGKILL);
#endif
      // close pipes not required by the child:
      close(fdin[READEND]);
      close(fdout[WRITEND]);
      // connect stdin and stdout with the pipe:
      dup2(fdout[READEND], 0);
      dup2(fdin[WRITEND], 1);
      close(2);
      open("/dev/null", O_WRONLY);

      execvp(argv[0], argv);
      logger << "Return not expected. Must be an execvp error.\n";
      logger << "The path to the executable is: " << argv[0] << "\n";
      exit(1);

    default: // parent
      // close pipes not required by the parent:
      close(fdin[WRITEND]);
      close(fdout[READEND]);
      if ((g_to = fdopen(fdout[WRITEND], "w")) == NULL) {
        kill(g_childpid, SIGKILL);
      }
      if ((g_from = fdopen(fdin[READEND], "r")) == NULL) {
        fclose(g_to);
        kill(g_childpid, SIGKILL);
      }
  }
}

void Connect2Kira::setup(vector<string> &argList) {
  argvLength = static_cast<unsigned>(argList.size()) + 1;

  argv = new char *[argvLength];

  for (size_t j = 0; j < argvLength - 1; j++) {
    argv[j] = new char[512];
    strcpy(argv[j], argList[j].c_str());
  }

  argv[argvLength - 1] = NULL;
}

void Connect2Kira::close_pipe() { fclose(g_to); }

Perl2Kira::Perl2Kira() {
  vector<string> argList;

  string perlPath = "perl";

  stringstream options;

  char token[2048];

  options << "-ne ";

  sprintf(token, "s/\\/\\(/*den(/g;");
  options << token;

  sprintf(token, "s/\\/(?![(])(.*)/*den($1)/g;");
  options << token;
  options << " print;\n";

  argList.push_back(perlPath);
  argList.push_back(options.str());

  setup(argList);
}

Perl2Kira::Perl2Kira(const vector<possymbol> &invar, ex massOne,
                     const vector<int> &invarDim, int Dim) {
  vector<string> argList;

  string perlPath = "perl";

  stringstream options;

  char token[2048];

  options << "-ne ";

  for (size_t i = 0; i < invar.size(); i++) {
    string strA, strB;
    strA = something_string(invar[i]);
    strB = something_string(massOne);
    if (strA == strB) continue;

    sprintf(token, "s/(?<![a-zA-Z0-9])%s(?![a-zA-Z0-9])/(%s\\/%s^(%i\\/%i))/g;",
            strA.c_str(), strA.c_str(), strB.c_str(), invarDim[i], Dim);
    options << token;
  }

  options << " print;\n";

  argList.push_back(perlPath);
  argList.push_back(options.str());

  setup(argList);
}

void Perl2Kira::put_pipe(string &input) {
  input += "\n";
  fputs(input.c_str(), g_to);
  putc('\n', g_to);
}

void Perl2Kira::read_pipe(string &receiveOutput) {
  char readBuffer[90];
  int status;
  receiveOutput.clear();

  while (1) {
    unsigned bytesRead = static_cast<unsigned>(
        fread(readBuffer, 1, sizeof(readBuffer) - 1, g_from));
    if (bytesRead <= 0) break;

    readBuffer[bytesRead] = '\0';
    receiveOutput += readBuffer;
  }
  fclose(g_from);
  wait(&status);
  receiveOutput.erase(receiveOutput.end() - 2, receiveOutput.end());
}

Fermat::~Fermat() { close_calc(1); }

void Fermat::start_fermat(string &fermatPath, char *pvars_) {
  vector<string> argList;
  argList.push_back(fermatPath);
  setup(argList);

  /*Allocate output buffer:*/
  g_baseout = new char[DELTA_OUT];
  if (g_baseout != NULL) {
    g_fullout = g_baseout;
    g_stopout = g_baseout + DELTA_OUT;
  }
  else {
    logger << "Interface to Fermat: Memory allocation error,"
           << " kill started program and exit:\n";
    kill(g_childpid, SIGKILL);
    waitpid(g_childpid, &status, WNOHANG);
    exit(-1);
  }

  pvars = pvars_;

  pipe_kira();

  if (g_childpid == 0) exit(-1);
  /*Fermat is running*/

  /*Switch off floating point representation:*/
  fputs("&d\n0\n", g_to);
  fflush(g_to);
  read_up((char *)"0", 1);

  if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
    logger
        << "Interface to Fermat: Switch off floating point representation.\n";
    exit(-1);
  }

  /*Switch off poly_divide:*/
  fputs("&(_t=0)\n", g_to);
  fflush(g_to);
  read_up((char *)"0", 1);
  if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
    logger << "Interface to Fermat: Switch off poly_divide failed.\n";
    exit(-1);
  }
  /*Set prompt as '\n':*/
  fputs("&(M=' ')\n", g_to);
  fflush(g_to);
  read_up((char *)"> Prompt", 8);
  read_up((char *)"Elapsed", 7);
  if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
    logger << "Interface to Fermat: Set promt as \'\\n\' failed.\n";
    exit(-1);
  }

  /*Switch off timing:*/
  fputs("&(t=0)\n", g_to);
  fflush(g_to);
  read_up((char *)"0", 1);
  if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
    logger << "Interface to Fermat: Switch off timing failed.\n";
    exit(-1);
  }

  /*Switch on "ugly" printing: no spaces in long integers;
    do not omit '*' for multiplication:*/
  fputs("&U\n", g_to);
  fflush(g_to);
  read_up((char *)"0", 1);
  if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
    logger << "Interface to Fermat: Switch off ugly printing failed.\n";
    exit(-1);
  }

  /*Switch off suppression of output g_to terminal of long polys.:*/
  fputs("&(_s=0)\n", g_to);
  fflush(g_to);
  read_up((char *)"0", 1);
  if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
    logger << "Interface to Fermat: Switch off suppression of \n"
           << "output g_to terminal of long polys failed.";
    exit(-1);
  }

  /*Change monomial multiply system (Thanks to Fabian Lange and Robert H. Lewis
   * for pointing out this feature):*/
  fputs("&(_o=12)\n", g_to);
  fflush(g_to);
  read_up((char *)"0", 1);
  if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
    logger
        << "Interface to Fermat: Chnage of monomial multiply system failed.\n";
    exit(-1);
  }

  /*Set polymomial variables:*/
  /*pvars looks like "a\nb\nc\n\n":*/
  char *ch;
  while (*pvars > '\n') {
    /*Copy the variable up g_to '\n' into g_fbuf:*/
    /* Modification by A.Smirnov: for compatibility with Mathematica*/
    for (*(ch = g_fbuf) = '\0';
         ((*ch = *pvars) > '\n' && (*ch = *pvars) != ','); ch++, pvars++)
      if (ch - g_fbuf >= FROMFERMATBUFSIZE) {
        logger << "Interface to Fermat:  FROMFERMATBUFSIZE to small \n";
        exit(-1);
      }
    *ch = '\0';
    if (*pvars != '\0') pvars++;
    /*Set g_fbuf as a polymomial variable:*/

    if (isupper(*g_fbuf)) {
      logger << "Interface to Fermat:  Fermat does not like capital Letters in"
             << " the variable names, please rename: " << g_fbuf << ".\n";
      exit(-1);
    }

    fprintf(g_to, "&(J=%s)\n", g_fbuf);

    fflush(g_to);
    read_up((char *)"0", 1);

    if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
      logger << "Interface to Fermat: set variable failed\n";
      exit(-1);
    }
  } /*while( *pvars > '\n')*/
}

void Fermat::unset_variable(char *pvars_) {
  char *var = pvars_;

  /*Set polymomial variables:*/
  /*var looks like "a\nb\nc\n\n":*/
  char *ch;
  while (*var > '\n') {
    /*Copy the variable up g_to '\n' into g_fbuf:*/
    /* Modification by A.Smirnov: for compatibility with Mathematica*/
    for (*(ch = g_fbuf) = '\0'; ((*ch = *var) > '\n' && (*ch = *var) != ',');
         ch++, var++)
      if (ch - g_fbuf >= FROMFERMATBUFSIZE) {
        logger << "Interface to Fermat:  FROMFERMATBUFSIZE to small \n";
        exit(-1);
      }
    *ch = '\0';
    if (*var != '\0') var++;
    /*Set g_fbuf as a polymomial variable:*/

    if (isupper(*g_fbuf)) {
      logger << "Interface to Fermat:  Fermat does not like capital Letters in"
             << " the variable names, please rename: " << g_fbuf << ".\n";
      exit(-1);
    }

    fprintf(g_to, "&(J=-%s)\n", g_fbuf);
    //     fermat_calc();
    //     fermat_calc();
    fflush(g_to);
    read_up((char *)"0", 1);

    if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
      logger << "Interface to Fermat: unset variable failed\n";
      exit(-1);
    }
  } /*while( *var > '\n')*/
}

void Fermat::set_variable(char *pvars_) {
  char *var = pvars_;

  /*Set polymomial variables:*/
  /*var looks like "a\nb\nc\n\n":*/
  char *ch;
  while (*var > '\n') {
    /*Copy the variable up g_to '\n' into g_fbuf:*/
    /* Modification by A.Smirnov: for compatibility with Mathematica*/
    for (*(ch = g_fbuf) = '\0'; ((*ch = *var) > '\n' && (*ch = *var) != ',');
         ch++, var++)
      if (ch - g_fbuf >= FROMFERMATBUFSIZE) {
        logger << "Interface to Fermat:  FROMFERMATBUFSIZE to small \n";
        exit(-1);
      }
    *ch = '\0';
    if (*var != '\0') var++;
    /*Set g_fbuf as a polymomial variable:*/

    if (isupper(*g_fbuf)) {
      logger << "Interface to Fermat:  Fermat does not like capital Letters in"
             << " the variable names, please rename: " << g_fbuf << ".\n";
      exit(-1);
    }

    fprintf(g_to, "&(J=%s)\n", g_fbuf);

    fflush(g_to);
    read_up((char *)"0", 1);

    if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
      logger << "Interface to Fermat: set variable failed\n";
      exit(-1);
    }
  } /*while( *var > '\n')*/
}

void Fermat::set_numeric(char *pvars_, int numeric) {
  char *var = pvars_;

  /*Set polymomial variables:*/
  /*var looks like "a\nb\nc\n\n":*/
  char *ch;
  while (*var > '\n') {
    /*Copy the variable up g_to '\n' into g_fbuf:*/
    /* Modification by A.Smirnov: for compatibility with Mathematica*/
    for (*(ch = g_fbuf) = '\0'; ((*ch = *var) > '\n' && (*ch = *var) != ',');
         ch++, var++)
      if (ch - g_fbuf >= FROMFERMATBUFSIZE) {
        logger << "Interface to Fermat:  FROMFERMATBUFSIZE to small \n";
        exit(-1);
      }
    *ch = '\0';
    if (*var != '\0') var++;
    /*Set g_fbuf as a polymomial variable:*/

    if (isupper(*g_fbuf)) {
      logger << "Interface to Fermat:  Fermat does not like capital Letters in"
             << " the variable names, please rename: " << g_fbuf << ".\n";
      exit(-1);
    }

    fprintf(g_to, "%s:=%i\n", g_fbuf, numeric);

    fflush(g_to);
    read_up((char *)const_cast<char *>(int_string(numeric).c_str()),
            int_string(numeric).size());

    if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
      logger << "Interface to Fermat: set numeric failed\n";
      exit(-1);
    }
  } /*while( *var > '\n')*/
}

void Fermat::set_numeric2(char *pvars_, std::string &numeric) {
  char *var = pvars_;

  /*Set polymomial variables:*/
  /*var looks like "a\nb\nc\n\n":*/
  char *ch;
  while (*var > '\n') {
    /*Copy the variable up g_to '\n' into g_fbuf:*/
    /* Modification by A.Smirnov: for compatibility with Mathematica*/
    for (*(ch = g_fbuf) = '\0'; ((*ch = *var) > '\n' && (*ch = *var) != ',');
         ch++, var++)
      if (ch - g_fbuf >= FROMFERMATBUFSIZE) {
        logger << "Interface to Fermat:  FROMFERMATBUFSIZE to small \n";
        exit(-1);
      }
    *ch = '\0';
    if (*var != '\0') var++;
    /*Set g_fbuf as a polymomial variable:*/

    if (isupper(*g_fbuf)) {
      logger << "Interface to Fermat:  Fermat does not like capital Letters in"
             << " the variable names, please rename: " << g_fbuf << ".\n";
      exit(-1);
    }

    fprintf(g_to, "%s:=%s\n", g_fbuf, numeric.c_str());

    fflush(g_to);
    read_up((char *)const_cast<char *>(int_string(numeric).c_str()),
            int_string(numeric).size());

    if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
      logger << "Interface to Fermat: set numeric failed\n";
      exit(-1);
    }
  } /*while( *var > '\n')*/
}

void Fermat::unset_numeric(char *pvars_) {
  char *var = pvars_;

  /*Set polymomial variables:*/
  /*var looks like "a\nb\nc\n\n":*/
  char *ch;
  while (*var > '\n') {
    /*Copy the variable up g_to '\n' into g_fbuf:*/
    /* Modification by A.Smirnov: for compatibility with Mathematica*/
    for (*(ch = g_fbuf) = '\0'; ((*ch = *var) > '\n' && (*ch = *var) != ',');
         ch++, var++)
      if (ch - g_fbuf >= FROMFERMATBUFSIZE) {
        logger << "Interface to Fermat:  FROMFERMATBUFSIZE to small \n";
        exit(-1);
      }
    *ch = '\0';
    if (*var != '\0') var++;
    /*Set g_fbuf as a polymomial variable:*/

    if (isupper(*g_fbuf)) {
      logger << "Interface to Fermat:  Fermat does not like capital Letters in"
             << " the variable names, please rename: " << g_fbuf << ".\n";
      exit(-1);
    }

    fprintf(g_to, "@(%s)\n", g_fbuf);

    fflush(g_to);
    read_up((char *)"0", 1);

    if (fgets(g_fbuf, FROMFERMATBUFSIZE, g_from) == NULL) {
      logger << "Interface to Fermat: unset numeric failed\n";
      exit(-1);
    }
  } /*while( *var > '\n')*/
}

/*This function places one char to the output buffer with possible
  expansion of the buffer:*/
void Fermat::add_to_out(char ch) {
  if (g_fullout >= g_stopout) {
    unsigned l = g_stopout - g_baseout + DELTA_OUT;
    char *ptr = new char[l];
    memcpy(ptr, g_baseout, g_stopout - g_baseout);

    if (ptr == NULL) {
      logger
          << "Interface to Fermat: Memory allocation failed. Exit Program \n";
      exit(2);
    }
    g_fullout = ptr + (g_fullout - g_baseout);
    g_stopout = ptr + l;
    delete[] g_baseout;
    g_baseout = ptr;
  } /*if (g_fullout >= g_stopout)*/
  *g_fullout++ = ch;

} /*addtoout*/

/*reads the stream 'from' up to the line 'terminator' (only 'thesize' first
  characters are compared):*/
void Fermat::read_up(char *terminator, int thesize) {
  char *c;
  for (;;) {
    do {
      for (c = fgets(g_fbuf, FROMFERMATBUFSIZE, g_from); *c <= ' '; c++)
        if (*c == '\0') break;
    } while (*c <= ' ');
    if (strncmp(terminator, c, thesize) == 0) return;
  }
} /*read_up*/

void Fermat::fermat_collect(char *buf1) { fputs(buf1, g_to); }

int Fermat::fermat_calc(int optional) {
  char *c;

  putc('\n', g_to); /*stroke the line*/
  fflush(g_to);     /*Now Fermat starts to work*/

  do {
    c = fgets(g_fbuf, FROMFERMATBUFSIZE, g_from);
    for (; *c <= ' '; c++) {
      if (*c == '\0') break;
    }
  } while ((*c <= ' '));

  int success = 1;
  stringstream error1;
  stringstream error2;
  if (*c == '*') {
    std::unique_lock<std::mutex> lckCritical(mutexFermat, std::defer_lock);
    // critical section mutexFermat
    lckCritical.lock();

    error1 << "Interface to Fermat:  Fermat error: \n";
    do {
      /*ignore '`' and spaces:*/
      for (; *c != '\n'; c++)
        switch (*c) {
          default:
            error2 << *c;
        } /*for(;*c!='\n';c++)switch(*c)*/
    } while (*(c = fgets(g_fbuf, FROMFERMATBUFSIZE, g_from)) != '\n');

    if (error2.str().substr(0, 46) ==
        "*** Inappropriate symbol: / can't divide by 0.") {
      success = 2;
    }
    else {
      success = 0;
    }
    lckCritical.unlock();
  }

  if (success == 1) {
    /*initialize the output buffer:*/
    g_fullout = g_baseout;

    if (c != NULL) {
      do {
        /*ignore '`' and spaces:*/
        for (; *c != '\n'; c++)
          switch (*c) {
            case ' ':
            case '`':
              continue;
            default:
              add_to_out(*c);
          } /*for(;*c!='\n';c++)switch(*c)*/
      } while (*(c = fgets(g_fbuf, FROMFERMATBUFSIZE, g_from)) != '\n');
      /*the empty line is the Fermat prompt*/
    }

    add_to_out('\0'); /*Complete the line*/

    return 1;
  }
  if (success == 0) {
    logger << error1.str() << error2.str() << "\n";
    exit(-1);
  }
  if (success == 2 && optional == 1) {
    //     c = fgets(g_fbuf,FROMFERMATBUFSIZE,g_from);
    //     do{
    //       for(;*c!='\n';c++);
    //     } while( *(c=fgets(g_fbuf,FROMFERMATBUFSIZE,g_from))!='\n' );
    c = fgets(g_fbuf, FROMFERMATBUFSIZE, g_from);
    do {
      /*ignore '`' and spaces:*/
      for (; *c != '\n'; c++)
        switch (*c) {
          case ' ':
          case '`':
            continue;
          default:
            error2 << *c;
        } /*for(;*c!='\n';c++)switch(*c)*/
    } while (*(c = fgets(g_fbuf, FROMFERMATBUFSIZE, g_from)) != '\n');

    //     logger << error1.str()<< error2.str() << "\n";
    fputs("123456789101112131415", g_to);
    putc('\n', g_to);
    fflush(g_to);
    read_up((char *)"123456789101112131415", 21);

    return 0;
  }
  else {
    logger << error1.str() << error2.str();
    exit(-1);
  }
}

/*mustCleanup == 0 -- no allocated memory free:*/
void Fermat::close_calc(int mustCleanup) {
  /*Stop Fermat:*/
  fputs("&q\n", g_to);
  fflush(g_to);
  fclose(g_to);
  fclose(g_from);
  kill(g_childpid, SIGKILL);

  waitpid(g_childpid, &status, WNOHANG);
  logger << "closeCalc: " << g_childpid << "\n";

  if (mustCleanup) {
    delete[] g_baseout;
    g_baseout = NULL, g_fullout = NULL, g_stopout = NULL;
  }

} /*closeCalc*/
