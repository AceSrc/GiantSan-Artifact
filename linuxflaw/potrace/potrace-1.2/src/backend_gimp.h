/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: backend_gimp.h,v 1.1 2003/08/28 19:02:34 selinger Exp $ */

#ifndef BACKEND_GIMPPATH_H
#define BACKEND_GIMPPATH_H

#include "curve.h"
#include "main.h"

int page_gimp(FILE *fout, path_t *plist, imginfo_t *imginfo);

#endif /* BACKEND_GIMPPATH_H */

