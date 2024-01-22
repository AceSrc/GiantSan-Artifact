/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: curve.h,v 1.10 2003/12/24 00:16:06 selinger Exp $ */

#ifndef CURVE_H
#define CURVE_H

struct dpoint_s {
  double x;
  double y;
};
typedef struct dpoint_s dpoint_t;

struct point_s {
  long x;
  long y;
};
typedef struct point_s point_t;

#define CORNER 1
#define CURVETO 2

/* vertex is c[1] for tag=CORNER, and the intersection of
   [-1].c[2]..c[0] and c[1]..c[2] for tag=CURVETO. alpha is only
   defined for tag=CURVETO and is the alpha parameter of the curve:
   [-1].c[2]..c[0] = alpha*([-1].c[2]..vertex), and
   c[2]..c[1] = alpha*(c[2]..vertex).
   Beta is so that ([i].beta)[[i].vertex,[i+1].vertex] = [i].c[2].
*/

struct curve_s {
  int tag;  /* CORNER c[1..2], CURVETO c[0..2] */
  dpoint_t c[3];
  dpoint_t vertex;  /* for tag=CORNER, this equals c[1] */
  double alpha;     /* only for tag=CURVETO */
  double alpha0;    /* "uncropped" alpha parameter - for debug output only */
  double beta;
};
typedef struct curve_s curve_t;

/* the path structure is filled in with information about a given path
   as it is accumulated and passed through the different stages of the
   potrace algorithm. Backends only need to read the fcurve and fm
   fields of this data structure, but debugging backends may read
   other fields. */
struct path_s {
  int len;
  point_t *pt;     /* pt[len]: path as extracted from bitmap */
  int area;        /* area of the bitmap path */
  int sign;        /* sign of the path: '+' or '-' */

  int *lon;        /* lon[len]: (i,lon[i]) = longest straight line from i */

  int x0, y0;      /* origin for sums */
  long *sumx2;     /* sumx2[len+1]: cache for fast summing */
  long *sumxy;
  long *sumy2;
  long *sumx;
  long *sumy;

  int m;           /* length of optimal polygon */
  int *po;         /* po[m]: optimal polygon */
  curve_t *curve;  /* curve[m]: array of curve elements */

  int *conv;       /* conv[m]: pre-computed convexities */
  double *areac;   /* cumarea[m+1]: cache for fast area computation */

  int om;          /* length of optimal opticurve */
  curve_t *ocurve; /* ocurve[om]: array of curve elements */

  int fm;          /* length of the final curve; this is either m or om */
  curve_t *fcurve; /* final curve: this is either curve or ocurve. Do not
		      free this value separately! */

  struct path_s *childlist;  /* tree structure */
  struct path_s *sibling;    /* tree structure */
  struct path_s *next;       /* linked list structure */
};
typedef struct path_s path_t;  

path_t *path_new(void);
void path_free(path_t *p);
void pathlist_free(path_t *plist);

dpoint_t dpoint(point_t p);

#define mod(a,n) ((a)>=(n) ? (a)%(n) : (a)>=0 ? (a) : (n)-1-(-1-(a))%(n))
dpoint_t interval(double lambda, dpoint_t a, dpoint_t b);

int process_path(path_t *plist);



#endif /* CURVE_H */
