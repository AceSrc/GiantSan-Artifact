#! /bin/sh

# Copyright (C) 2000-2003 Peter Selinger.
# This file is part of potrace. It is free software and it is covered
# by the GNU general public license. See the file COPYING for details.

if [ $# -gt 0 ] && [ "$1" = "-t" ]; then
    testflag=yes
fi

echo Checking backends... >& 2

# we cannot check the output exactly because of floating point
# differences on different architectures. So we content ourselves with
# checking the file type and the approximate file size. Note that the
# file size varies considerably under Windows due to the newline
# coding. The main point of this test is to exercise as many parts of
# the backend code as possible.

if [ -z "$srcdir" ]; then
    srcdir=.
fi

. $srcdir/missing.sh

NAME=`basename $0`

POTRACE="../src/potrace"
TMP1=`mktemp "/tmp/$NAME-1.XXXXXX"`
DATA=$srcdir/faces.pbm

# run the command, expecting return value 0
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

# check the first line of the file against template
filetest () {
    F=$1
    T=$2
    head -n 1 "$F" | egrep "$T"
}

# check that the file size is within given bounds
sizetest () {
    F=$1
    L=$2
    U=$3
    set dummy `ls -lg $F`; S=$6
    if [ "$testflag" = "yes" ]; then
	echo "Size: $S, Bounds: $L $U" >& 2
	return 0;
    fi
    if [ "$S" -lt "$L" ] || [ "$S" -gt "$U" ]; then
	echo File size: $S >& 2
	return 1;
    fi
    return 0;
}


# test eps
action $POTRACE -o $TMP1 $DATA
action filetest $TMP1 '^%!PS-Adobe-3.0 EPSF-3.0$' > /dev/null
# omit size test as it depends on compile-time defaults

# test eps with cleartext
action $POTRACE -c -o $TMP1 $DATA
action filetest $TMP1 '^%!PS-Adobe-3.0 EPSF-3.0$' > /dev/null
action sizetest $TMP1 9000 9800

# test eps with level 3 compression
action $POTRACE -3 -o $TMP1 $DATA
action filetest $TMP1 '^%!PS-Adobe-3.0 EPSF-3.0$' > /dev/null
action sizetest $TMP1 5200 5400

# test eps with level 2 compression, if available
$POTRACE -2 -o $TMP1 $DATA
R=$?
if [ $R -eq 0 ]; then
    action filetest $TMP1 '^%!PS-Adobe-3.0 EPSF-3.0$' > /dev/null
    action sizetest $TMP1 5500 5800
elif [ $R -ne 1 ]; then
    echo $NAME: test failed >& 2
    echo Failed command: $POTRACE -2 -o $TMP1 $DATA >& 2
    exit 1
fi

# test debugging backends
action $POTRACE -c -d1 -o $TMP1 $DATA
action filetest $TMP1 '^%!PS-Adobe-3.0 EPSF-3.0$' > /dev/null
action sizetest $TMP1 400300 433000

action $POTRACE -c -d2 -o $TMP1 $DATA
action filetest $TMP1 '^%!PS-Adobe-3.0 EPSF-3.0$' > /dev/null
action sizetest $TMP1 150300 161700

action $POTRACE -c -d3 -o $TMP1 $DATA
action filetest $TMP1 '^%!PS-Adobe-3.0 EPSF-3.0$' > /dev/null
action sizetest $TMP1 169600 182300

action $POTRACE -c -d4 -o $TMP1 $DATA
action filetest $TMP1 '^%!PS-Adobe-3.0 EPSF-3.0$' > /dev/null
action sizetest $TMP1 227500 243900

# test ps
action $POTRACE -b ps -c -o $TMP1 $DATA
action filetest $TMP1 '^%!PS-Adobe-3.0$' > /dev/null
action sizetest $TMP1 9000 9850

# test svg
action $POTRACE -b svg -o $TMP1 $DATA
action filetest $TMP1 '^<\?xml version="1.0" standalone="no"\?>$' > /dev/null
action sizetest $TMP1 12000 12300

# test svg debugging backend
action $POTRACE -b svg -d1 -o $TMP1 $DATA
action filetest $TMP1 '^<\?xml version="1.0" standalone="no"\?>$' > /dev/null
action sizetest $TMP1 21100 21500

# test pgm
action $POTRACE -b pgm -o $TMP1 $DATA
action filetest $TMP1 'P5' > /dev/null
action sizetest $TMP1 45300 45400

# test gimppath
action $POTRACE -b gimp -o $TMP1 $DATA
action filetest $TMP1 'Name: Potrace Imported Path' > /dev/null
action sizetest $TMP1 39000 40850

# test xfig
action $POTRACE -b xfig -o $TMP1 $DATA
action filetest $TMP1 '#FIG 3.2' > /dev/null
action sizetest $TMP1 20000 23150

action rm -f $TMP1

echo $NAME: test succeeded >& 2
exit 0
