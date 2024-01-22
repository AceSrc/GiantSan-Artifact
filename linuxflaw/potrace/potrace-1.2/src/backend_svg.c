/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: backend_svg.c,v 1.5 2003/12/24 00:16:06 selinger Exp $ */

/* The SVG backend of potrace. */

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include <math.h>

#include "main.h"
#include "backend_svg.h"
#include "curve.h"
#include "lists.h"

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

/* ---------------------------------------------------------------------- */
/* path-drawing auxiliary functions */

/* coordinate quantization */
static point_t unit(dpoint_t p) {
  point_t q;

  q.x = (long)(floor(p.x*info.unit+.5));
  q.y = (long)(floor(p.y*info.unit+.5));
  return q;
}

static point_t cur;
static char lastop = 0;
static int column = 0;
static int newline = 1;

static void shiptoken(FILE *fout, char *token) {
  int c = strlen(token);
  if (!newline && column+c+1 > 75) {
    fprintf(fout, "\n");
    column = 0;
    newline = 1;
  } else if (!newline) {
    fprintf(fout, " ");
    column++;
  }
  fprintf(fout, "%s", token);
  column += c;
  newline = 0;
}

static void ship(FILE *fout, char *fmt, ...) {
  va_list args;
  static char buf[4096]; /* static string limit is okay here because
			    we only use constant format strings - for
			    the same reason, it is okay to use
			    vsprintf instead of vsnprintf below. */
  char *p, *q;

  va_start(args, fmt);
  vsprintf(buf, fmt, args);
  buf[4095] = 0;
  va_end(args);

  p = buf;
  while ((q = strchr(p, ' ')) != NULL) {
    *q = 0;
    shiptoken(fout, p);
    p = q+1;
  }
  shiptoken(fout, p);
}

static void svg_moveto(FILE *fout, dpoint_t p) {
  cur = unit(p);

  ship(fout, "M%ld %ld", cur.x, cur.y);
  lastop = 'M';
}

static void svg_rmoveto(FILE *fout, dpoint_t p) {
  point_t q;

  q = unit(p);
  ship(fout, "m%ld %ld", q.x-cur.x, q.y-cur.y);
  cur = q;
  lastop = 'm';
}

static void svg_lineto(FILE *fout, dpoint_t p) {
  point_t q;

  q = unit(p);

  if (lastop != 'l') {
    ship(fout, "l%ld %ld", q.x-cur.x, q.y-cur.y);
  } else {
    ship(fout, "%ld %ld", q.x-cur.x, q.y-cur.y);
  }
  cur = q;
  lastop = 'l';
}

static void svg_curveto(FILE *fout, dpoint_t p1, dpoint_t p2, dpoint_t p3) {
  point_t q1, q2, q3;

  q1 = unit(p1);
  q2 = unit(p2);
  q3 = unit(p3);

  if (lastop != 'c') {
    ship(fout, "c%ld %ld %ld %ld %ld %ld", q1.x-cur.x, q1.y-cur.y, q2.x-cur.x, q2.y-cur.y, q3.x-cur.x, q3.y-cur.y);
  } else {
    ship(fout, "%ld %ld %ld %ld %ld %ld", q1.x-cur.x, q1.y-cur.y, q2.x-cur.x, q2.y-cur.y, q3.x-cur.x, q3.y-cur.y);
  }
  cur = q3;
  lastop = 'c';
}

/* ---------------------------------------------------------------------- */
/* functions for converting a path to an SVG path element */

/* Explicit encoding. If abs is set, move to first coordinate
   absolutely. */
static int svg_path(FILE *fout, curve_t *curve, int m, int abs) {
  int i;
  dpoint_t *c;

  c = curve[m-1].c;
  if (abs) {
    svg_moveto(fout, c[2]);
  } else {
    svg_rmoveto(fout, c[2]);
  }

  for (i=0; i<m; i++) {
    c = curve[i].c;
    switch (curve[i].tag) {
    case CORNER:
      svg_lineto(fout, c[1]);
      svg_lineto(fout, c[2]);
      break;
    case CURVETO:
      svg_curveto(fout, c[0], c[1], c[2]);
      break;
    }
  }
  newline = 1;
  shiptoken(fout, "z");
  return 0;
}

/* produce a jaggy path - for debugging. If abs is set, move to first
   coordinate absolutely. If abs is not set, move to first coordinate
   relatively, and traverse path in the opposite direction. */
static int svg_jaggy_path(FILE *fout, point_t *pt, int n, int abs) {
  int i;
  point_t cur, prev;
  
  if (abs) {
    cur = prev = pt[n-1];
    svg_moveto(fout, dpoint(cur));
    for (i=0; i<n; i++) {
      if (pt[i].x != cur.x && pt[i].y != cur.y) {
	cur = prev;
	svg_lineto(fout, dpoint(cur));
      }
      prev = pt[i];
    }
    svg_lineto(fout, dpoint(pt[n-1]));
  } else {
    cur = prev = pt[0];
    svg_rmoveto(fout, dpoint(cur));
    for (i=n-1; i>=0; i--) {
      if (pt[i].x != cur.x && pt[i].y != cur.y) {
	cur = prev;
	svg_lineto(fout, dpoint(cur));
      }
      prev = pt[i];
    }
    svg_lineto(fout, dpoint(pt[0]));
  }
  newline = 1;
  shiptoken(fout, "z");
  return 0;
}

