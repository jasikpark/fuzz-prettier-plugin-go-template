#!/bin/bash

mkdir -p 'artifacts'

trap "exit" SIGHUP SIGINT SIGTERM

for i in {0..1000000}; do
    radamsa ../prettier-plugin-go-template/src/tests/*/**.html > tmp/input.html
    ./test_input.sh tmp/input.html
    if [ $? -ne 0 ]; then
        CRASHFILENAME=artifacts/crash-`date +%s`.html
        echo "copied failing output to $CRASHFILENAME"
        cp tmp/input.html "$CRASHFILENAME"
        exit
    fi
done
