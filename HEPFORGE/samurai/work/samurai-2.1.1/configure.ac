AC_INIT([Samurai], [2.1.1], [reiterth@mpp.mpg.de], [samurai],
	[https://samurai.web.cern.ch/samurai/])
AC_PREREQ([2.59])

dnl -----------------------------------------------
dnl Package name and version number (user defined)
dnl -----------------------------------------------

GENERIC_LIBRARY_NAME=samurai
GENERIC_PACKAGE_NAME=samurai

#release versioning
GENERIC_MAJOR_VERSION=2
GENERIC_MINOR_VERSION=1
GENERIC_MICRO_VERSION=1

#API version (often = GENERIC_MAJOR_VERSION.GENERIC_MINOR_VERSION)
GENERIC_API_VERSION=$GENERIC_MAJOR_VERSION.$GENERIC_MINOR_VERSION
AC_SUBST(GENERIC_API_VERSION)

#shared library versioning
GENERIC_LIBRARY_VERSION=2:1:1
#                       | | |
#                +------+ | +---+
#                |        |     |
#             current:revision:age
#                |        |     |
#                |        |     +- increment if interfaces have been added
#                |        |        set to zero if interfaces have been removed
#                                  or changed
#                |        +- increment if source code has changed
#                |           set to zero if current is incremented
#                +- increment if interfaces have been added, removed or changed

dnl --------------------------------
dnl Package name and version number
dnl --------------------------------

AC_SUBST(GENERIC_LIBRARY_VERSION)

PACKAGE=$GENERIC_PACKAGE_NAME
AC_SUBST(GENERIC_LIBRARY_NAME)

GENERIC_VERSION=$GENERIC_MAJOR_VERSION.$GENERIC_MINOR_VERSION.$GENERIC_MICRO_VERSION
AC_SUBST(GENERIC_VERSION)

VERSION=$GENERIC_VERSION

AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([config.aux])

AM_INIT_AUTOMAKE($PACKAGE, $VERSION, no-define, no-dependencies)

dnl -----------------------------------------------
dnl Checks for programs.
dnl -----------------------------------------------

AC_LANG_PUSH([Fortran])
AC_PROG_F77([gfortran ifort g77 f77 xlf frt pgf77 fort77 fl32 af77])
AC_PROG_FC([gfortran ifort g77 f77 xlf frt pgf77 fort77 fl32 af77])

dnl When configuring for `make dist' purposes, skip checks that may yield fatal
dnl errors when there is no working F90 compiler.
if test -z "$with_dist"; then
   dnl Check the flags needed to link fc programs with ld (i.e. cc)
   AC_FC_LIBRARY_LDFLAGS
   dnl Check for underscoring of external names
   AC_FC_WRAPPERS
   dnl We need to use .f90 and not .f to enable Automake FC support
   dnl Some Intel ifc/ifort do not understand .f95.  :-/
   AC_FC_SRCEXT([f90])
   AC_FC_FREEFORM
fi
AC_LANG_POP

AM_PROG_LIBTOOL
LT_INIT

AM_SANITY_CHECK

AC_PATH_PROG(PERL,perl,perl)

dnl -----------------------------------------------
dnl link AvH's OneLOop
dnl -----------------------------------------------
AC_ARG_WITH([avh_olo],
  [AS_HELP_STRING([--without-avh_olo],
  [disable integrals from OneLOop])],
  [],
  [with_avh_olo=auto])
            
LIBAVHOLO=
AS_IF([test "x$with_avh_olo" == xauto],
  [AC_SUBST([LIBAVHOLO], ["-L${libdir} -lavh_olo"])
   AC_DEFINE([HAVE_AVH], [1], [Define if you have AvH's OneLOop])
  ],
  [test "x$with_avh_olo" == xyes],
  [AC_SUBST([LIBAVHOLO], ["-L${libdir} -lavh_olo"])
   AC_DEFINE([HAVE_AVH], [1], [Define if you have AvH's OneLOop])
  ],
  [test "x$with_avh_olo" != xno],
  [AC_CHECK_FILE([$with_avh_olo], 
     [AC_SUBST([LIBAVHOLO], ["$with_avh_olo"])
      AC_DEFINE([HAVE_AVH], [1], [Define if you have AvH's OneLOop])
     ],
     [AC_MSG_FAILURE(
        [--with-avh_olo was given, but location '$with_avh_olo' \
 is wrong.])])]
  )

AM_CONDITIONAL(COMPILE_AVH, [test "x$with_avh_olo" == xyes \
			 -o "x$with_avh_olo" == xauto])

AS_IF([test "x$with_avh_olo" != xno],
   [AC_SUBST([case_with_avh], ["    "])],
   [AC_SUBST([case_with_avh], ["!AC!"])])
AS_IF([test "x$with_avh_olo" != xno],
   [AC_SUBST([case_wout_avh], ["!AC!"])],
   [AC_SUBST([case_wout_avh], ["    "])])

dnl @synopsis AC_DEFINE_DIR(VARNAME, DIR [, DESCRIPTION])
dnl
dnl This macro sets VARNAME to the expansion of the DIR variable,
dnl taking care of fixing up ${prefix} and such.
dnl
dnl VARNAME is then offered as both an output variable and a C
dnl preprocessor symbol.
dnl
dnl Example:
dnl
dnl    AC_DEFINE_DIR([DATADIR], [datadir], [Where data are placed to.])
dnl
dnl @category Misc
dnl @author Stepan Kasal <kasal@ucw.cz>
dnl @author Andreas Schwab <schwab@suse.de>
dnl @author Guido U. Draheim <guidod@gmx.de>
dnl @author Alexandre Oliva
dnl @version 2006-10-13
dnl @license AllPermissive

AC_DEFUN([AC_DEFINE_DIR], [
   prefix_NONE=
   exec_prefix_NONE=
   test "x$prefix" = xNONE && prefix_NONE=yes && prefix=$ac_default_prefix
   test "x$exec_prefix" = xNONE && exec_prefix_NONE=yes && exec_prefix=$prefix
dnl In Autoconf 2.60, ${datadir} refers to ${datarootdir}, which in turn
dnl refers to ${prefix}.  Thus we have to use `eval' twice.
   eval ac_define_dir="\"[$]$2\""
   eval ac_define_dir="\"$ac_define_dir\""
   AC_SUBST($1, "$ac_define_dir")
   AC_DEFINE_UNQUOTED($1, "$ac_define_dir", [$3])
   test "$prefix_NONE" && prefix=NONE
   test "$exec_prefix_NONE" && exec_prefix=NONE
])


