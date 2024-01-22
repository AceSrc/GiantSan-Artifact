/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: render.h,v 1.4 2003/09/12 02:14:18 selinger Exp $ */

#ifndef RENDER_H
#define RENDER_H

#include "greymap.h"

struct render_s {
  greymap_t *gm;
  double x0, y0, x1, y1;
  int x0i, y0i, x1i, y1i;
  double a0, a1;
  int *incrow_buf;
};
typedef struct render_s render_t;

render_t *render_new(greymap_t *gm);
void render_free(render_t *rm);
void render_close(render_t *rm);
void render_moveto(render_t *rm, double x, double y);
void render_lineto(render_t *rm, double x, double y);
void render_curveto(render_t *rm, double x2, double y2, double x3, double y3, double x4, double y4);

#endif /* RENDER_H */
