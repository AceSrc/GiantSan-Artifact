/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: curve.c,v 1.22 2003/09/19 04:32:43 selinger Exp $ */
/* transform jaggy paths into smooth curves */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#include "main.h"
#include "backend_eps.h"
#include "lists.h"

#define INFTY 10000000	/* it suffices that this is longer than any
			   path; it need not be really infinite */
#define COS179 -0.999847695156	 /* the cosine of 179 degrees */

/* ---------------------------------------------------------------------- */
/* some useful macros. Note: the "mod" macro works correctly for
   negative a. Also note that the test for a>=n, while redundant,
   speeds up the mod function by 70% in the average case (significant
   since the program spends about 16% of its time here - or 40%
   without the test). The "floordiv" macro returns the largest integer
   <= a/n, and again this works correctly for negative a, as long as
   a,n are integers and n>0. */

#define sign(x) ((x)>0 ? 1 : (x)<0 ? -1 : 0)
#define sq(a) ((a)*(a))
#define mod(a,n) ((a)>=(n) ? (a)%(n) : (a)>=0 ? (a) : (n)-1-(-1-(a))%(n))
#define min(a,b) ((a)<(b) ? (a) : (b))
#define floordiv(a,n) ((a)>=0 ? (a)/(n) : -1-(-1-(a))/(n))

#define SAFE_MALLOC(var, n, typ) \
  if ((var = (typ *)malloc((n)*sizeof(typ))) == NULL) goto malloc_error 

#define TRY(x) if (x) goto try_error

/* ---------------------------------------------------------------------- */
/* allocate and free path objects */

path_t *path_new(void) {
  path_t *p;

  SAFE_MALLOC(p, 1, path_t);
  memset(p, 0, sizeof(path_t));
  return p;

 malloc_error:
  return NULL;
}

void path_free(path_t *p) {
  if (p) {
    free(p->pt);
    free(p->lon);
    free(p->sumx2);
    free(p->sumxy);
    free(p->sumy2);
    free(p->sumx);
    free(p->sumy);
    free(p->po);
    free(p->curve);
    free(p->conv);
    free(p->areac);
    free(p->ocurve);
    /* do not free p->fcurve ! */
  }
  free(p);
}  

void pathlist_free(path_t *plist) {
  path_t *p;

  list_forall_unlink(p, plist) {
    path_free(p);
  }
}

/* ---------------------------------------------------------------------- */
/* auxiliary functions */

/* convert point_t to dpoint_t */
dpoint_t dpoint(point_t p) {
  dpoint_t res;
  res.x = p.x;
  res.y = p.y;
  return res;
}

/* return a direction that is 90 degrees counterclockwise from p2-p0,
   but then restricted to one of the major wind directions (n, nw, w, etc) */
static point_t dorth_infty(dpoint_t p0, dpoint_t p2) {
  point_t r;
  
  r.y = sign(p2.x-p0.x);
  r.x = -sign(p2.y-p0.y);

  return r;
}

/* return (p1-p0)x(p2-p0), the area of the parallelogram */
static double dpara(dpoint_t p0, dpoint_t p1, dpoint_t p2) {
  double x1, y1, x2, y2;

  x1 = p1.x-p0.x;
  y1 = p1.y-p0.y;
  x2 = p2.x-p0.x;
  y2 = p2.y-p0.y;

  return x1*y2 - x2*y1;
}

/* ddenom/dpara have the property that the square of radius 1 centered
   at p1 intersects the line p0p2 iff |dpara(p0,p1,p2)| <= ddenom(p0,p2) */
static double ddenom(dpoint_t p0, dpoint_t p2) {
  point_t r = dorth_infty(p0, p2);

  return r.y*(p2.x-p0.x) - r.x*(p2.y-p0.y);
}

/* return 1 if a <= b < c < a, in a cyclic sense (mod n) */
static int cyclic(int a, int b, int c) {
  if (a<=c) {
    return (a<=b && b<c);
  } else {
    return (a<=b || b<c);
  }
}

/* range over the straight line segment [a,b] when lambda ranges over [0,1] */
dpoint_t interval(double lambda, dpoint_t a, dpoint_t b) {
  dpoint_t res;

  res.x = a.x + lambda * (b.x - a.x);
  res.y = a.y + lambda * (b.y - a.y);
  return res;
}

/* determine the center and slope of the line i..j. Assume i<j. Needs
   "sum" components of p to be set. */
