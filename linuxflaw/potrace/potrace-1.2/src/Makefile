# Generated automatically from Makefile.in by configure.
# Makefile.in generated automatically by automake 1.4 from Makefile.am

# Copyright (C) 1994, 1995-8, 1999 Free Software Foundation, Inc.
# This Makefile.in is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.


SHELL = /bin/sh

srcdir = .
top_srcdir = ..
prefix = /usr/local
exec_prefix = ${prefix}

bindir = ${exec_prefix}/bin
sbindir = ${exec_prefix}/sbin
libexecdir = ${exec_prefix}/libexec
datadir = ${prefix}/share
sysconfdir = ${prefix}/etc
sharedstatedir = ${prefix}/com
localstatedir = ${prefix}/var
libdir = ${exec_prefix}/lib
infodir = ${prefix}/info
mandir = ${prefix}/man
includedir = ${prefix}/include
oldincludedir = /usr/include

DESTDIR =

pkgdatadir = $(datadir)/potrace
pkglibdir = $(libdir)/potrace
pkgincludedir = $(includedir)/potrace

top_builddir = ..

ACLOCAL = aclocal
AUTOCONF = autoconf
AUTOMAKE = automake
AUTOHEADER = autoheader

INSTALL = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL} $(AM_INSTALL_PROGRAM_FLAGS)
INSTALL_DATA = ${INSTALL} -m 644
INSTALL_SCRIPT = ${INSTALL_PROGRAM}
transform = s,x,x,

NORMAL_INSTALL = :
PRE_INSTALL = :
POST_INSTALL = :
NORMAL_UNINSTALL = :
PRE_UNINSTALL = :
POST_UNINSTALL = :
CC = clang
DATE = December 2003
EXTRA_OBJS = 
INCLUDES = 
MAKEINFO = makeinfo
MKBITMAP = mkbitmap
PACKAGE = potrace
POTRACE = potrace
VERSION = 1.2
prog_compress = 

bin_PROGRAMS = potrace mkbitmap
EXTRA_DIST = getopt.c getopt1.c getopt.h

potrace_SOURCES = main.c main.h curve.c curve.h bitmap.c bitmap.h backend_eps.c backend_eps.h ztops.c ztops.h flate.c flate.h lists.h path.c path.h greymap.c greymap.h render.c render.h backend_pgm.c backend_pgm.h backend_svg.c backend_svg.h backend_gimp.c backend_gimp.h backend_xfig.c backend_xfig.h

potrace_LDADD =  -lm -lz
potrace_DEPENDENCIES = 

mkbitmap_SOURCES = mkbitmap.c bitmap.c bitmap.h greymap.c greymap.h
mkbitmap_LDADD =  -lm
mkbitmap_DEPENDENCIES = 
mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
CONFIG_HEADER = ../config.h
CONFIG_CLEAN_FILES = 
PROGRAMS =  $(bin_PROGRAMS)


DEFS = -DHAVE_CONFIG_H -I. -I$(srcdir) -I..
CPPFLAGS = 
LDFLAGS = 
LIBS = 
potrace_OBJECTS =  main.o curve.o bitmap.o backend_eps.o ztops.o flate.o \
path.o greymap.o render.o backend_pgm.o backend_svg.o backend_gimp.o \
backend_xfig.o
potrace_LDFLAGS = 
mkbitmap_OBJECTS =  mkbitmap.o bitmap.o greymap.o
mkbitmap_LDFLAGS = 
CFLAGS = -g -O0 -fsanitize=address
COMPILE = $(CC) $(DEFS) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
CCLD = $(CC)
LINK = $(CCLD) $(AM_CFLAGS) $(CFLAGS) $(LDFLAGS) -o $@
DIST_COMMON =  Makefile.am Makefile.in


DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) $(TEXINFOS) $(EXTRA_DIST)

TAR = gtar
GZIP_ENV = --best
SOURCES = $(potrace_SOURCES) $(mkbitmap_SOURCES)
OBJECTS = $(potrace_OBJECTS) $(mkbitmap_OBJECTS)

all: all-redirect
.SUFFIXES:
.SUFFIXES: .S .c .o .s
$(srcdir)/Makefile.in: Makefile.am $(top_srcdir)/configure.in $(ACLOCAL_M4) 
	cd $(top_srcdir) && $(AUTOMAKE) --gnu --include-deps src/Makefile

Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
	cd $(top_builddir) \
	  && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status


