/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: path.c,v 1.16 2003/12/24 00:16:06 selinger Exp $ */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include "bitmap.h"
#include "curve.h"
#include "main.h"
#include "lists.h"

#define min(a,b) ((a)<(b) ? (a) : (b))

/* ---------------------------------------------------------------------- */
/* auxiliary functions */

/* return a "random" value which deterministically depends on x,y */
static int detrand(int x, int y) {
  srand(x+123456789*y);
  return rand();
}

/* return the "majority" value of bitmap bm at intersection (x,y). We
   assume that the bitmap is balanced at "radius" 1.  */
static int majority(bitmap_t *bm, int x, int y) {
  int i, a, ct;

  for (i=2; i<5; i++) { /* check at "radius" i */
    ct = 0;
    for (a=-i+1; a<=i-1; a++) {
      ct += BM_GET(bm, x+a, y+i-1) ? 1 : -1;
      ct += BM_GET(bm, x+i-1, y+a-1) ? 1 : -1;
      ct += BM_GET(bm, x+a-1, y-i) ? 1 : -1;
      ct += BM_GET(bm, x-i, y+a) ? 1 : -1;
    }
    if (ct>0) {
      return 1;
    } else if (ct<0) {
      return 0;
    }
  }
  return 0;
}

/* ---------------------------------------------------------------------- */
/* decompose image into paths */

/* a path is represented as an array of points, which are thought to
   lie on the corners of pixels (not on their centers). The path point
   (x,y) is the lower left corner of the pixel (x,y). Paths are
   represented by the len/pt components of a path_t object (which
   also stores other information about the path) */

/* xor the given pixmap with the interior of the given path. Note: the
   path must be within the dimensions of the pixmap. */
static void xor_path(bitmap_t *bm, path_t *p) {
  int xa, x, y, k, y1;

  if (p->len <= 0) {  /* a path of length 0 is silly, but legal */
    return;
  }

  y1 = p->pt[p->len-1].y;

  xa = bm_ref(p->pt[0].x);
  for (k=0; k<p->len; k++) {
    x = p->pt[k].x;
    y = p->pt[k].y;

    if (y != y1) {
      /* efficiently invert the rectangle [x,xa] x [y,y1] */
      bm_xor_to_ref(bm, x, min(y,y1), xa);
      y1 = y;
    }
  }
}

/* set the bounding box of the bitmap according to the dimensions of
   the path. The path is assumed to be of non-zero length. */
static void setbbox_path(bitmap_t *bm, path_t *p) {
  int x, y;
  int k;

  bm->y0 = bm->w;
  bm->y1 = 0;
  bm->x0 = bm->h;
  bm->x1 = 0;

  for (k=0; k<p->len; k++) {
    x = p->pt[k].x;
    y = p->pt[k].y;

    if (x < bm->x0) {
      bm->x0 = x;
    }
    if (x > bm->x1) {
      bm->x1 = x;
    }
    if (y < bm->y0) {
      bm->y0 = y;
    }
    if (y > bm->y1) {
      bm->y1 = y;
    }
  }
}

/* compute a path in the given pixmap, separating black from white.
   Start path at the point (x0,x1), which must be an upper left corner
   of the path. Also compute the area enclosed by the path. Return a
   new path_t object, or NULL on error (note that a legitimate path
   cannot have length 0). Sign is required for correct interpretation
   of turnpolicies. */
path_t *findpath(bitmap_t *bm, int x0, int y0, int sign) {
  int x, y, dirx, diry, len, size, area;
  int c, d, tmp;
  point_t *pt, *pt1;
  path_t *p = NULL;

  x = x0;
  y = y0;
  dirx = 0;
  diry = -1;

  len = size = 0;
  pt = NULL;
  area = 0;
  
  while (1) {
    /* add point to path */
    if (len>=size) {
      size+=100;
      pt1 = (point_t *)realloc(pt, size * sizeof(point_t));
      if (!pt1) {
	goto error;
      }
      pt = pt1;
    }
    pt[len].x = x;
    pt[len].y = y;
    len++;
    
    /* move to next point */
    x += dirx;
    y += diry;
    area += x*diry;
    
    /* path complete? */
    if (x==x0 && y==y0) {
      break;
    }
    
    /* determine next direction */
    c = BM_GET(bm, x + (dirx+diry-1)/2, y + (diry-dirx-1)/2);
    d = BM_GET(bm, x + (dirx-diry-1)/2, y + (diry+dirx-1)/2);
    
    if (c && !d) {               /* ambiguous turn */
      if (info.turnpolicy == POLICY_RIGHT
	  || (info.turnpolicy == POLICY_BLACK && sign == '+')
	  || (info.turnpolicy == POLICY_WHITE && sign == '-')
	  || (info.turnpolicy == POLICY_RANDOM && (detrand(x,y) & 1))
	  || (info.turnpolicy == POLICY_MAJORITY && majority(bm, x, y))
	  || (info.turnpolicy == POLICY_MINORITY && !majority(bm, x, y))) {
	tmp = dirx;              /* right turn */
	dirx = diry;
	diry = -tmp;
      } else {
	tmp = dirx;              /* left turn */
	dirx = -diry;
	diry = tmp;
      }
    } else if (c) {              /* right turn */
      tmp = dirx;
      dirx = diry;
      diry = -tmp;
    } else if (!d) {             /* left turn */
      tmp = dirx;
      dirx = -diry;
      diry = tmp;
    }
  } /* while this path */

  /* allocate new path object */
  p = path_new();
  if (!p) {
    goto error;
  }

  p->pt = pt;
  p->len = len;
  p->area = area;
  p->sign = sign;

  return p;
 
 error:
   free(pt);
   return NULL; 
}