AC_DEFINE_DIR([DATADIR], [datadir])

dnl -----------------------------------------------
dnl link QCDLoop/LoopTools
dnl -----------------------------------------------
AC_ARG_WITH([qcdloop],
  [AS_HELP_STRING([--without-qcdloop],
  [disable integrals from QCDLoop])],
  [],
  [with_qcdloop=auto])
AC_ARG_WITH([looptools],
  [AS_HELP_STRING([--without-looptools],
  [disable integrals from LoopTools])],
  [],
  [with_looptools=auto])
            

dnl AS_IF([test "x$with_qcdloop" != xno -a "x$with_looptools" != xno \
dnl       -a "x$with_qcdloop" != xauto -a "x$with_looptools" != xauto],
dnl      [AC_MSG_FAILURE(
dnl       [Due to name conflicts QCDLoop and LoopTools cannot be linked \
dnl	at the same time.])])

AM_CONDITIONAL(COMPILE_QL,
   [test "x$with_qcdloop" == xyes -o "x$with_qcdloop" = xauto])

LIBQCDLOOP=
AS_IF(
  [test "x$with_qcdloop" == xauto],
    [AC_SUBST([LIBQCDLOOP], ["-L${libdir} -lqcdloop"])
     AC_DEFINE([HAVE_QL], [1], [Define if you have QCDLoop])],
  [test "x$with_qcdloop" == xyes],
  [AC_SUBST([LIBQCDLOOP], ["-L${libdir} -lqcdloop"])
   AC_DEFINE([HAVE_QL], [1], [Define if you have QCDLoop])],
  [test "x$with_qcdloop" != xno -a "x$with_qcdloop" != xauto],
  [AC_CHECK_FILE([$with_qcdloop], 
     [AC_SUBST([LIBQCDLOOP], ["$with_qcdloop"])
      AC_DEFINE([HAVE_QL], [1], [Define if you have QCDLoop])
     ],
     [AC_MSG_FAILURE(
        [--with-qcdloop was given, but location '$with_qcdloop' \
 is wrong.])])]
  )