static void pointslope(path_t *p, int i, int j, dpoint_t *ctr, dpoint_t *dir) {
  /* assume i<j */

  int n = p->len;
  long *sumx = p->sumx;
  long *sumy = p->sumy;
  long *sumx2 = p->sumx2;
  long *sumxy = p->sumxy;
  long *sumy2 = p->sumy2;

  long int x, y, x2, xy, y2;
  double k;
  double a, b, c, lambda2, l;
  int r=0; /* rotations from i to j */

  while (j>=n) {
    j-=n;
    r+=1;
  }
  while (i>=n) {
    i-=n;
    r-=1;
  }
  while (j<0) {
    j+=n;
    r-=1;
  }
  while (i<0) {
    i+=n;
    r+=1;
  }
  
  x = sumx[j+1]-sumx[i]+r*sumx[n];
  y = sumy[j+1]-sumy[i]+r*sumy[n];
  x2 = sumx2[j+1]-sumx2[i]+r*sumx2[n];
  xy = sumxy[j+1]-sumxy[i]+r*sumxy[n];
  y2 = sumy2[j+1]-sumy2[i]+r*sumy2[n];
  k = j+1-i+r*n;
  
  ctr->x = x/k;
  ctr->y = y/k;

  a = (x2-(double)x*x/k)/k;
  b = (xy-(double)x*y/k)/k;
  c = (y2-(double)y*y/k)/k;
  
  lambda2 = (a+c+sqrt((a-c)*(a-c)+4*b*b))/2; /* larger e.value */

  /* now find e.vector for lambda2 */
  a -= lambda2;
  c -= lambda2;

  if (fabs(a) >= fabs(c)) {
    l = sqrt(a*a+b*b);
    if (l!=0) {
      dir->x = -b/l;
      dir->y = a/l;
    }
  } else {
    l = sqrt(c*c+b*b);
    if (l!=0) {
      dir->x = -c/l;
      dir->y = b/l;
    }
  }
  if (l==0) {
    dir->x = dir->y = 0;   /* sometimes this can happen when k=4:
			      the two eigenvalues coincide */
  }
}

/* the type of (affine) quadratic forms, represented as symmetric 3x3
   matrices.  The value of the quadratic form at a vector (x,y) is v^t
   Q v, where v = (x,y,1)^t. */
typedef double quadform_t[3][3];

/* Apply quadratic form Q to vector w = (w.x,w.y) */
static double quadform(quadform_t Q, dpoint_t w) {
  double v[3];
  int i, j;
  double sum;

  v[0] = w.x;
  v[1] = w.y;
  v[2] = 1;
  sum = 0.0;

  for (i=0; i<3; i++) {
    for (j=0; j<3; j++) {
      sum += v[i] * Q[i][j] * v[j];
    }
  }
  return sum;
}

/* calculate p1 x p2 */
static int xprod(point_t p1, point_t p2) {
  return p1.x*p2.y - p1.y*p2.x;
}

/* calculate (p1-p0)x(p3-p2) */
static double cprod(dpoint_t p0, dpoint_t p1, dpoint_t p2, dpoint_t p3) {
  double x1, y1, x2, y2;

  x1 = p1.x - p0.x;
  y1 = p1.y - p0.y;
  x2 = p3.x - p2.x;
  y2 = p3.y - p2.y;

  return x1*y2 - x2*y1;
}

/* calculate (p1-p0)*(p2-p0) */
static double iprod(dpoint_t p0, dpoint_t p1, dpoint_t p2) {
  double x1, y1, x2, y2;

  x1 = p1.x - p0.x;
  y1 = p1.y - p0.y;
  x2 = p2.x - p0.x;
  y2 = p2.y - p0.y;

  return x1*x2 + y1*y2;
}

/* calculate (p1-p0)*(p3-p2) */
static double iprod1(dpoint_t p0, dpoint_t p1, dpoint_t p2, dpoint_t p3) {
  double x1, y1, x2, y2;

  x1 = p1.x - p0.x;
  y1 = p1.y - p0.y;
  x2 = p3.x - p2.x;
  y2 = p3.y - p2.y;

  return x1*x2 + y1*y2;
}

/* calculate distance between two points */
static double ddist(dpoint_t p, dpoint_t q) {
  return sqrt(sq(p.x-q.x)+sq(p.y-q.y));
}

/* calculate point of a bezier curve */
static dpoint_t bezier(double t, dpoint_t p0, dpoint_t p1, dpoint_t p2, dpoint_t p3) {
  double s = 1-t;
  dpoint_t res;

  res.x = s*s*s*p0.x + 3*s*s*t*p1.x + 3*s*t*t*p2.x + t*t*t*p3.x;
  res.y = s*s*s*p0.y + 3*s*s*t*p1.y + 3*s*t*t*p2.y + t*t*t*p3.y;
  return res;
}

/* calculate the point t in [0..1] on the (convex) bezier curve
   (p0,p1,p2,p3) which is tangent to q1-q0. Return -1.0 if there is no
   solution in [0..1]. */
static double tangent(dpoint_t p0, dpoint_t p1, dpoint_t p2, dpoint_t p3, dpoint_t q0, dpoint_t q1) {
  double A, B, C;   /* (1-t)^2 A + 2(1-t)t B + t^2 C = 0 */
  double a, b, c;   /* a t^2 + b t + c = 0 */
  double d, s, r1, r2;

  A = cprod(p0, p1, q0, q1);
  B = cprod(p1, p2, q0, q1);
  C = cprod(p2, p3, q0, q1);

  a = A - 2*B + C;
  b = -2*A + 2*B;
  c = A;
  
  d = b*b - 4*a*c;

  if (a==0 || d<0) {
    return -1.0;
  }

  s = sqrt(d);

  r1 = (-b + s) / (2 * a);
  r2 = (-b - s) / (2 * a);

  if (r1 >= 0 && r1 <= 1) {
    return r1;
  } else if (r2 >= 0 && r2 <= 1) {
    return r2;
  } else {
    return -1.0;
  }
}

/* ---------------------------------------------------------------------- */
/* Preparation: fill in the sum* fields of a path (used for later
   rapid summing). Return 0 on success, 1 with errno set on
   failure. */
