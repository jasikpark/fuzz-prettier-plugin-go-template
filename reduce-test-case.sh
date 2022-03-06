#!/bin/bash

mkdir -p 'artifacts'
mkdir -p 'tmp'

for i in {0..1000000}; do
    radamsa ../prettier-plugin-go-template/src/tests/*/**.html > tmp/input.html
    yarn -s prettier --parser go-template input.html 2>/dev/null > tmp/formatted.html
    if [ $? -gt 1 ]; then
        cp input.html artifacts/crash-`date +%s`.html
        echo "Crash found!"
        exit
    fi
    yarn -s prettier --parser go-template formatted.html 2>/dev/null > tmp/formatted_but_again.html
    if [ $? -gt 1 ]; then
        cp input.html artifacts/crash-`date +%s`.html
        echo "Crash found!"
        exit
    fi
    delta formatted.html formatted_but_again.html
    if [ $? -eq 1 ]; then
        cp input.html artifacts/crash-`date +%s`.html
        echo "Difference found!"
        exit
    fi
done