LIBLOOPTOOLS=
AS_IF([test "x$with_looptools" == xauto],
  [],
  [test "x$with_looptools" == xyes],
  [AC_SUBST([LIBLOOPTOOLS], ["-looptools"])
   AC_DEFINE([HAVE_LOOPTOOLS], [1], [Define if you have LoopTools])
  ],
  [test "x$with_looptools" != xno],
  [AC_CHECK_FILE([$with_looptools], 
     [AC_SUBST([LIBLOOPTOOLS], ["$with_looptools"])
      AC_DEFINE([HAVE_LOOPTOOLS], [1], [Define if you have LoopTools])
     ],
     [AC_MSG_FAILURE(
        [--with-looptools was given, but location '$with_looptools' \
 is wrong.])])]
  )

AS_IF([test "x$with_looptools" != xno -a "x$with_looptools" != xauto],
		[AC_SUBST([case_with_lt], ["    "])],
		[AC_SUBST([case_with_lt], ["!AC!"])])
AS_IF([test "x$with_looptools" != xno -a "x$with_looptools" != xauto],
		[AC_SUBST([case_wout_lt], ["!AC!"])],
		[AC_SUBST([case_wout_lt], ["    "])])
AS_IF([test "x$with_qcdloop" != xno],
		[AC_SUBST([case_with_ql], ["    "])],
		[AC_SUBST([case_with_ql], ["!AC!"])])
AS_IF([test "x$with_qcdloop" != xno],
		[AC_SUBST([case_wout_ql], ["!AC!"])],
		[AC_SUBST([case_wout_ql], ["    "])])

dnl -----------------------------------------------
dnl link Golem95
dnl -----------------------------------------------
AC_ARG_WITH([golem],
  [AS_HELP_STRING([--without-golem],
  [disable integrals from Golem95])],
  [],
  [with_golem=auto])

AC_ARG_WITH([golem-cflags],
  [AS_HELP_STRING([--with-golem-cflags],
  [set the module directory for Golem95])],
  [],
  [with_golem_cflags=auto])

LIBGOLEM=
AS_IF([test "x$with_golem" == xauto],
  [],
  [test "x$with_golem" == xyes],
  [AC_SUBST([LIBGOLEM], ["`pkg-config --libs golem95`"])
   AC_DEFINE([HAVE_GOLEM], [1], [Define if you have Golem95])
  ],
  [test "x$with_golem" != xno],
  [AC_CHECK_FILE([$with_golem], 
     [AC_SUBST([LIBGOLEM], ["$with_golem"])
      AC_DEFINE([HAVE_GOLEM], [1], [Define if you have Golem95])
     ],
     [AC_MSG_FAILURE(
        [--with-golem was given, but location '$with_golem' \
 is wrong.])])]
  )

GOLEMCFLAGS=
AS_IF([test "x$with_golem" != xno -a "x$with_golem" != xauto],
   [AS_IF([test "x$with_golem_cflags" == xauto],
      [AC_SUBST([GOLEM_CFLAGS], ["`pkg-config --cflags golem95`"])],
      [AC_SUBST([GOLEM_CFLAGS], ["$with_golem_cflags"])]
    )],
   [AC_SUBST([GOLEM_CFLAGS], [" "])])
            
