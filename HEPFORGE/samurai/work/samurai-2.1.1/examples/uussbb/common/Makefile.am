noinst_LIBRARIES=libuussbb_common.a

link_to_samurai=-L${libdir} -l@GENERIC_LIBRARY_NAME@ \
	@LIBLOOPTOOLS@ @LIBAVHOLO@ @LIBQCDLOOP@ @LIBGOLEM@

AM_FCFLAGS=-I${pkgincludedir}

libuussbb_common_a_SOURCES=\
   color.f90 config.f90 functions.f90 kinematics.f90 model.f90 \
   rambo.f90 util.f90

CLEANFILES=\
   uussbb_color.mod uussbb_config.mod uussbb_functions.mod \
   uussbb_kinematics.mod uussbb_model.mod uussbb_rambo.mod uussbb_util.mod

include Makefile.dep
