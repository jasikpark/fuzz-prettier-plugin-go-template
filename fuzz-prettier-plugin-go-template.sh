#!/bin/bash

mkdir -p 'artifacts'
mkdir -p 'tmp'

trap "exit" SIGHUP SIGINT SIGTERM

for i in {0..1000000}; do
    radamsa ../prettier-plugin-go-template/src/tests/*/**.html > tmp/input.html
    ./test_input.sh
    if [ $? -ne 0 ]; then
        exit
    fi
done
