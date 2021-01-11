DIST_SUBDIRS=common helicity0 helicity1 helicity2
SUBDIRS=common helicity0 helicity1 helicity2

EXTRA_PROGRAMS=test

link_to_samurai=-L${libdir} -l@GENERIC_LIBRARY_NAME@ \
	@LIBLOOPTOOLS@ @LIBAVHOLO@ @LIBQCDLOOP@ @LIBGOLEM@

AM_FCFLAGS=-I${pkgincludedir} \
	   -I$(top_srcdir)/examples/uussbb/common \
	   -I$(top_srcdir)/examples/uussbb/helicity0 \
	   -I$(top_srcdir)/examples/uussbb/helicity1 \
	   -I$(top_srcdir)/examples/uussbb/helicity2

test_SOURCES= matrix.f90 test.f90
test_LDADD=\
	   $(top_srcdir)/examples/uussbb/helicity0/libuussbb_helicity0.a \
	   $(top_srcdir)/examples/uussbb/helicity1/libuussbb_helicity1.a \
	   $(top_srcdir)/examples/uussbb/helicity2/libuussbb_helicity2.a \
	   $(top_srcdir)/examples/uussbb/common/libuussbb_common.a \
	   ${link_to_samurai}

CLEANFILES= uussbb_matrix.mod

all-local: ${EXTRA_PROGRAMS}

include Makefile.dep
