#
# Copyright (C) 2018 Guido Berhoerster <guido+pui@berhoerster.name>
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

PACKAGE =	package-update-indicator
APPLICATION_ID = org.guido-berhoerster.code.package-update-indicator
PREFS_APPLICATION_ID = org.guido-berhoerster.code.package-update-indicator.preferences
VERSION =	7
DISTNAME =	$(PACKAGE)-$(VERSION)
AUTHOR =	Guido Berhoerster
BUG_ADDRESS =	guido+pui@berhoerster.name

# gcc, clang, icc, Sun/Solaris Studio
CC :=		$(CC) -std=c99
COMPILE.c =	$(CC) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(XCPPFLAGS) $(TARGET_ARCH) -c
# gcc, clang, icc
MAKEDEPEND.c =	$(CC) -MM $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(XCPPFLAGS)
# Sun/Solaris Studio
#MAKEDEPEND.c =	$(CC) -xM1 $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(XCPPFLAGS)
# X makedepend
#MAKEDEPEND.c =	makedepend -f- -Y -- $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(XCPPFLAGS) --
LINK.c =	$(CC) $(CFLAGS) $(XCFLAGS) $(CPPFLAGS) $(XCPPFLAGS) $(LDFLAGS) $(XLDFLAGS) $(TARGET_ARCH)
LINK.o =	$(CC) $(LDFLAGS) $(XLDFLAGS) $(TARGET_ARCH)
CP :=		cp
INSTALL :=	install
INSTALL.exec :=	$(INSTALL) -D -m 0755
INSTALL.data :=	$(INSTALL) -D -m 0644
INSTALL.link :=	$(CP) -f -P
PAX :=		pax
GZIP :=		gzip
SED :=		sed
GLIB_COMPILE_SCHEMAS := $(shell pkg-config --variable=glib_compile_schemas gio-2.0)
GLIB_COMPILE_RESOURCES := $(shell pkg-config --variable=glib_compile_resources gio-2.0)
GLIB_MKENUMS :=	$(shell pkg-config --variable=glib_mkenums glib-2.0)
XSLTPROC :=	xsltproc
DOCBOOK5_MANPAGES_STYLESHEET = http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
DOCBOOK5_MANPAGES_FLAGS = --stringparam man.authors.section.enabled 0 \
		--stringparam man.copyright.section.enabled 0
MSGFMT =	msgfmt
MSGMERGE =	msgmerge
XGETTEXT =	xgettext
XGETTEXT_OPTIONS = --copyright-holder "$(AUTHOR)" \
		--package-name '$(PACKAGE)' \
		--package-version '$(VERSION)' \
		--msgid-bugs-address '$(BUG_ADDRESS)' \
		--default-domain '$(PACKAGE)' \
		--from-code UTF-8 \
		--keyword=_ \
		--keyword=N_ \
		--keyword=C_:1c,2 \
		--keyword=NC_:1c,2 \
		--keyword=g_dngettext:2,3 \
		--add-comments
INDICATOR_LIB := $(or \
		    $(shell pkg-config --exists appindicator3-0.1 && \
		        printf '%s\\\n' appindicator3-0.1), \
		    $(shell pkg-config --exists ayatana-appindicator3-0.1 && \
		        printf '%s\\\n' ayatana-appindicator3-0.1), \
		    appindicator3-0.1)
INDICATOR_FLAG := $(if $(findstring ayatana,$(INDICATOR_LIB)), \
		    -DHAVE_AYATANA_APPINDICATOR,)

define generate-manpage-rule =
%.$1: %.$(addsuffix .xml,$1) docbook-update-source-data.xsl
	$$(XSLTPROC) \
	    --xinclude \
	    --stringparam package $$(PACKAGE) \
	    --stringparam version $$(VERSION) \
	    docbook-update-source-data.xsl $$< | \
	    $$(XSLTPROC) \
	    --xinclude \
	    --output $$@ \
	    $$(DOCBOOK5_MANPAGES_FLAGS) \
	    $$(DOCBOOK5_MANPAGES_STYLESHEET) \
	    -
endef

DESTDIR ?=
prefix ?=	/usr/local
bindir ?=	$(prefix)/bin
datadir ?=	$(prefix)/share
mandir ?=	$(datadir)/man
localedir ?=	$(datadir)/locale
sysconfdir ?=	/etc
xdgautostartdir ?= $(sysconfdir)/xdg/autostart
xdgapplicationsdir ?= $(datadir)/applications