mostlyclean-binPROGRAMS:

clean-binPROGRAMS:
	-test -z "$(bin_PROGRAMS)" || rm -f $(bin_PROGRAMS)

distclean-binPROGRAMS:

maintainer-clean-binPROGRAMS:

install-binPROGRAMS: $(bin_PROGRAMS)
	@$(NORMAL_INSTALL)
	$(mkinstalldirs) $(DESTDIR)$(bindir)
	@list='$(bin_PROGRAMS)'; for p in $$list; do \
	  if test -f $$p; then \
	    echo "  $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`"; \
	     $(INSTALL_PROGRAM) $$p $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
	  else :; fi; \
	done

uninstall-binPROGRAMS:
	@$(NORMAL_UNINSTALL)
	list='$(bin_PROGRAMS)'; for p in $$list; do \
	  rm -f $(DESTDIR)$(bindir)/`echo $$p|sed 's/$(EXEEXT)$$//'|sed '$(transform)'|sed 's/$$/$(EXEEXT)/'`; \
	done

.c.o:
	$(COMPILE) -c $<

.s.o:
	$(COMPILE) -c $<

.S.o:
	$(COMPILE) -c $<

mostlyclean-compile:
	-rm -f *.o core *.core

clean-compile:

distclean-compile:
	-rm -f *.tab.c

maintainer-clean-compile:

potrace: $(potrace_OBJECTS) $(potrace_DEPENDENCIES)
	@rm -f potrace
	$(LINK) $(potrace_LDFLAGS) $(potrace_OBJECTS) $(potrace_LDADD) $(LIBS)

mkbitmap: $(mkbitmap_OBJECTS) $(mkbitmap_DEPENDENCIES)
	@rm -f mkbitmap
	$(LINK) $(mkbitmap_LDFLAGS) $(mkbitmap_OBJECTS) $(mkbitmap_LDADD) $(LIBS)

tags: TAGS

ID: $(HEADERS) $(SOURCES) $(LISP)
	list='$(SOURCES) $(HEADERS)'; \
	unique=`for i in $$list; do echo $$i; done | \
	  awk '    { files[$$0] = 1; } \
	       END { for (i in files) print i; }'`; \
	here=`pwd` && cd $(srcdir) \
	  && mkid -f$$here/ID $$unique $(LISP)

TAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) $(LISP)
	tags=; \
	here=`pwd`; \
	list='$(SOURCES) $(HEADERS)'; \
	unique=`for i in $$list; do echo $$i; done | \
	  awk '    { files[$$0] = 1; } \
	       END { for (i in files) print i; }'`; \
	test -z "$(ETAGS_ARGS)$$unique$(LISP)$$tags" \
	  || (cd $(srcdir) && etags $(ETAGS_ARGS) $$tags  $$unique $(LISP) -o $$here/TAGS)

mostlyclean-tags:

clean-tags:

distclean-tags:
	-rm -f TAGS ID

maintainer-clean-tags:

distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)

subdir = src

distdir: $(DISTFILES)
	@for file in $(DISTFILES); do \
	  d=$(srcdir); \
	  if test -d $$d/$$file; then \
	    cp -pr $$d/$$file $(distdir)/$$file; \
	  else \
	    test -f $(distdir)/$$file \
	    || ln $$d/$$file $(distdir)/$$file 2> /dev/null \
	    || cp -p $$d/$$file $(distdir)/$$file || :; \
	  fi; \
	done
backend_eps.o: backend_eps.c main.h ../config.h backend_eps.h curve.h \
	flate.h lists.h
backend_gimp.o: backend_gimp.c main.h ../config.h backend_gimp.h curve.h \
	lists.h
backend_pgm.o: backend_pgm.c curve.h lists.h greymap.h render.h main.h \
	../config.h backend_pgm.h
backend_svg.o: backend_svg.c main.h ../config.h backend_svg.h curve.h \
	lists.h
backend_xfig.o: backend_xfig.c main.h ../config.h backend_xfig.h curve.h \
	lists.h
bitmap.o: bitmap.c bitmap.h
curve.o: curve.c main.h ../config.h backend_eps.h curve.h lists.h
flate.o: flate.c flate.h ztops.h
greymap.o: greymap.c greymap.h
main.o: main.c getopt.h main.h ../config.h backend_eps.h curve.h \
	backend_pgm.h backend_svg.h backend_gimp.h backend_xfig.h \
	path.h bitmap.h ztops.h