static int calc_sums(path_t *p) {
  int i, x, y;
  int n = p->len;

  SAFE_MALLOC(p->sumx2, p->len+1, long);
  SAFE_MALLOC(p->sumxy, p->len+1, long);
  SAFE_MALLOC(p->sumy2, p->len+1, long);
  SAFE_MALLOC(p->sumx, p->len+1, long);
  SAFE_MALLOC(p->sumy, p->len+1, long);

  /* origin */
  p->x0 = p->pt[0].x;
  p->y0 = p->pt[0].y;

  /* preparatory computation for later fast summing */
  p->sumx2[0] = p->sumxy[0] = p->sumy2[0] = p->sumx[0] = p->sumy[0] = 0;
  for (i=0; i<n; i++) {
    x = p->pt[i].x - p->x0;
    y = p->pt[i].y - p->y0;
    p->sumx[i+1] = p->sumx[i] + x;
    p->sumy[i+1] = p->sumy[i] + y;
    p->sumx2[i+1] = p->sumx2[i] + x*x;
    p->sumxy[i+1] = p->sumxy[i] + x*y;
    p->sumy2[i+1] = p->sumy2[i] + y*y;
  }
  return 0;  

 malloc_error:
  return 1;
}

/* ---------------------------------------------------------------------- */
/* Stage 1: determine the straight subpaths (Sec. 2.2.1). Fill in the
   "lon" component of a path object (based on pt/len).	For each i,
   lon[i] is the furthest index such that a straight line can be drawn
   from i to lon[i]. Return 1 on error with errno set, else 0. */

/* this algorithm depends on the fact that the existence of straight
   subpaths is a triplewise property. I.e., there exists a straight
   line through squares i0,...,in iff there exists a straight line
   through i,j,k, for all i0<=i<j<k<=in. (Proof?) */

/* this implementation of calc_lon is O(n^2). It replaces an older
   O(n^3) version. A "constraint" means that future points must
   satisfy xprod(constraint[0], cur) >= 0 and xprod(constraint[1],
   cur) <= 0. */

/* Remark for potrace 1.1: the current implementation of calc_lon is
   more complex than the implementation found in potrace 1.0, but it
   is considerably faster. The introduction of the "nc" data structure
   means that we only have to test the constraints for "corner"
   points. On a typical input file, this speeds up the calc_lon
   function by a factor of 31.2, thereby decreasing its time share
   within the overall potrace algorithm from 72.6% to 7.82%, and
   speeding up the overall algorithm by a factor of 3.36. On another
   input file, calc_lon was sped up by a factor of 6.7, decreasing its
   time share from 51.4% to 13.61%, and speeding up the overall
   algorithm by a factor of 1.78. In any case, the savings are
   substantial. */