OS_NAME :=	$(shell uname -s)
OS_RELEASE :=	$(shell uname -r)

$(PACKAGE)_OBJS = package-update-indicator.o \
		pui-application.o \
		pui-backend.o \
		pui-get-updates.o \
		pui-settings.o \
		pui-types.o \
		pui-resources.o

$(PACKAGE)-prefs_OBJS = package-update-indicator-prefs.o \
		pui-prefs-application.o \
		pui-settings.o \
		pui-prefs-resources.o

OBJS = $($(PACKAGE)_OBJS) $($(PACKAGE)-prefs_OBJS)

ENUM_DEPS =	pui-backend.h \
		pui-application.h

ENUM_HEADER =	pui-types.h

ENUM_FILES =	$(ENUM_HEADER) \
		pui-types.c

GSETTINGS_SCHEMAS = $(APPLICATION_ID).gschema.xml

GRESOURCE_FILES = pui-prefs.gresource.xml

AUTOSTART_FILE = $(APPLICATION_ID).desktop

DESKTOP_FILES = $(PREFS_APPLICATION_ID).desktop

LINGUAS :=	$(shell sed 's/\#.*//' po/LINGUAS)
MOFILES :=	$(patsubst %,po/%.mo,$(LINGUAS))
POTFILES_IN :=	$(shell sed 's/\#.*//' po/POTFILES.in)
POTFILE =	po/$(PACKAGE).pot

MANPAGES =	$(PACKAGE).1 $(PACKAGE)-prefs.1

.DEFAULT_TARGET = all

.PHONY: all pot update-po clean clobber dist install

all: $(PACKAGE) $(PACKAGE)-prefs $(AUTOSTART_FILE) $(DESKTOP_FILES) $(MOFILES) $(MANPAGES)

$(PACKAGE): XCPPFLAGS =	-DPACKAGE=\"$(PACKAGE)\" \
			-DAPPLICATION_ID=\"$(APPLICATION_ID)\" \
			-DVERSION=\"$(VERSION)\" \
			-DG_LOG_DOMAIN=\"$(PACKAGE)\" \
			-DPACKAGE_LOCALE_DIR="\"$(localedir)\"" \
			-DGETTEXT_PACKAGE=\"$(PACKAGE)\" \
			-DSETTINGS_SCHEMA_ID=\"$(APPLICATION_ID)\" \
			-DI_KNOW_THE_PACKAGEKIT_GLIB2_API_IS_SUBJECT_TO_CHANGE \
			$(INDICATOR_FLAG)
$(PACKAGE): XCFLAGS =	$(shell pkg-config --cflags gtk+-3.0 \
			    $(INDICATOR_LIB) packagekit-glib2 \
			    polkit-gobject-1 upower-glib)
$(PACKAGE): LDLIBS =	$(shell pkg-config --libs gtk+-3.0 \
			    $(INDICATOR_LIB) packagekit-glib2 \
			    polkit-gobject-1 upower-glib)

$(PACKAGE)-prefs: XCPPFLAGS = -DPACKAGE=\"$(PACKAGE)\" \
			-DAPPLICATION_ID=\"$(PREFS_APPLICATION_ID)\" \
			-DVERSION=\"$(VERSION)\" \
			-DG_LOG_DOMAIN=\"$(PACKAGE)\" \
			-DPACKAGE_LOCALE_DIR="\"$(localedir)\"" \
			-DGETTEXT_PACKAGE=\"$(PACKAGE)\" \
			-DSETTINGS_SCHEMA_ID=\"$(APPLICATION_ID)\"
$(PACKAGE)-prefs: XCFLAGS = $(shell pkg-config --cflags gtk+-3.0)
$(PACKAGE)-prefs: LDLIBS = $(shell pkg-config --libs gtk+-3.0)

ifneq ($(findstring $(OS_NAME),FreeBSD DragonFly OpenBSD),)
  $(PACKAGE): XCPPFLAGS +=	-I/usr/local/include
  $(PACKAGE): XLDFLAGS +=	-L/usr/local/lib
else ifeq ($(OS_NAME),NetBSD)
  $(PACKAGE): XCPPFLAGS +=	-I/usr/pkg/include
  $(PACKAGE): XLDFLAGS +=	-L/usr/pkg/lib
