EXTRA_PROGRAMS=process

link_to_samurai=-L${libdir} -l@GENERIC_LIBRARY_NAME@ \
	@LIBLOOPTOOLS@ @LIBAVHOLO@ @LIBQCDLOOP@ @LIBGOLEM@

AM_FCFLAGS=-I${pkgincludedir}

process_SOURCES= amp4.f90 mtopo4.f90 process.f90 rambo.f90 vars.f90
process_LDADD=${link_to_samurai}

CLEANFILES= amp4.mod mtopo4.mod process.mod rambo.mod vars.mod

all-local: ${EXTRA_PROGRAMS}

include Makefile.dep
