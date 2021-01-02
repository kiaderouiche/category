EXTRA_PROGRAMS=process

link_to_samurai=-L${libdir} -l@GENERIC_LIBRARY_NAME@ \
	@LIBLOOPTOOLS@ @LIBAVHOLO@ @LIBQCDLOOP@ @LIBGOLEM@

AM_FCFLAGS=-I${pkgincludedir}

process_SOURCES= amp6.f90 mtopo6.f90 process.f90 rambo.f90 vars.f90
process_LDADD=${link_to_samurai}

CLEANFILES= amp6.mod mtopo6.mod process.mod rambo.mod vars.mod
all-local: ${EXTRA_PROGRAMS}

include Makefile.dep
