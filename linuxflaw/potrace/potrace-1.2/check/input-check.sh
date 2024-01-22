#! /bin/sh

# Copyright (C) 2000-2003 Peter Selinger.
# This file is part of potrace. It is free software and it is covered
# by the GNU general public license. See the file COPYING for details.

echo Checking input formats... >& 2

# we check that potrace can read different file formats without error,
# and produces identical output irrespective of the input file format.

if [ -z "$srcdir" ]; then
    srcdir=.
fi

. $srcdir/missing.sh

NAME=`basename $0`

POTRACE="../src/potrace"
TMP1=`mktemp "/tmp/$NAME-1.XXXXXX"`
TMP2=`mktemp "/tmp/$NAME-2.XXXXXX"`

action () {
    "$@"
    if [ $? -ne 0 ]; then
	echo $NAME: test failed >& 2
	echo Failed command: $LINE: "$@" >& 2
	exit 1
    fi
}

# keep track of line numbers
alias action="LINE=\$LINENO; action"

# available input files
INFILES="faces.pbm faces.pgm faces.ppm faces.bmp1 faces.bmp4 faces.bmp8 faces.bmp24 faces.bmp4r faces.bmp8r"

# extract first file
set dummy $INFILES; F=$2

action $POTRACE -o $TMP1 $srcdir/$F

for i in $INFILES; do
    action $POTRACE -o $TMP2 $srcdir/$i
    action diff $TMP1 $TMP2 > /dev/null
    action rm -f $TMP2
done

action rm -f $TMP1

echo $NAME: test succeeded >& 2
exit 0
