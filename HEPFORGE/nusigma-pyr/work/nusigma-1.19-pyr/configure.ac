#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT(WimpSim,,edsjo@fysik.su.se)
AC_CONFIG_SRCDIR([src/nuNevent.f])
#AC_CONFIG_HEADERS([config.h])

# Checks for programs.
AC_PROG_CC
AC_PROG_MAKE_SET
AC_PROG_RANLIB

# F77 compiler
FCSET=false
if test "${FCFLAGS+set}" = set; then
   FCSET=true
fi

AC_PROG_FC([ifort gfortran])
if test "${FCSET}" = "false" ; then
  if test "${FC}" = "ifort"; then 
    echo "Fortran compiler is $FC"
    FCFLAGS=${FCFLAGS+-O -extend_source -openmp}
  fi 
  if test "${FC}" = "gfortran"; then
    echo "Fortran compiler is $FC"
    FCFLAGS=${FCFLAGS+-O -ffixed-line-length-none -fopenmp}
  fi
fi

# C compiler
CSET=false
if test "${CFLAGS+set}" = set; then
   CSET=true
fi

AC_PROG_CC([icc gcc])
AC_PROG_CXX([icc g++])
if test "${CSET}" = "false" ; then
  if test "${CC}" = "icc"; then 
    echo "C compiler is $CC"
    CFLAGS=${CFLAGS+-O}
  fi 
  if test "${CC}" = "gcc"; then
    echo "C compiler is $CC"
    CFLAGS=${CFLAGS+-O}
  fi
fi

AC_PROG_F77([ifort gfortran])
F77=${FC}
FFLAGS=${FCFLAGS}
FOPT=${FCFLAGS}

# nusigma version
AC_ARG_VAR(WSVERSION,[String containing the nusigma version])
NSVERSION="${PWD}"

# svn revision
AC_ARG_VAR(WSREV,[String containing nusigma svn revision])
AC_CHECK_PROGS([SVN],[svn],[:])
if test "$SVN" = :; then
NSREV=""
else
NSREV=" rev ("`svn info | grep Revision | sed "s/Revision: //"`")"
fi

# Checks for libraries.
AC_CHECK_LIB([ds_core], [dsinit])
AC_CHECK_LIB([ds_generic_wimp], [dsinit_module])

AC_CHECK_HEADERS([stdlib.h string.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_CHECK_FUNCS([floor memmove])

# Required code
AC_ARG_VAR(DARKSUSY_DIR,[Directory where DarkSUSY is])
DARKSUSY_DIR=${DARKSUSY_DIR-../../../../DarkSUSY/library_6plus/trunk}
AC_ARG_VAR(PYTHIA,[Path to where Pythia 6 is])
PYTHIA=${PYTHIA-../../../pythia/pythia-6.4.26.o}

AC_CONFIG_FILES([makefile
                 src/makefile
                 mains/makefile])
AC_OUTPUT

