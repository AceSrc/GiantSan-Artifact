## Copyright (C) 2001-2003 Peter Selinger.
## This file is part of potrace. It is free software and it is covered
## by the GNU general public license. See the file COPYING for details.

## Process this file with automake to produce Makefile.in

bin_PROGRAMS = potrace mkbitmap
EXTRA_DIST = getopt.c getopt1.c getopt.h

potrace_SOURCES = main.c main.h curve.c curve.h bitmap.c bitmap.h backend_eps.c backend_eps.h ztops.c ztops.h flate.c flate.h lists.h path.c path.h greymap.c greymap.h render.c render.h backend_pgm.c backend_pgm.h backend_svg.c backend_svg.h backend_gimp.c backend_gimp.h backend_xfig.c backend_xfig.h

potrace_LDADD = @EXTRA_OBJS@ -lm -lz
potrace_DEPENDENCIES = @EXTRA_OBJS@

mkbitmap_SOURCES = mkbitmap.c bitmap.c bitmap.h greymap.c greymap.h
mkbitmap_LDADD = @EXTRA_OBJS@ -lm
mkbitmap_DEPENDENCIES = @EXTRA_OBJS@

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