static int calc_lon(path_t *p) {
  point_t *pt = p->pt;
  int n = p->len;
  int i, j, k, k1;
  int ct[4], dir;
  point_t constraint[2];
  point_t cur;
  point_t off;
  int *pivk = NULL;  /* pivk[n] */
  int *nc = NULL;    /* nc[n]: next corner */
  point_t dk;  /* direction of k-k1 */
  int a, b, c, d;

  SAFE_MALLOC(pivk, n, int);
  SAFE_MALLOC(nc, n, int);

  /* initialize the nc data structure. Point from each point to the
     furthest future point to which it is connected by a vertical or
     horizontal segment. We take advantage of the fact that there is
     always a direction change at 0 (due to the path decomposition
     algorithm). But even if this were not so, there is not harm, as
     in practice, correctness does not depend on the word "furthest"
     above.  */
  k = 0;
  for (i=n-1; i>=0; i--) {
    if (pt[i].x != pt[k].x && pt[i].y != pt[k].y) {
      k = i+1;  /* necessarily i<n-1 in this case */
    }
    nc[i] = k;
  }

  SAFE_MALLOC(p->lon, n, int);

  /* determine pivot points: for each i, let pivk[i] be the furthest k
     such that all j with i<j<k lie on a line connecting i,k. */
  
  for (i=n-1; i>=0; i--) {
    ct[0] = ct[1] = ct[2] = ct[3] = 0;

    /* keep track of "directions" that have occurred */
    dir = (3+3*(pt[mod(i+1,n)].x-pt[i].x)+(pt[mod(i+1,n)].y-pt[i].y))/2;
    ct[dir]++;

    constraint[0].x = 0;
    constraint[0].y = 0;
    constraint[1].x = 0;
    constraint[1].y = 0;

    /* find the next k such that no straight line from i to k */
    k = nc[i];
    k1 = i;
    while (1) {
      
      dir = (3+3*sign(pt[k].x-pt[k1].x)+sign(pt[k].y-pt[k1].y))/2;
      ct[dir]++;

      /* if all four "directions" have occurred, cut this path */
      if (ct[0] && ct[1] && ct[2] && ct[3]) {
	pivk[i] = k1;
	goto foundk;
      }

      cur.x = pt[k].x - pt[i].x;
      cur.y = pt[k].y - pt[i].y;

      /* see if current constraint is violated */
      if (xprod(constraint[0], cur) < 0 || xprod(constraint[1], cur) > 0) {
	goto constraint_viol;
      }

      /* else, update constraint */
      if (abs(cur.x) <= 1 && abs(cur.y) <= 1) {
	/* no constraint */
      } else {
	off.x = cur.x + ((cur.y>=0 && (cur.y>0 || cur.x<0)) ? 1 : -1);
	off.y = cur.y + ((cur.x<=0 && (cur.x<0 || cur.y<0)) ? 1 : -1);
	if (xprod(constraint[0], off) >= 0) {
	  constraint[0] = off;
	}
	off.x = cur.x + ((cur.y<=0 && (cur.y<0 || cur.x<0)) ? 1 : -1);
	off.y = cur.y + ((cur.x>=0 && (cur.x>0 || cur.y<0)) ? 1 : -1);
	if (xprod(constraint[1], off) <= 0) {
	  constraint[1] = off;
	}
      }	
      k1 = k;
      k = nc[k1];
      if (!cyclic(k,i,k1)) {
	break;
      }
    }
  constraint_viol:
    /* k1 was the last "corner" satisfying the current constraint, and
       k is the first one violating it. We now need to find the last
       point along k1..k which satisfied the constraint. */
    dk.x = sign(pt[k].x-pt[k1].x);
    dk.y = sign(pt[k].y-pt[k1].y);
    cur.x = pt[k1].x - pt[i].x;
    cur.y = pt[k1].y - pt[i].y;
    /* find largest integer j such that xprod(constraint[0], cur+j*dk)
       >= 0 and xprod(constraint[1], cur+j*dk) <= 0. Use bilinearity
       of xprod. */
    a = xprod(constraint[0], cur);
    b = xprod(constraint[0], dk);
    c = xprod(constraint[1], cur);
    d = xprod(constraint[1], dk);
    /* find largest integer j such that a+j*b>=0 and c+j*d<=0. This
       can be solved with integer arithmetic. */
    j = INFTY;
    if (b<0) {
      j = floordiv(a,-b);
    }
    if (d>0) {
      j = min(j, floordiv(-c,d));
    }
    pivk[i] = mod(k1+j,n);
  foundk:
    ;
  } /* for i */

  /* clean up: for each i, let lon[i] be the largest k such that for
     all i' with i<=i'<k, i'<k<=pivk[i']. */

  j=pivk[n-1];
  p->lon[n-1]=j;
  for (i=n-2; i>=0; i--) {
    if (cyclic(i+1,pivk[i],j)) {
      j=pivk[i];
    }
    p->lon[i]=j;
  }

  for (i=n-1; cyclic(mod(i+1,n),j,p->lon[i]); i--) {
    p->lon[i] = j;
  }

  free(pivk);
  free(nc);
  return 0;

 malloc_error:
  free(pivk);
  free(nc);
  return 1;
}


/* ---------------------------------------------------------------------- */
/* Stage 2: calculate the optimal polygon (Sec. 2.2.2-2.2.4). */ 

/* Auxiliary function: calculate the penalty of an edge from i to j in
   the given path. This needs the "lon" and "sum*" data. */

static double penalty3(path_t *p, int i, int j) {
  int n = p->len;
  point_t *pt = p->pt;
  long *sumx = p->sumx;
  long *sumy = p->sumy;
  long *sumx2 = p->sumx2;
  long *sumxy = p->sumxy;
  long *sumy2 = p->sumy2;

  /* assume 0<=i<j<=n  */
  long int x, y, x2, xy, y2;
  double k;
  double a, b, c, s;
  double px, py, ex, ey;

  int r=0; /* rotations from i to j */

  if (j>=n) {
    j-=n;
    r+=1;
  }
  
  x = sumx[j+1]-sumx[i]+r*sumx[n];
  y = sumy[j+1]-sumy[i]+r*sumy[n];
  x2 = sumx2[j+1]-sumx2[i]+r*sumx2[n];
  xy = sumxy[j+1]-sumxy[i]+r*sumxy[n];
  y2 = sumy2[j+1]-sumy2[i]+r*sumy2[n];
  k = j+1-i+r*n;
  
  px = (pt[i].x+pt[j].x)/2.0-pt[0].x;
  py = (pt[i].y+pt[j].y)/2.0-pt[0].y;
  ey = (pt[j].x-pt[i].x);
  ex = -(pt[j].y-pt[i].y);

  a = ((x2-2*x*px)/k+px*px);
  b = ((xy-x*py-y*px)/k+px*py);
  c = ((y2-2*y*py)/k+py*py);
  
  s = ex*ex*a + 2*ex*ey*b + ey*ey*c;

  return sqrt(s);
}

/* find the optimal polygon. Fill in the m and po components. Return 1
   on failure with errno set, else 0. */
