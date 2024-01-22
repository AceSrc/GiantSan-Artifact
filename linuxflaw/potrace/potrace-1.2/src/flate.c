/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: flate.c,v 1.3 2003/08/10 23:02:48 selinger Exp $ */

/* the PostScript compression module of potrace. The basic interface
   is through the *_xship function, which processes a byte array and
   outputs it in compressed or verbatim form, depending on whether
   filter is 1 or 0. To flush the output, simply call with the empty
   string and filter=0. Each function has variants for shipping a
   single character, a null-terminated string, or a byte array. */

/* different compression algorithms are available. There is
   dummy_xship, which is just the identity, and flate_xship, which
   uses zlib compression. Also, lzw_xship provides LZW compression
   via the "compress" program, if installed. a85_xship provides
   a85-encoding without compression. Each function returns the actual
   number of characters written. */

/* note: the functions provided here have global state and are not
   reentrant */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <zlib.h>

#include "flate.h"
#include "ztops.h"

#define OUTSIZE 1000

static int a85out(FILE *f, int n);
static int a85spool(FILE *f, char c);

/* ---------------------------------------------------------------------- */
/* dummy interface: no encoding */

int dummy_xship(FILE *f, int filter, char *s, int len) {
  fwrite(s, 1, len, f);
  return len;
}

/* ---------------------------------------------------------------------- */
/* flate interface: zlib (=postscript level 3) compression and a85 */

/* ship len bytes from s using zlib compression. */
int flate_xship(FILE *f, int filter, char *s, int len) {
  static int fstate = 0;
  static z_stream c_stream;
  char outbuf[OUTSIZE];
  int err;
  int n=0;

  if (filter & !fstate) {
    /* switch on filtering */
    n += fprintf(f, "currentfile /ASCII85Decode filter /FlateDecode filter cvx exec\n");
    c_stream.zalloc = Z_NULL;
    c_stream.zfree = Z_NULL;
    c_stream.opaque = Z_NULL;
    err = deflateInit(&c_stream, 9);
    if (err != Z_OK) {
      fprintf(stderr, "deflateInit: %s (%d)\n", c_stream.msg, err);
      exit(1);
    }
    c_stream.avail_in = 0;
    n += a85init(f);
    fstate = 1;
  } else if (!filter & fstate) {
    /* switch off filtering */
    /* flush stream */
    do {
      c_stream.next_out = (Bytef*)outbuf;
      c_stream.avail_out = OUTSIZE;

      err = deflate(&c_stream, Z_FINISH);
      if (err != Z_OK && err != Z_STREAM_END) {
	fprintf(stderr, "deflate: %s (%d)\n", c_stream.msg, err);
	exit(1);
      }
      n += a85write(f, outbuf, OUTSIZE-c_stream.avail_out);
    } while (err != Z_STREAM_END);

    n += a85finish(f);

    fstate = 0;
  }
  if (!fstate) {
    fwrite(s, 1, len, f);
    return n+len;
  }
  
  /* do the actual compression */
  c_stream.next_in = (Bytef*) s;
  c_stream.avail_in = len;

  do {
    c_stream.next_out = (Bytef*) outbuf;
    c_stream.avail_out = OUTSIZE;

    err = deflate(&c_stream, Z_NO_FLUSH);
    if (err != Z_OK) {
      fprintf(stderr, "deflate: %s (%d)\n", c_stream.msg, err);
      exit(1);
    }
    n += a85write(f, outbuf, OUTSIZE-c_stream.avail_out);
  } while (!c_stream.avail_out);
  
  return n;
}

/* ---------------------------------------------------------------------- */
/* lzw interface: LZW (=postscript level 2) compression with a85.
   This relies on the "compress" program to do the actual compression. */

/* use Postscript level 2 compression via the "compress" program. Ship
   len bytes from str. */
