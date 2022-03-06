#!/bin/bash


# use delta (https://web.archive.org/web/20170730171602/http://delta.tigris.org/using_delta.html)
# to minimize the test case using the output of `test_input.sh`
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