void write_paths_opaque(FILE *fout, path_t *tree) {
  path_t *p, *q;
  int c;

  for (p=tree; p; p=p->sibling) {
    if (info.group) {
      fprintf(fout, "<g>\n");
      fprintf(fout, "<g>\n");
    }
    c = fprintf(fout, "<path fill=\"#%06x\" stroke=\"none\" d=\"", info.color);
    column = c;
    newline = 1;
    lastop = 0;
    if (info.debug == 1) {
      svg_jaggy_path(fout, p->pt, p->len, 1);
    } else {
      svg_path(fout, p->fcurve, p->fm, 1);
    }
    fprintf(fout, "\"/>\n");
    for (q=p->childlist; q; q=q->sibling) {
      c = fprintf(fout, "<path fill=\"#%06x\" stroke=\"none\" d=\"", info.fillcolor);
      column = c;
      newline = 1;
      lastop = 0;
      if (info.debug == 1) {
	svg_jaggy_path(fout, q->pt, q->len, 1);
      } else {
	svg_path(fout, q->fcurve, q->fm, 1);
      }
      fprintf(fout, "\"/>\n");
    }
    if (info.group) {
      fprintf(fout, "</g>\n");
    }
    for (q=p->childlist; q; q=q->sibling) {
      write_paths_opaque(fout, q->childlist);
    }
    if (info.group) {
      fprintf(fout, "</g>\n");
    }
  }
}

void write_paths_transparent(FILE *fout, path_t *tree) {
  path_t *p, *q;
  int c;

  for (p=tree; p; p=p->sibling) {
    if (info.group) {
      fprintf(fout, "<g>\n");
    }
    c = fprintf(fout, "<path d=\"");
    column = c;
    newline = 1;
    lastop = 0;
    if (info.debug == 1) {
      svg_jaggy_path(fout, p->pt, p->len, 1);
    } else {
      svg_path(fout, p->fcurve, p->fm, 1);
    }
    for (q=p->childlist; q; q=q->sibling) {
      if (info.debug == 1) {
	svg_jaggy_path(fout, q->pt, q->len, 0);
      } else {
	svg_path(fout, q->fcurve, q->fm, 0);
      }
    }
    fprintf(fout, "\"/>\n");
    for (q=p->childlist; q; q=q->sibling) {
      write_paths_transparent(fout, q->childlist);
    }
    if (info.group) {
      fprintf(fout, "</g>\n");
    }
  }
}

/* ---------------------------------------------------------------------- */
/* Backend. */

/* public interface for SVG */
int page_svg(FILE *fout, path_t *plist, imginfo_t *imginfo) {

  int bboxx = (int)ceil(imginfo->trans.bb[0]+imginfo->lmar+imginfo->rmar);
  int bboxy = (int)ceil(imginfo->trans.bb[1]+imginfo->tmar+imginfo->bmar);
  double origx = imginfo->trans.orig[0] + imginfo->lmar;
  double origy = bboxy - imginfo->trans.orig[1] - imginfo->bmar;
  double scalex = imginfo->width / imginfo->pixwidth / info.unit;
  double scaley = -imginfo->height / imginfo->pixheight / info.unit;

  /* header */
  fprintf(fout, "<?xml version=\"1.0\" standalone=\"no\"?>\n");
  fprintf(fout, "<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 20010904//EN\"\n");
  fprintf(fout, " \"http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd\">\n");

  /* set bounding box and namespace */
  fprintf(fout, "<svg version=\"1.0\" xmlns=\"http://www.w3.org/2000/svg\"\n");
  fprintf(fout, " width=\"%dpt\" height=\"%dpt\" viewBox=\"0 0 %d %d\"\n", 
	  bboxx, bboxy, bboxx, bboxy);
  fprintf(fout, " preserveAspectRatio=\"xMidYMid meet\">\n");

  /* metadata: creator */
  fprintf(fout, "<metadata>\n");
  fprintf(fout, "Created by "POTRACE" "VERSION", written by Peter Selinger 2001-2003\n");
  fprintf(fout, "</metadata>\n");

  /* use a "group" tag to establish coordinate system and style */
  fprintf(fout, "<g transform=\"");
  if (origx != 0 || origy != 0) {
    fprintf(fout, "translate(%.0f,%.0f) ", origx, origy);
  }
  if (info.angle != 0) {
    fprintf(fout, "rotate(%.2f) ", -info.angle);
  }
  fprintf(fout, "scale(%f,%f)", scalex, scaley);
  fprintf(fout, "\"\n");
  fprintf(fout, "fill=\"#%06x\" stroke=\"none\">\n", info.color);

  if (info.opaque) {
    write_paths_opaque(fout, plist);
  } else {
    write_paths_transparent(fout, plist);
  }

  /* write footer */
  fprintf(fout, "</g>\n");
  fprintf(fout, "</svg>\n");
  fflush(fout);

  return 0;
}

