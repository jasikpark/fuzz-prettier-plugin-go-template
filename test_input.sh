#!/bin/bash

mkdir -p 'tmp'

yarn -s prettier --parser go-template $1 2>/dev/null > tmp/formatted.html
FIRST_TRY=$?
if [ "$FIRST_TRY" -ne 0 ]; then
    echo "continuing"
    exit
fi
yarn -s prettier --parser go-template tmp/formatted.html 2>/dev/null > tmp/formatted_but_again.html
SECOND_TRY=$?
if [ "$FIRST_TRY" -ne "$SECOND_TRY" ]; then
    echo "Difference found! different error codes: $FIRST_TRY v.s. $SECOND_TRY"
    exit 1
fi
diff tmp/formatted.html tmp/formatted_but_again.html
if [ $? -eq 1 ]; then
    echo "Difference found!"
    exit 1
fi