AS_IF([test "x$with_golem" != xno -a "x$with_golem" != xauto],
		[AC_SUBST([case_with_golem], ["    "])],
		[AC_SUBST([case_with_golem], ["!AC!"])])
AS_IF([test "x$with_golem" != xno -a "x$with_golem" != xauto],
		[AC_SUBST([case_wout_golem], ["!AC!"])],
		[AC_SUBST([case_wout_golem], ["    "])])


dnl -----------------------------------------------
dnl Set the precision
dnl -----------------------------------------------
AC_ARG_WITH([precision], [AS_HELP_STRING([--with-precision],
	    [set the precision of the library to either
	     'double' or 'quadruple'. @<:@default=double@:>@])],
	     [], [with_precision=double])

AS_IF(
	[test "x$with_precision" == xquadruple],
		[AC_SUBST([fortran_real_kind], ["selected_real_kind(32,50)"])],
	[test "x$with_precision" == xquad],
		[AC_SUBST([fortran_real_kind], ["selected_real_kind(32,50)"])],
	[test "x$with_precision" == xdouble],
		[AC_SUBST([fortran_real_kind], ["kind(1.0d0)"])],
	[test "x$with_precision" == xintermediate],
		[AC_SUBST([fortran_real_kind], ["selected_real_kind(18,4931)"])],
	[AC_MSG_FAILURE([--with-precision was given with an unrecognized
	 parameter])])

dnl -----------------------------------------------
dnl Set the precision of AVH's OneLOop
dnl -----------------------------------------------
AC_ARG_WITH([avh_olo_precision], [AS_HELP_STRING([--with-avh_olo-precision],
	    [set the precision of OneLOop to either
	     'double' or 'quadruple'. @<:@default=double@:>@])],
	     [], [with_avh_olo_precision=double])

AS_IF(
	[test "x$with_avh_olo_precision" == xquadruple],
		[AC_SUBST([avh_olo_real_kind],["selected_real_kind(32,50)"])],
	[test "x$with_avh_olo_precision" == xquad],
		[AC_SUBST([avh_olo_real_kind],["selected_real_kind(32,50)"])],
	[test "x$with_avh_olo_precision" == xdouble],
		[AC_SUBST([avh_olo_real_kind],["kind(1.0d0)"])],
	[test "x$with_precision" == xintermediate],
		[AC_SUBST([avh_olo_real_kind],["selected_real_kind(18,4931)"])],
	[AC_MSG_FAILURE([--with-avh_olo-precision
	 was given with an unrecognized parameter])])
dnl -----------------------------------------------
dnl Generates Makefile's, configuration files and scripts
dnl -----------------------------------------------

AC_CONFIG_FILES([Makefile \
   avh_olo-2.2.1/Makefile \
   avh_olo-2.2.1/avh_olo_xkind.f90 \
   QCDLoop-1.9/Makefile \
   QCDLoop-1.9/ff/Makefile \
   QCDLoop-1.9/ff/ffinit.f \
   QCDLoop-1.9/ql/Makefile \
   samurai/Makefile \
   samurai/precision.f90 \
   samurai/madds.f90 \
   samurai/msamurai.f90 \
   examples/Makefile \
   examples/A51/Makefile \
   examples/DrellYan/Makefile \
   examples/EightPhotons/Makefile \
   examples/FiveGluons/Makefile \
   examples/FourPhotons/Makefile \
   examples/Rank6/Makefile \
   examples/SixGluons/Makefile \
   examples/SixPhotons/Makefile \
   examples/uussbb/Makefile \
   examples/uussbb/common/Makefile \
   examples/uussbb/helicity0/Makefile \
   examples/uussbb/helicity1/Makefile \
   examples/uussbb/helicity2/Makefile \
   samurai.pc])
AC_OUTPUT
