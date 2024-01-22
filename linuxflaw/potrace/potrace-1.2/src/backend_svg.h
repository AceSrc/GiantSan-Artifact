/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: backend_svg.h,v 1.1 2003/08/22 22:24:30 selinger Exp $ */

#ifndef BACKEND_SVG_H
#define BACKEND_SVG_H

#include "curve.h"
#include "main.h"

int page_svg(FILE *fout, path_t *plist, imginfo_t *imginfo);

#endif /* BACKEND_SVG_H */