static int bestpolygon(path_t *p)
{
  int i, j, m, k;
  int n = p->len;
  int *len = NULL;    /* len[n+1]: path length vector */
  double *pen = NULL; /* pen[n+1]: penalty vector */
  int *prev = NULL;   /* prev[n+1]: best path pointer vector */
  int *clip = NULL;   /* clip[n] */
  double thispen;	   
  double best;

  SAFE_MALLOC(len, n+1, int);
  SAFE_MALLOC(pen, n+1, double);
  SAFE_MALLOC(prev, n+1, int);
  SAFE_MALLOC(clip, n, int);
  
  /* calculate clipped paths */
  for (i=0; i<n; i++) {
    clip[i] = mod(p->lon[mod(i-1,n)]-1,n);
    if (clip[i] == i) {
      clip[i] = i+1;
    }
  }

  /* now find the shortest roundtrip based on penalty3 */
  
  /* for simplicity, assume that i=0 is in the roundtrip. ### this is a bug */
  /* calculate shortest distance 0..i for any i. Remember shortest
     number of segments in len[], best penalty in pen[], and closest j
     in prev[] */
  len[0]=0;
  pen[0]=0;
  for (i=1; i<=n; i++) {
    len[i] = INFTY;
    for (j=i-1; j>=0; j--) {
      if (cyclic(j,clip[j],mod(i,n))) {
	break;
      }
      if (len[j] + 1 < len[i]) {
	len[i] = len[j] + 1;
      }
    }
    /* Note: profiling shows that the penalty3/bestpolygon functions
       are an important bottle neck of potrace. Therefore, the
       following optimization is worthwhile and speeds up the entire
       program by a factor of about 2.7. We optimize the penalties
       separately from the path lengths, in two separate inner loops,
       for each i. This cuts down the number of times the penalty3
       function is called by a factor of up to 7. In addition, this
       makes the bestpolygon function about 3 times faster. Before the
       optimization, the potrace program used to spend about 54.6% of
       its time in the penalty3 function and 23.7% in the bestpolygon
       function; with this optimization these numbers are down to
       20.8% and 20.7%. */
    best = -1;
    for (k=i-1; k>=j+1; k--) {
      if (len[k]+1 == len[i]) {
	thispen = penalty3(p, k, i) + pen[k];
	if (best < 0 || thispen < best) {
	  prev[i] = k;
	  best = thispen;
	}
      }
    }
    pen[i] = best;
  }

  /* calculate length of shortest path */
  m = 0;
  for (i=n; i>0; i=prev[i]) {
    m++;
  }

  p->m = m;
  SAFE_MALLOC(p->po, m, int);

  /* read off shortest path */
  for (i=n, j=m-1; i>0; j--) {
    i = prev[i];
    p->po[j] = i;
  }

  free(len);
  free(pen);
  free(prev);
  free(clip);
  return 0;
  
 malloc_error:
  free(len);
  free(pen);
  free(prev);
  free(clip);
  return 1;
}

/* ---------------------------------------------------------------------- */
/* Stage 3: vertex adjustment (Sec. 2.3.1). */

/* Adjust vertices of optimal polygon: calculate the intersection of
   the two "optimal" line segments, then move it into the unit square
   if it lies outside. Return 1 with errno set on error; 0 on
   success. */

