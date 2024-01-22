/* Copyright (C) 2001-2003 Peter Selinger.
   This file is part of potrace. It is free software and it is covered
   by the GNU general public license. See the file COPYING for details. */

/* $Id: ztops.h,v 1.1 2002/10/10 05:37:45 selinger Exp $ */

#ifndef ZTOPS_H
#define ZTOPS_H

#define ZTOPS_MINOUT 4
#define PSL2_NORMAL 0
#define PSL2_FINISH 1

/* the state of the various parts of the pipeline. Here "right" refers
   to least significant, "left" to most significant bits. */
struct ztops_state {
  /* incoming byte stream */
  int inheader;         /* number of .Z header bytes read */

  /* incoming bit buffer */
  int inbits;           /* number of bits in buffer */
  unsigned int inbuf;   /* bits are right aligned, zero padded. Least
			   significant bit is next to go out */

  /* incoming integer stream */
  int incount;          /* number of integers read in this block */
  int inwidth;          /* next integers to read has this many bits */

  /* outgoing integer stream */
  int outcount;         /* number of integers written in this block */
  int outwidth;         /* next integer to write has this many bits */

  /* outgoing bit buffer: for bits that have been read from the
     integer stream, but not yet written to the bytestream */
  int outbits;          /* number of bits in buffer */
  unsigned int outbuf;  /* bits are left aligned, zero padded. Most
			   significant bit is next to go out */

  /* user-accessible area */

  /* outgoing byte buffer: for bytes that have been scheduled for
     output. Note: when calling any ztops_* function (even ztops_init),
     there must be at least ZTOPS_MINOUT bytes available for output, or a
     buffer overflow error may result. */

  char *next_out;    /* pointer to next free byte in output buffer */
  int avail_out;     /* remaining size of output buffer */

  char *error;       /* error message; set when functions return 1 */

};
typedef struct ztops_state ztops_state;

struct psl2_state {
  char buf[16384];
  char outbuf[16384];
  char combuf[8192];
  int bufsize;
  int outbufsize;
  int combufsize;
  char *next_com;

  ztops_state s;

  /* user-accessible area: */
  char *next_in;     /* pointer to next input character */
  int avail_in;      /* number of input chars available */
  char *next_out;    /* pointer to next free byte in output buffer */
  int avail_out;     /* remaining size of output buffer */
  char *error;       /* error message; set when functions return 1 */
};
typedef struct psl2_state psl2_state;

int ztops_init(ztops_state *s);
int ztops_inbyte(ztops_state *s, int b);
int ztops_newblock(ztops_state *s);
int ztops_finish(ztops_state *s);

int psl2_init(psl2_state *g);
int psl2_compress(psl2_state *g, int mode);

#endif /* ZTOPS_H */
