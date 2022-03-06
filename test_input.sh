#!/bin/bash

yarn -s prettier --parser go-template tmp/input.html 2>/dev/null > tmp/formatted.html
FIRST_TRY=$?
if [ "$FIRST_TRY" -ne 0 ]; then
    echo "continuing"
    exit
fi
yarn -s prettier --parser go-template tmp/formatted.html 2>/dev/null > tmp/formatted_but_again.html
SECOND_TRY=$?
if [ "$FIRST_TRY" -ne "$SECOND_TRY" ]; then
    cp tmp/input.html artifacts/crash-`date +%s`.html
    echo "Difference found! different error codes: $FIRST_TRY v.s. $SECOND_TRY"
    exit 1
fi
delta tmp/formatted.html tmp/formatted_but_again.html
if [ $? -eq 1 ]; then
    # cp tmp/input.html artifacts/crash-`date +%s`.html
    echo "Difference found!"
    exit 1
fi