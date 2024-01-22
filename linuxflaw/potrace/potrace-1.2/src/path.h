/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: path.h,v 1.5 2003/09/12 02:14:18 selinger Exp $ */

#ifndef PATH_H
#define PATH_H

#include "curve.h"
#include "bitmap.h"

int bm_to_pathlist(bitmap_t *bm, path_t **plistp);

#endif /* PATH_H */

