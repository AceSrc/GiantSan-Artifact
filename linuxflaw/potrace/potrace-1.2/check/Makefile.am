## Copyright (C) 2000-2003 Peter Selinger.
## This file is part of potrace. It is free software and it is covered
## by the GNU general public license. See the file COPYING for details.

## Process this file with automake to produce Makefile.in

TESTS = input-check.sh backend-check.sh potrace-check.sh postscript-check.sh

check_PROGRAMS = pgmdiff
check_SCRIPTS = input-check.sh backend-check.sh potrace-check.sh postscript-check.sh

EXTRA_DIST = input-check.sh backend-check.sh potrace-check.sh postscript-check.sh missing.sh faces.pbm faces.pgm faces.ppm faces.bmp1 faces.bmp4 faces.bmp8 faces.bmp24 faces.bmp4r faces.bmp8r faces.pgm.out faces.pbm.gs

pgmdiff_SOURCES = pgmdiff.c
pgmdiff_LDADD = ../src/greymap.o -lm
pgmdiff_DEPENDENCIES = ../src/greymap.o

../src/greymap.o:
	(cd ../src && $(MAKE) $(AM_MAKEFLAGS) greymap.o)