endif
ifeq ($(findstring $(OS_NAME),FreeBSD DragonFly NetBSD OpenBSD),)
  $(PACKAGE): XCPPFLAGS +=	-D_XOPEN_SOURCE=600
endif

$(PACKAGE): $($(PACKAGE)_OBJS)
	$(LINK.o) $^ $(LDLIBS) -o $@

$(PACKAGE)-prefs: $($(PACKAGE)-prefs_OBJS)
	$(LINK.o) $^ $(LDLIBS) -o $@

$(OBJS): $(ENUM_HEADER)

%-types.h: %-types.h.in $(ENUM_DEPS)
	$(GLIB_MKENUMS) --template $< >$@ $(filter-out $<,$^)

%-types.c: %-types.c.in $(ENUM_DEPS)
	$(GLIB_MKENUMS) --template $< >$@ $(filter-out $<,$^)

%-resources.c: %.gresource.xml
	$(GLIB_COMPILE_RESOURCES) --generate-dependencies $< | \
	    while read -r resource_file; do \
	        printf '%s: %s\n' $@ "$${resource_file}"; \
	    done
	$(GLIB_COMPILE_RESOURCES) --target=$@ --sourcedir=. --generate-source $<

$(POTFILE): po/POTFILES.in $(POTFILES_IN)
	$(XGETTEXT) $(XGETTEXT_OPTIONS) --files-from $< --output $@

pot: $(POTFILE)

update-po: $(POTFILE)
	for pofile in $(patsubst %.mo,%.po,$(MOFILES)); do \
	    $(MSGMERGE) --update --backup off $$pofile $<; \
	done

%.mo: %.po
	$(MSGFMT) --output $@ $<

%.desktop: %.desktop.in
	$(MSGFMT) --desktop --keyword 'Keywords' --template $< -d po --output $@

$(foreach section,1 2 3 4 5 6 7 8 9,$(eval $(call generate-manpage-rule,$(section))))

%.o: %.c
	$(MAKEDEPEND.c) $< | $(SED) -f deps.sed >$*.d
	$(COMPILE.c) -o $@ $<

install: all
	$(INSTALL.exec) $(PACKAGE) "$(DESTDIR)$(bindir)/$(PACKAGE)"
	$(INSTALL.exec) $(PACKAGE)-prefs \
	    "$(DESTDIR)$(bindir)/$(PACKAGE)-prefs"
	for schema in $(GSETTINGS_SCHEMAS); do \
	    $(INSTALL.data) $${schema} \
	        $(DESTDIR)$(datadir)/glib-2.0/schemas/$${schema}; \
	done
	if [ -n "$(GSETTINGS_SCHEMAS)" ] && [ -z "$(DESTDIR)" ]; then \
	    $(GLIB_COMPILE_SCHEMAS) $(datadir)/glib-2.0/schemas; \
	fi
	$(INSTALL.data) $(AUTOSTART_FILE) \
	    $(DESTDIR)$(xdgautostartdir)/$(AUTOSTART_FILE)
	for desktop_file in $(DESKTOP_FILES); do \
	    $(INSTALL.data) $${desktop_file} \
	        $(DESTDIR)$(xdgapplicationsdir)/$${desktop_file}; \
	done
	for lang in $(LINGUAS); do \
	   $(INSTALL.data) po/$${lang}.mo \
	        $(DESTDIR)$(localedir)/$${lang}/LC_MESSAGES/$(PACKAGE).mo; \
	done
	for manpage in $(MANPAGES); do \
	    $(INSTALL.data) $${manpage} \
	        "$(DESTDIR)$(mandir)/man$${manpage##*.}/$${manpage##*/}"; \
	done

clean:
	rm -f $(PACKAGE) $(OBJS) $(ENUM_FILES) $(AUTOSTART_FILE) \
	    $(DESKTOP_FILES) $(POTFILE) $(MOFILES) $(MANPAGES)

clobber: clean
	rm -f $(patsubst %.o,%.d,$(OBJS))

dist: clobber
	$(PAX) -w -x ustar -s ',.*/\..*,,' -s ',./[^/]*\.tar\.gz,,' \
	    -s ',^\.$$,,' -s ',\./,$(DISTNAME)/,' . | \
	    $(GZIP) > $(DISTNAME).tar.gz

-include local.mk

-include $(patsubst %.o,%.d,$(OBJS))
-include $(patsubst %.gresource.xml,%.gresource.d,$(GRESOURCE_FILES))