static int adjust_vertices(path_t *p) {
  int m = p->m;
  int *po = p->po;
  int n = p->len;
  point_t *pt = p->pt;
  int x0 = p->x0;
  int y0 = p->y0;

  dpoint_t *ctr = NULL;      /* ctr[m] */
  dpoint_t *dir = NULL;      /* dir[m] */
  quadform_t *q = NULL;      /* q[m] */
  double v[3];
  double d;
  int i, j, k, l;
  dpoint_t s;

  SAFE_MALLOC(ctr, m, dpoint_t);
  SAFE_MALLOC(dir, m, dpoint_t);
  SAFE_MALLOC(q, m, quadform_t);

  SAFE_MALLOC(p->curve, m, curve_t);

  /* calculate "optimal" point-slope representation for each line
     segment */
  for (i=0; i<m; i++) {
    j = po[mod(i+1,m)];
    j = mod(j-po[i],n)+po[i];
    pointslope(p, po[i], j, &ctr[i], &dir[i]);
  }

  /* represent each line segment as a singular quadratic form; the
     distance of a point (x,y) from the line segment will be
     (x,y,1)Q(x,y,1)^t, where Q=q[i]. */
  for (i=0; i<m; i++) {
    d = sq(dir[i].x) + sq(dir[i].y);
    if (d == 0.0) {
      for (j=0; j<3; j++) {
	for (k=0; k<3; k++) {
	  q[i][j][k] = 0;
	}
      }
    } else {
      v[0] = dir[i].y;
      v[1] = -dir[i].x;
      v[2] = - v[1] * ctr[i].y - v[0] * ctr[i].x;
      for (l=0; l<3; l++) {
	for (k=0; k<3; k++) {
	  q[i][l][k] = v[l] * v[k] / d;
	}
      }
    }
  }

  /* now calculate the "intersections" of consecutive segments.
     Instead of using the actual intersection, we find the point
     within a given unit square which minimizes the square distance to
     the two lines. */
  for (i=0; i<m; i++) {
    quadform_t Q;
    dpoint_t w;
    double dx, dy;
    double det;
    double min, cand; /* minimum and candidate for minimum of quad. form */
    double xmin, ymin;	/* coordinates of minimum */
    int z;

    /* let s be the vertex, in coordinates relative to x0/y0 */
    s.x = pt[po[i]].x-x0;
    s.y = pt[po[i]].y-y0;

    /* intersect segments i-1 and i */

    j = mod(i-1,m);

    /* add quadratic forms */
    for (l=0; l<3; l++) {
      for (k=0; k<3; k++) {
	Q[l][k] = q[j][l][k] + q[i][l][k];
      }
    }
    
    while(1) {
      /* minimize the quadratic form Q on the unit square */
      /* find intersection */

#ifdef HAVE_GCC_LOOP_BUG
      /* work around gcc bug #12243 */
      free(NULL);
#endif
      
      det = Q[0][0]*Q[1][1] - Q[0][1]*Q[1][0];
      if (det != 0.0) {
	w.x = (-Q[0][2]*Q[1][1] + Q[1][2]*Q[0][1]) / det;
	w.y = ( Q[0][2]*Q[1][0] - Q[1][2]*Q[0][0]) / det;
	break;
      }

      /* matrix is singular - lines are parallel. Add another,
	 orthogonal axis, through the center of the unit square */
      if (Q[0][0]>Q[1][1]) {
	v[0] = -Q[0][1];
	v[1] = Q[0][0];
      } else if (Q[1][1]) {
	v[0] = -Q[1][1];
	v[1] = Q[1][0];
      } else {
	v[0] = 1;
	v[1] = 0;
      }
      d = sq(v[0]) + sq(v[1]);
      v[2] = - v[1] * s.y - v[0] * s.x;
      for (l=0; l<3; l++) {
	for (k=0; k<3; k++) {
	  Q[l][k] += v[l] * v[k] / d;
	}
      }
    }
    dx = fabs(w.x-s.x);
    dy = fabs(w.y-s.y);
    if (dx <= .5 && dy <= .5) {
      p->curve[i].vertex.x = w.x+x0;
      p->curve[i].vertex.y = w.y+y0;
      continue;
    }

    /* the minimum was not in the unit square; now minimize quadratic
       on boundary of square */
    min = quadform(Q, s);
    xmin = s.x;
    ymin = s.y;

    if (Q[0][0] == 0.0) {
      goto fixx;
    }
    for (z=0; z<2; z++) {   /* value of the y-coordinate */
      w.y = s.y-0.5+z;
      w.x = - (Q[0][1] * w.y + Q[0][2]) / Q[0][0];
      dx = fabs(w.x-s.x);
      cand = quadform(Q, w);
      if (dx <= .5 && cand < min) {
	min = cand;
	xmin = w.x;
	ymin = w.y;
      }
    }
  fixx:
    if (Q[1][1] == 0.0) {
      goto corners;
    }
    for (z=0; z<2; z++) {   /* value of the x-coordinate */
      w.x = s.x-0.5+z;
      w.y = - (Q[1][0] * w.x + Q[1][2]) / Q[1][1];
      dy = fabs(w.y-s.y);
      cand = quadform(Q, w);
      if (dy <= .5 && cand < min) {
	min = cand;
	xmin = w.x;
	ymin = w.y;
      }
    }
  corners:
    /* check four corners */
    for (l=0; l<2; l++) {
      for (k=0; k<2; k++) {
	w.x = s.x-0.5+l;
	w.y = s.y-0.5+k;
	cand = quadform(Q, w);
	if (cand < min) {
	  min = cand;
	  xmin = w.x;
	  ymin = w.y;
	}
      }
    }

    p->curve[i].vertex.x = xmin + x0;
    p->curve[i].vertex.y = ymin + y0;
    continue;
  }

  free(ctr);
  free(dir);
  free(q);
  return 0;

 malloc_error:
  free(ctr);
  free(dir);
  free(q);
  return 1;
}

/* ---------------------------------------------------------------------- */
/* Stage 4: smoothing and corner analysis (Sec. 2.3.3) */

static int smooth(path_t *p) {
  int m = p->m;
  curve_t *curve = p->curve;

  int i, j, k;
  double dd, denom, alpha;
  dpoint_t p2, p3, p4;

  if (p->sign == '-') {
    /* reverse orientation of negative paths */
    for (i=0, j=m-1; i<j; i++, j--) {
      dpoint_t tmp;
      tmp = curve[i].vertex;
      curve[i].vertex = curve[j].vertex;
      curve[j].vertex = tmp;
    }
  }

  /* examine each vertex and find its best fit */
  for (i=0; i<m; i++) {
    j = mod(i+1, m);
    k = mod(i+2, m);
    p4 = interval(1/2.0, curve[k].vertex, curve[j].vertex);

    denom = ddenom(curve[i].vertex, curve[k].vertex);
    if (denom != 0.0) {
      dd = dpara(curve[i].vertex, curve[j].vertex, curve[k].vertex) / denom;
      dd = fabs(dd);
      alpha = dd>1 ? (1 - 1.0/dd) : 0;
      alpha = alpha / 0.75;
    } else {
      alpha = 4/3.0;
    }
    p->curve[j].alpha0 = alpha;	 /* remember "original" value of alpha */

    if (alpha > info.alphamax) {  /* pointed corner */
      p->curve[j].tag = CORNER;
      p->curve[j].c[1] = curve[j].vertex;
      p->curve[j].c[2] = p4;
    } else {
      if (alpha < 0.55) {
	alpha = 0.55;
      } else if (alpha > 1) {
	alpha = 1;
      }
      p2 = interval(.5+.5*alpha, curve[i].vertex, curve[j].vertex);
      p3 = interval(.5+.5*alpha, curve[k].vertex, curve[j].vertex);
      p->curve[j].tag = CURVETO;
      p->curve[j].c[0] = p2;
      p->curve[j].c[1] = p3;
      p->curve[j].c[2] = p4;
    }
    p->curve[j].alpha = alpha;	/* store the "cropped" value of alpha */
    p->curve[j].beta = 0.5;
  }

  return 0;
}