mkbitmap.o: mkbitmap.c getopt.h greymap.h bitmap.h ../config.h
path.o: path.c bitmap.h curve.h main.h ../config.h lists.h
render.o: render.c render.h greymap.h
ztops.o: ztops.c getopt.h ztops.h

info-am:
info: info-am
dvi-am:
dvi: dvi-am
check-am: all-am
check: check-am
installcheck-am:
installcheck: installcheck-am
install-exec-am: install-binPROGRAMS
install-exec: install-exec-am

install-data-am:
install-data: install-data-am

install-am: all-am
	@$(MAKE) $(AM_MAKEFLAGS) install-exec-am install-data-am
install: install-am
uninstall-am: uninstall-binPROGRAMS
uninstall: uninstall-am
all-am: Makefile $(PROGRAMS)
all-redirect: all-am
install-strip:
	$(MAKE) $(AM_MAKEFLAGS) AM_INSTALL_PROGRAM_FLAGS=-s install
installdirs:
	$(mkinstalldirs)  $(DESTDIR)$(bindir)


mostlyclean-generic:

clean-generic:

distclean-generic:
	-rm -f Makefile $(CONFIG_CLEAN_FILES)
	-rm -f config.cache config.log stamp-h stamp-h[0-9]*

maintainer-clean-generic:
mostlyclean-am:  mostlyclean-binPROGRAMS mostlyclean-compile \
		mostlyclean-tags mostlyclean-generic

mostlyclean: mostlyclean-am

clean-am:  clean-binPROGRAMS clean-compile clean-tags clean-generic \
		mostlyclean-am

clean: clean-am

distclean-am:  distclean-binPROGRAMS distclean-compile distclean-tags \
		distclean-generic clean-am

distclean: distclean-am

maintainer-clean-am:  maintainer-clean-binPROGRAMS \
		maintainer-clean-compile maintainer-clean-tags \
		maintainer-clean-generic distclean-am
	@echo "This command is intended for maintainers to use;"
	@echo "it deletes files that may require special tools to rebuild."

maintainer-clean: maintainer-clean-am

.PHONY: mostlyclean-binPROGRAMS distclean-binPROGRAMS clean-binPROGRAMS \
maintainer-clean-binPROGRAMS uninstall-binPROGRAMS install-binPROGRAMS \
mostlyclean-compile distclean-compile clean-compile \
maintainer-clean-compile tags mostlyclean-tags distclean-tags \
clean-tags maintainer-clean-tags distdir info-am info dvi-am dvi check \
check-am installcheck-am installcheck install-exec-am install-exec \
install-data-am install-data install-am install uninstall-am uninstall \
all-redirect all-am all installdirs mostlyclean-generic \
distclean-generic clean-generic maintainer-clean-generic clean \
mostlyclean distclean maintainer-clean


# The following dependencies were generated with
# makedepend -DHAVE_CONFIG_H -I.. -f- -Y *.c

# DO NOT DELETE

backend_eps.o: main.h ../config.h backend_eps.h curve.h flate.h lists.h
backend_gimp.o: main.h ../config.h backend_gimp.h curve.h lists.h
backend_pgm.o: curve.h lists.h greymap.h render.h main.h ../config.h
backend_pgm.o: backend_pgm.h
backend_svg.o: main.h ../config.h backend_svg.h curve.h lists.h
backend_xfig.o: main.h ../config.h backend_xfig.h curve.h lists.h
bitmap.o: bitmap.h
curve.o: main.h ../config.h backend_eps.h curve.h lists.h
flate.o: flate.h ztops.h
getopt1.o: ../config.h getopt.h
getopt.o: ../config.h getopt.h
greymap.o: greymap.h
main.o: getopt.h main.h ../config.h backend_eps.h curve.h backend_pgm.h
main.o: backend_svg.h backend_gimp.h backend_xfig.h path.h bitmap.h ztops.h
mkbitmap.o: getopt.h greymap.h bitmap.h ../config.h
path.o: bitmap.h curve.h main.h ../config.h lists.h
render.o: render.h greymap.h
ztops.o: ztops.h

# Tell versions [3.59,3.63) of GNU make to not export all variables.
# Otherwise a system limit (for SysV at least) may be exceeded.
.NOEXPORT:
