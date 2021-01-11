# vim: ts=3:sw=3
DIST_SUBDIRS = avh_olo-2.2.1 QCDLoop-1.9 samurai examples
SUBDIRS=
if COMPILE_AVH
SUBDIRS+= avh_olo-2.2.1
else
# nop
endif
if COMPILE_QL
SUBDIRS+= QCDLoop-1.9
else
# nop
endif
SUBDIRS+= samurai

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = samurai.pc

lib_LTLIBRARIES         = libavh_olo.la libqcdloop.la libsamurai.la
libavh_olo_la_SOURCES   =
libavh_olo_la_LIBADD    = \
       $(builddir)/avh_olo-2.2.1/libavh_olo.la

libqcdloop_la_SOURCES   =
libqcdloop_la_LIBADD    = \
	$(builddir)/QCDLoop-1.9/ql/libqcdloop_ql.la \
	$(builddir)/QCDLoop-1.9/ff/libqcdloop_ff.la

libsamurai_la_SOURCES     =
libsamurai_la_LIBADD      = \
	$(builddir)/samurai/libsamurai.la

if COMPILE_AVH
libsamurai_la_LIBADD += $(builddir)/libavh_olo.la
else
# nop
endif
if COMPILE_QL
libsamurai_la_LIBADD += $(builddir)/libqcdloop.la
else
# nop
endif

dist_noinst_SCRIPTS = autogen.sh makedepend.perl

EXTRA_DIST=\
	$(top_srcdir)/doc/samurai_manual.pdf \
	$(top_srcdir)/examples/A51/ltest.dat \
	$(top_srcdir)/examples/DrellYan/ltest.dat \
	$(top_srcdir)/examples/EightPhotons/ltest.dat \
	$(top_srcdir)/examples/FiveGluons/ltest.dat \
	$(top_srcdir)/examples/FourPhotons/ltest.dat \
	$(top_srcdir)/examples/Rank6/ltest.dat \
	$(top_srcdir)/examples/SixGluons/ltest.dat \
	$(top_srcdir)/examples/SixPhotons/ltest.dat \
	$(top_srcdir)/examples/uussbb/ltest.dat \
	$(top_srcdir)/examples/EightPhotons/dl8.f90 \
	$(top_srcdir)/examples/SixPhotons/dl6.f90 \
	$(top_srcdir)/examples/FourPhotons/dl4.f90 \
	$(top_srcdir)/QCDLoop-1.9/Doc/man.tex \
	$(top_srcdir)/QCDLoop-1.9/Doc/man.ps \
	$(top_srcdir)/QCDLoop-1.9/Doc/tot.eps \
   $(top_srcdir)/QCDLoop-1.9/ql/qlconstants.f \
	$(top_srcdir)/QCDLoop-1.9/ql/qlonshellcutoff.f \
	$(top_srcdir)/QCDLoop-1.9/ff/fferr.dat \
	$(top_srcdir)/QCDLoop-1.9/ff/ffperm5.dat \
	$(top_srcdir)/QCDLoop-1.9/ff/ffwarn.dat \
	$(top_srcdir)/QCDLoop-1.9/ff/ff.h \
	$(top_srcdir)/QCDLoop-1.9/ff/ffs.h \
	$(top_srcdir)/QCDLoop-1.9/ff/aa.h \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_a0_a.h90 \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_a0_b.h90 \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_b0_a.h90 \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_b0_b.h90 \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_b11_a.h90 \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_b11_b.h90 \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_c0_a.h90 \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_c0_b.h90 \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_d0_a.h90 \
	$(top_srcdir)/avh_olo-2.2.1/avh_olo_d0_b.h90

pkgdata_DATA=\
	$(top_srcdir)/QCDLoop-1.9/ff/fferr.dat \
	$(top_srcdir)/QCDLoop-1.9/ff/ffperm5.dat \
	$(top_srcdir)/QCDLoop-1.9/ff/ffwarn.dat

ACLOCAL_AMFLAGS = -I m4
EXTRA_DIST+=m4

dist-hook:
	find $(distdir) -name '*.mod' -exec rm \{} \;
