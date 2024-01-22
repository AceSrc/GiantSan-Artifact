/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: backend_gimp.c,v 1.1 2003/08/28 19:02:34 selinger Exp $ */

/* The gimppath backend of potrace. Can be imported by Gimp with the
   "Import Path" feature (Layers -> Layers, Channels & Paths -> Paths
   -> Right-click -> Import Path) */

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>

#include "main.h"
#include "backend_gimp.h"
#include "curve.h"
#include "lists.h"

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#define max(a,b) ((a)>(b) ? (a) : (b))

/* ---------------------------------------------------------------------- */
/* path-drawing auxiliary functions */

/* structure to hold an affine coordinate transformation */
struct trans_s {
  double ox, oy;             /* origin */
  double dxx, dxy, dyx, dyy; /* transformation matrix */
};
typedef struct trans_s trans_t;

static dpoint_t trans(dpoint_t p, trans_t t) {
  dpoint_t res;

  res.x = t.ox + p.x * t.dxx + p.y * t.dyx;
  res.y = t.oy + p.x * t.dxy + p.y * t.dyy;
  return res;
}

/* coordinate quantization */
static point_t unit(dpoint_t p) {
  point_t q;

  q.x = (long)(floor(p.x*info.unit+.5));
  q.y = (long)(floor(p.y*info.unit+.5));
  return q;
}

static void gimppath_point(FILE *fout, int typ, dpoint_t p, trans_t t) {
  point_t q;

  q = unit(trans(p, t));

  fprintf(fout, "TYPE: %d X: %ld Y: %ld\n", typ, q.x, q.y);
}

/* ---------------------------------------------------------------------- */
/* functions for converting a path to a gimppath */

/* do one path. First should be 1 on the very first path, else 0. */
static int gimppath_path(FILE *fout, curve_t *curve, int m, int first, trans_t t) {
  int i;
  dpoint_t *c, *c1;

  first = first ? 1 : 3;

  for (i=0; i<m; i++) {
    c = curve[i].c;
    c1 = curve[mod(i-1,m)].c;
    switch (curve[i].tag) {
    case CORNER:
      gimppath_point(fout, first, c1[2], t);
      gimppath_point(fout, 2, c1[2], t);
      gimppath_point(fout, 2, c[1], t);
      gimppath_point(fout, 1, c[1], t);
      gimppath_point(fout, 2, c[1], t);
      gimppath_point(fout, 2, c[2], t);
      break;
    case CURVETO:
      gimppath_point(fout, first, c1[2], t);
      gimppath_point(fout, 2, c[0], t);
      gimppath_point(fout, 2, c[1], t);
      break;
    }
    first = 1;
  }
  return 0;
}

/* calculate number of Gimp control points in this path */
static int npoints(curve_t *curve, int m) {
  int i;
  int n=0;

  for (i=0; i<m; i++) {
    switch (curve[i].tag) {
    case CORNER:
      n += 6;
      break;
    case CURVETO:
      n += 3;
      break;
    }
  }
  return n;
}

/* ---------------------------------------------------------------------- */
/* Backend. */

/* public interface for GIMPPATH */
int page_gimp(FILE *fout, path_t *plist, imginfo_t *imginfo) {
  path_t *p;
  int first = 1;
  int n;
  trans_t t;
  double si, co;

  /* determine number of points */
  n = 0;
  list_forall (p, plist) {
    n += npoints(p->fcurve, p->fm);
  }  

  si = sin(info.angle/180*M_PI);
  co = cos(info.angle/180*M_PI);

  t.ox = max(0, si*imginfo->pixheight) + max(0, -co*imginfo->pixwidth);
  t.oy = max(0, co*imginfo->pixheight) + max(0, si*imginfo->pixwidth);
  t.dxx = co;
  t.dxy = -si;
  t.dyx = -si;
  t.dyy = -co;

  /* header */
  fprintf(fout, "Name: Potrace Imported Path\n");
  fprintf(fout, "#POINTS: %d\n", n);
  fprintf(fout, "CLOSED: 1\n");
  fprintf(fout, "DRAW: 0\n");
  fprintf(fout, "STATE: 4\n");

  /* write paths */
  list_forall (p, plist) {
    gimppath_path(fout, p->fcurve, p->fm, first, t);
    first = 0;
  }
  fflush(fout);

  return 0;
}