/* Give a tree structure to the given path list, based on "insideness"
   testing. I.e., path A is considered "below" path B if it is inside
   path B. The input pathlist is assumed to be ordered so that "outer"
   paths occur before "inner" paths. The tree structure is stored in
   the "childlist" and "sibling" components of the path_t
   structure. The linked list structure is also changed so that
   negative path components are listed immediately after their
   positive parent.  Note: some backends may ignore the tree
   structure, others may use it e.g. to group path components. We
   assume that in the input, point 0 of each path is an "upper left"
   corner of the path, as returned by bm_to_pathlist. This makes it
   easy to find an "interior" point. The mask argument should be a
   bitmap of the correct size (large enough to hold all the paths),
   and will be used as scratch space. Return 0 on success or -1 on
   error with errno set. */

static void pathlist_to_tree(path_t *plist, bitmap_t *mask) {
  path_t *p, *p1;
  path_t *heap, *heap1;
  path_t *cur;
  path_t *head;
  path_t **hook;  /* used to speed up appending to linked list */

  bm_clear(mask, 0);

  /* save original "next" pointers */
  list_forall(p, plist) {
    p->sibling = p->next;
    p->childlist = NULL;
  }
  
  heap = plist;

  /* the heap holds a list of lists of paths. Use "childlist" field
     for outer list, "next" field for inner list. Each of the sublists
     is to be turned into a tree. This code is messy, but it is
     actually fast. Each path is rendered exactly once. We use the
     heap to get a tail recursive algorithm: the heap hold a list of
     pathlists which still need to be transformed. */

  while (heap) {
    /* unlink first sublist */
    cur = heap;
    heap = heap->childlist;
    cur->childlist = NULL;
  
    /* unlink first path */
    head = cur;
    cur = cur->next;
    head->next = NULL;

    /* render path */
    xor_path(mask, head);
    setbbox_path(mask, head);

    /* now do insideness test for each element of cur; append it to
       head->childlist if it's inside head, else append it to
       head->next. */
    list_forall_unlink(p, cur) {
      if (BM_GET(mask, p->pt[0].x, p->pt[0].y-1)) {
	list_append(path_t, head->childlist, p);
      } else {
	list_append(path_t, head->next, p);
      }
    }

    /* clear mask */
    bm_clear_mask(mask);

    /* now schedule head->childlist and head->next for further
       processing */
    if (head->next) {
      head->next->childlist = heap;
      heap = head->next;
    }
    if (head->childlist) {
      head->childlist->childlist = heap;
      heap = head->childlist;
    }
  }
  
  /* copy sibling structure from "next" to "sibling" component */
  p = plist;
  while (p) {
    p1 = p->sibling;
    p->sibling = p->next;
    p = p1;
  }

  /* reconstruct a new linked list ("next") structure from tree
     ("childlist", "sibling") structure. This code is slightly messy,
     because we use a heap to make it tail recursive: the heap
     contains a list of childlists which still need to be
     processed. */
  heap = plist;
  heap->next = NULL;  /* heap is a linked list of childlists */
  plist = NULL;
  hook = &plist;
  while (heap) {
    heap1 = heap->next;
    for (p=heap; p; p=p->sibling) {
      /* p is a positive path */
      /* append to linked list */
      list_insert_athook(p, hook);
      hook=&(*hook)->next;
      
      /* go through its children */
      for (p1=p->childlist; p1; p1=p1->sibling) {
	/* append to linked list */
	list_insert_athook(p1, hook);
	hook=&(*hook)->next;
	/* append its childlist to heap, if non-empty */
	if (p1->childlist) {
	  list_append(path_t, heap1, p1->childlist);
	}
      }
    }
    heap = heap1;
  }

  return;
}

/* Decompose the given bitmap into paths. Returns a linked list of
   path_t objects with the fields len, pt, area, sign filled
   in. Returns 0 on success with plistp set, or -1 on error with errno
   set. */

int bm_to_pathlist(bitmap_t *bm, path_t **plistp) {
  int x;
  int y;
  path_t *p;
  path_t *plist = NULL;  /* linked list of path objects */
  path_t **hook = &plist;  /* used to speed up appending to linked list */
  int errno_save;
  bitmap_t *bm1 = NULL;
  int sign;

  /* be sure the byte padding on the right is set to 0, as the fast
     pixel search below relies on it */
  bm_clearexcess(bm);

  bm1 = bm_dup(bm);
  if (!bm1) {
    goto error;
  }

  /* iterate through components */
  y = bm1->h - 1;
  while (bm_findnext(bm1, &x, &y) == 0) { 
    /* calculate the sign by looking at the original */
    sign = BM_GET(bm, x, y) ? '+' : '-';

    /* calculate the path */
    p = findpath(bm1, x, y+1, sign);
    if (p==NULL) {
      goto error;
    }

    /* update buffered image */
    xor_path(bm1, p);

    /* if it's a turd, eliminate it, else append it to the list */
    if (p->area <= info.turdsize) {
      path_free(p);
    } else {
      list_insert_athook(p, hook);
      hook=&(*hook)->next;
    }
  }

  pathlist_to_tree(plist, bm1);
  bm_free(bm1);
  *plistp = plist;

  return 0;

 error:
  errno_save = errno;
  bm_free(bm1);
  list_forall_unlink(p, plist) {
    path_free(p);
  }
  errno = errno_save;
  return -1;
}
