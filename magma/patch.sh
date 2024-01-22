#!/bin/bash
set -e

##
# Pre-requirements:
# - env TARGET: path to target work dir
##

# TODO filter patches by target config.yaml
find "${PWD}/bugs" -name "*.patch" | \
while read patch; do
    echo "Applying $patch"
    name=${patch##*/}
    name=${name%.patch}
    echo "###" $name
    sed "s/%MAGMA_BUG%/$name/g" "$patch" | patch -p1 -d "./repo"
done
