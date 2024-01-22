/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: bitmap.h,v 1.5 2003/12/24 00:16:06 selinger Exp $ */

#ifndef PBM_H
#define PBM_H

#include <stdio.h>

typedef unsigned long bm_word;  /* take advantage of 64-bit architectures */
#define BM_WORDSIZE ((int)sizeof(bm_word))
#define BM_WORDBITS (8*BM_WORDSIZE)
#define BM_HIBIT (((bm_word)1)<<(BM_WORDBITS-1))
#define BM_ALLBITS (~(bm_word)0)

/* internal format for bitmaps. Note: in this format, rows are ordered
   from bottom to top. The bits in each row are divided into words
   from left to right, with the highest-valued bits on the left. A
   "mask" is a special bitmap which also has its bounding box set. For
   a mask, all non-zero pixels must be within the rectangle x0<=x<x1,
   x0<=y<y1. There is no built-in support for creating masks, so the
   bounding box must be set correctly by the application. Functions
   that expect masks have "mask" in their name. */

struct bitmap_s {
  int w;                 /* width, in pixels */
  int h;                 /* height, in pixels */
  int c;                 /* ceil(w/BM_WORDBITS) = words per row */
  int x0, x1, y0, y1;    /* optional bounding box */
  bm_word *map;          /* raw data, c*h words */
};
typedef struct bitmap_s bitmap_t;

/* macros for accessing pixel at index (x,y). Note that the origin is
   in the *lower* left corner. U* macros omit the bounds check. */

#define bm_ref(x) ((x) & -BM_WORDBITS)
#define bm_index(bm, x, y) (&(bm)->map[(x)/BM_WORDBITS+(y)*(bm)->c])
#define bm_mask(x) (BM_HIBIT>>((x)%BM_WORDBITS))
#define bm_safe(bm, x, y) ((x)>=0 && (int)(x)<(bm)->w && (y)>=0 && (int)(y)<(bm)->h)
#define BM_UGET(bm, x, y) ((*bm_index(bm, x, y) & bm_mask(x))!=0)
#define BM_USET(bm, x, y) (*bm_index(bm, x, y) |= bm_mask(x))
#define BM_UCLR(bm, x, y) (*bm_index(bm, x, y) &= ~bm_mask(x))
#define BM_UINV(bm, x, y) (*bm_index(bm, x, y) ^= bm_mask(x))
#define BM_UPUT(bm, x, y, b) ((b) ? BM_USET(bm, x, y) : BM_UCLR(bm, x, y))
#define BM_GET(bm, x, y) (bm_safe(bm, x, y) ? BM_UGET(bm, x, y) : 0)
#define BM_SET(bm, x, y) (bm_safe(bm, x, y) ? BM_USET(bm, x, y) : 0)
#define BM_CLR(bm, x, y) (bm_safe(bm, x, y) ? BM_UCLR(bm, x, y) : 0)
#define BM_INV(bm, x, y) (bm_safe(bm, x, y) ? BM_UINV(bm, x, y) : 0)
#define BM_PUT(bm, x, y, b) (bm_safe(bm, x, y) ? BM_UPUT(bm, x, y, b) : 0)

extern char *bm_read_error;

bitmap_t *bm_new(int w, int h);
bitmap_t *bm_dup(bitmap_t *bm);
void bm_free(bitmap_t *bm);
void bm_clear(bitmap_t *bm, int c);
void bm_invert(bitmap_t *bm);
void bm_clearexcess(bitmap_t *bm);
void bm_xor_to_ref(bitmap_t *bm, int x, int y, int xa);
int bm_findnext(bitmap_t *bm, int *xp, int *yp);
void bm_clear_mask(bitmap_t *mask);
int bm_read(FILE *f, double blacklevel, bitmap_t **bmp);
void bm_writepbm(FILE *f, bitmap_t *bm);
int bm_print(FILE *f, bitmap_t *bm);

#endif /* PBM_H */

