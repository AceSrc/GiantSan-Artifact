#! /bin/sh

# Copyright (C) 2000-2003 Peter Selinger.
# This file is part of potrace. It is free software and it is covered
# by the GNU general public license. See the file COPYING for details.

# If ghostscript is present, we attempt to render the postscript
# output and check it for accuracy.

if [ -z "$srcdir" ]; then
    srcdir=.
fi

. $srcdir/missing.sh

GS=`my_which ghostscript`
if [ -z "$GS" ]; then
    GS=`my_which gs`
fi
if [ -z "$GS" ]; then
    echo "Don't have ghostscript, ignoring postscript test." >& 2
    exit 77
fi

echo Checking postscript output... >& 2

NAME=`basename $0`

POTRACE="../src/potrace"
PGMDIFF=./pgmdiff
TMP1=`mktemp "/tmp/$NAME-1.XXXXXX"`
TMP2=`mktemp "/tmp/$NAME-2.XXXXXX"`
DATA=$srcdir/faces.pbm
REFDATA=$srcdir/faces.pbm.gs

# run the command, expecting return value 0
action () {
    "$@"
    if [ $? -ne 0 ]; then
	echo $NAME: test failed >& 2
	echo Failed command: $LINE: "$@" >& 2
	exit 1
    fi
}

actiondiff () {
    D=`action $PGMDIFF $1 $2`
    # check return value because subshell can't exit
    if [ $? -ne 0 ]; then 
	exit 1; 
    fi
    echo Difference: $D >& 2
    if [ "$D" -gt $3 ]; then
	echo $NAME: test failed >& 2
	echo Failed command: $LINE: $PGMDIFF $1 $2 >& 2
	exit 1;
    fi
}

# keep track of line numbers
alias action="LINE=\$LINENO; action"
alias actiondiff="LINE=\$LINENO; actiondiff"

action $POTRACE -r50 -p -L 0 -B 0 -o $TMP1 $DATA
$GS -q -dNOPAUSE -sDEVICE=pbmraw -g460x394 -r100x100 -sOutputFile=$TMP2 -- $TMP1
if [ $? -ne 0 ]; then
    echo "Something is wrong with $GS; skipping this test" >& 2
    exit 77
fi 
actiondiff $TMP2 $REFDATA 400

action $POTRACE -r50 -p -L 0 -B 0 --opaque -o $TMP1 $DATA
action $GS -q -dNOPAUSE -sDEVICE=pbmraw -g460x394 -r100x100 -sOutputFile=$TMP2 -- $TMP1
actiondiff $TMP2 $REFDATA 400

action rm -f $TMP1
action rm -f $TMP2

echo $NAME: test succeeded >& 2
exit 0