/* ---------------------------------------------------------------------- */
/* Stage 5: Curve optimization (Sec. 2.4) */

/* a private type for the result of opti_penalty */
struct opti_s {
  double pen;	   /* penalty */
  dpoint_t c[2];   /* curve parameters */
  double t, s;	   /* curve parameters */
  double alpha;	   /* curve parameter */
};
typedef struct opti_s opti_t;

/* calculate best fit from i+.5 to j+.5.  Assume i<j (cyclically).
   Return 0 and set badness and parameters (alpha, beta), if
   possible. Return 1 if impossible. */
static int opti_penalty(path_t *p, int i, int j, opti_t *res) {
  int m = p->m;
  int k, k1, k2, conv, i1;
  double area, alpha, d, d1, d2;
  dpoint_t p0, p1, p2, p3, pt;
  double A, R, A1, A2, A3, A4;
  double s, t;

  /* check convexity, corner-freeness, and maximum bend < 179 degrees */

  if (i==j) {  /* sanity - a full loop can never be an opticurve */
    return 1;
  }

  k = i;
  i1 = mod(i+1, m);
  k1 = mod(k+1, m);
  conv = p->conv[k1];
  if (conv == 0) {
    return 1;
  }
  d = ddist(p->curve[i].vertex, p->curve[i1].vertex);
  for (k=k1; k!=j; k=k1) {
    k1 = mod(k+1, m);
    k2 = mod(k+2, m);
    if (p->conv[k1] != conv) {
      return 1;
    }
    if (sign(cprod(p->curve[i].vertex, p->curve[i1].vertex, p->curve[k1].vertex, p->curve[k2].vertex)) != conv) {
      return 1;
    }
    if (iprod1(p->curve[i].vertex, p->curve[i1].vertex, p->curve[k1].vertex, p->curve[k2].vertex) < d * ddist(p->curve[k1].vertex, p->curve[k2].vertex) * COS179) {
      return 1;
    }
  }

  /* the curve we're working in: */
  p0 = p->curve[mod(i,m)].c[2];
  p1 = p->curve[mod(i+1,m)].vertex;
  p2 = p->curve[mod(j,m)].vertex;
  p3 = p->curve[mod(j,m)].c[2];

  /* determine its area */
  area = p->areac[j] - p->areac[i];
  area -= dpara(p->curve[0].vertex, p->curve[i].c[2], p->curve[j].c[2])/2;
  if (i>=j) {
    area += p->areac[m];
  }

  /* find intersection o of p0p1 and p2p3. Let t,s such that o =
     interval(t,p0,p1) = interval(s,p3,p2). Let A be the area of the
     triangle (p0,o,p3). */

  A1 = dpara(p0, p1, p2);
  A2 = dpara(p0, p1, p3);
  A3 = dpara(p0, p2, p3);
  /* A4 = dpara(p1, p2, p3); */
  A4 = A1+A3-A2;    
  
  if (A2 == A1) {  /* this should never happen */
    return 1;
  }

  t = A3/(A3-A4);
  s = A2/(A2-A1);
  A = A2 * t / 2.0;
  
  if (A == 0.0) {  /* this should never happen */
    return 1;
  }

  R = area / A;	 /* relative area */
  alpha = 2 - sqrt(4 - R / 0.3);  /* overall alpha for p0-o-p3 curve */

  res->c[0] = interval(t * alpha, p0, p1);
  res->c[1] = interval(s * alpha, p3, p2);
  res->alpha = alpha;
  res->t = t;
  res->s = s;

  p1 = res->c[0];
  p2 = res->c[1];  /* the proposed curve is now (p0,p1,p2,p3) */

  res->pen = 0;

  /* calculate penalty */
  /* check tangency with edges */
  for (k=mod(i+1,m); k!=j; k=k1) {
    k1 = mod(k+1,m);
    t = tangent(p0, p1, p2, p3, p->curve[k].vertex, p->curve[k1].vertex);
    if (t<-.5) {
      return 1;
    }
    pt = bezier(t, p0, p1, p2, p3);
    d = ddist(p->curve[k].vertex, p->curve[k1].vertex);
    if (d == 0.0) {  /* this should never happen */
      return 1;
    }
    d1 = dpara(p->curve[k].vertex, p->curve[k1].vertex, pt) / d;
    if (fabs(d1) > info.opttolerance) {
      return 1;
    }
    if (iprod(p->curve[k].vertex, p->curve[k1].vertex, pt) < 0 || iprod(p->curve[k1].vertex, p->curve[k].vertex, pt) < 0) {
      return 1;
    }
    res->pen += sq(d1);
  }

  /* check corners */
  for (k=i; k!=j; k=k1) {
    k1 = mod(k+1,m);
    t = tangent(p0, p1, p2, p3, p->curve[k].c[2], p->curve[k1].c[2]);
    if (t<-.5) {
      return 1;
    }
    pt = bezier(t, p0, p1, p2, p3);
    d = ddist(p->curve[k].c[2], p->curve[k1].c[2]);
    if (d == 0.0) {  /* this should never happen */
      return 1;
    }
    d1 = dpara(p->curve[k].c[2], p->curve[k1].c[2], pt) / d;
    d2 = dpara(p->curve[k].c[2], p->curve[k1].c[2], p->curve[k1].vertex) / d;
    d2 *= 0.75 * p->curve[k1].alpha;
    if (d2 < 0) {
      d1 = -d1;
      d2 = -d2;
    }
    if (d1 < d2 - info.opttolerance) {
      return 1;
    }
    if (d1 < d2) {
      res->pen += sq(d1 - d2);
    }
  }

  return 0;
}