int lzw_xship(FILE *f, int filter, char *str, int len) {
  static int fstate = 0;
  static psl2_state psl2_stream;
  psl2_state *s = &psl2_stream;
  char outbuf[OUTSIZE];
  int err;
  int n=0;

  if (filter & !fstate) {
    /* switch on filtering */
    n += fprintf(f, "currentfile /ASCII85Decode filter /LZWDecode filter cvx exec\n");
    err = psl2_init(s);
    if (err) {
      fprintf(stderr, "psl2_init: %s\n", s->error);
      exit(1);
    }
    s->avail_in = 0;
    n += a85init(f);
    fstate = 1;
  } else if (!filter & fstate) {
    /* switch off filtering */
    /* flush stream */
    do {
      s->next_out = outbuf;
      s->avail_out = OUTSIZE;

      err = psl2_compress(s, PSL2_FINISH);
      if (err) {
	fprintf(stderr, "psl2_compress: %s\n", s->error);
	exit(1);
      }
      n += a85write(f, outbuf, OUTSIZE - s->avail_out);
    } while (s->avail_out == 0);

    n += a85finish(f);

    fstate = 0;
  }
  if (!fstate) {
    fwrite(str, 1, len, f);
    return n+len;
  }
  
  /* do the actual compression */
  s->next_in = str;
  s->avail_in = len;

  do {
    s->next_out = outbuf;
    s->avail_out = OUTSIZE;

    err = psl2_compress(s, PSL2_NORMAL);
    if (err) {
      fprintf(stderr, "psl2_compress: %s\n", s->error);
      exit(1);
    }
    n += a85write(f, outbuf, OUTSIZE - s->avail_out);
  } while (s->avail_out == 0);
  
  return n;
}

/* ---------------------------------------------------------------------- */
/* a85 interface: a85 encoding without compression */

/* ship len bytes from s using a85 encoding only. */
int a85_xship(FILE *f, int filter, char *s, int len) {
  static int fstate = 0;
  int n=0;

  if (filter & !fstate) {
    /* switch on filtering */
    n += fprintf(f, "currentfile /ASCII85Decode filter cvx exec\n");
    n += a85init(f);
    fstate = 1;
  } else if (!filter & fstate) {
    /* switch off filtering */
    /* flush stream */
    n += a85finish(f);
    fstate = 0;
  }
  if (!fstate) {
    fwrite(s, 1, len, f);
    return n+len;
  }
  
  n += a85write(f, s, len);
  
  return n;
}

/* ---------------------------------------------------------------------- */
/* low-level a85 backend */

unsigned long a85buf[4];
int a85n;
int a85col;

int a85init(FILE *f) {
  a85n = 0;
  a85col = 0;
  return 0;
}

int a85finish(FILE *f) {
  int r=0;

  if (a85n) {
    r+=a85out(f, a85n);
  }
  fputs("~>\n", f);
  return r+2;
}

int a85write(FILE *f, char *buf, int n) {
  int i;
  int r=0;

  for (i=0; i<n; i++) {
    a85buf[a85n] = (unsigned char)buf[i];
    a85n++;
    
    if (a85n == 4) {
      r+=a85out(f, 4);
      a85n = 0;
    }
  }
  return r;
}

static int a85out(FILE *f, int n) {
  char out[5];
  unsigned long s;
  int r=0;
  int i;

  for (i=n; i<4; i++) {
    a85buf[i] = 0;
  }

  s = (a85buf[0]<<24) + (a85buf[1]<<16) + (a85buf[2]<<8) + (a85buf[3]<<0);

  if (!s) {
    r+=a85spool(f, 'z');
  } else {
    for (i=4; i>=0; i--) {
      out[i] = s % 85;
      s /= 85;
    }
    for (i=0; i<n+1; i++) {
      r+=a85spool(f, out[i]+33);
    }
  } 
  return r;
}

static int a85spool(FILE *f, char c) {
  fputc(c, f);

  a85col++;
  if (a85col>70) {
    fputc('\n', f);
    a85col=0;
    return 2;
  }
  
  return 1;
}