/* optimize the path p, replacing sequences of Bezier segments by a
   single segment when possible. Return 0 on success, 1 with errno set
   on failure. */
static int opticurve(path_t *p) {
  int m = p->m;
  int *pt = NULL;     /* pt[m+1] */
  double *pen = NULL; /* pen[m+1] */
  int *len = NULL;    /* len[m+1] */
  opti_t *opt = NULL; /* opt[m+1] */
  int om;
  int i,j,r;
  opti_t o;
  dpoint_t p0;
  int i1;
  double area;
  double alpha;
  double *s = NULL;
  double *t = NULL;

  SAFE_MALLOC(pt, m+1, int);
  SAFE_MALLOC(pen, m+1, double);
  SAFE_MALLOC(len, m+1, int);
  SAFE_MALLOC(opt, m+1, opti_t);

  SAFE_MALLOC(p->conv, m, int);

  /* pre-calculate convexity: +1 = right turn, -1 = left turn, 0 = corner */
  for (i=0; i<m; i++) {
    if (p->curve[i].tag == CURVETO) {
      p->conv[i] = sign(dpara(p->curve[mod(i-1,m)].vertex, p->curve[i].vertex, p->curve[mod(i+1,m)].vertex));
    } else {
      p->conv[i] = 0;
    }
  }

  /* pre-calculate areas */
  SAFE_MALLOC(p->areac, m+1, double);

  area = 0.0;
  p->areac[0] = 0.0;
  p0 = p->curve[0].vertex;
  for (i=0; i<m; i++) {
    i1 = mod(i+1, m);
    if (p->curve[i1].tag == CURVETO) {
      alpha = p->curve[i1].alpha;
      area += 0.3*alpha*(4-alpha)*dpara(p->curve[i].c[2], p->curve[i1].vertex, p->curve[i1].c[2])/2;
      area += dpara(p0, p->curve[i].c[2], p->curve[i1].c[2])/2;
    }
    p->areac[i+1] = area;
  }

  pt[0] = -1;
  pen[0] = 0;
  len[0] = 0;

  /* the fact that we always start from a fixed point is also a bug --
     should find the best curve cyclically ### */

  for (j=1; j<=m; j++) {
    /* calculate best path from 0 to j */
    pt[j] = j-1;
    pen[j] = pen[j-1];
    len[j] = len[j-1]+1;

    for (i=j-2; i>=0; i--) {
      r = opti_penalty(p, i, mod(j,m), &o);
      if (r) {
	break;
      }
      if (len[j] > len[i]+1 || (len[j] == len[i]+1 && pen[j] > pen[i] + o.pen)) {
	pt[j] = i;
	pen[j] = pen[i] + o.pen;
	len[j] = len[i] + 1;
	opt[j] = o;
      }
    }
  }
  p->om = om = len[m];
  SAFE_MALLOC(p->ocurve, om, curve_t);
  SAFE_MALLOC(s, om, double);
  SAFE_MALLOC(t, om, double);

  j = m;
  for (i=om-1; i>=0; i--) {
    if (pt[j]==j-1) {
      p->ocurve[i] = p->curve[mod(j,m)];
      s[i] = t[i] = 1.0;
    } else {
      p->ocurve[i].tag = CURVETO;
      p->ocurve[i].c[0] = opt[j].c[0];
      p->ocurve[i].c[1] = opt[j].c[1];
      p->ocurve[i].c[2] = p->curve[mod(j,m)].c[2];
      p->ocurve[i].vertex = interval(opt[j].s, p->curve[mod(j,m)].c[2], p->curve[mod(j,m)].vertex);
      p->ocurve[i].alpha = opt[j].alpha;
      p->ocurve[i].alpha0 = opt[j].alpha;
      s[i] = opt[j].s;
      t[i] = opt[j].t;
    }
    j = pt[j];
  }

  /* calculate beta parameters */
  for (i=0; i<om; i++) {
    i1 = mod(i+1,om);
    p->ocurve[i].beta = s[i] / (s[i] + t[i1]);
  }

  free(pt);
  free(pen);
  free(len);
  free(opt);
  free(s);
  free(t);
  return 0;

 malloc_error:
  free(pt);
  free(pen);
  free(len);
  free(opt);
  free(s);
  free(t);
  return 1;
}

/* ---------------------------------------------------------------------- */

int process_path(path_t *plist) {
  path_t *p;

  /* call downstream function with each path */
  list_forall (p, plist) {
    TRY(calc_sums(p));
    TRY(calc_lon(p));
    TRY(bestpolygon(p));
    TRY(adjust_vertices(p));
    TRY(smooth(p));
    if (info.opticurve) {
      TRY(opticurve(p));
      p->fm = p->om;
      p->fcurve = p->ocurve;
    } else {
      p->fm = p->m;
      p->fcurve = p->curve;
    }
  }

  return 0;

 try_error:
  return 1;
}
