#!/bin/bash

echo "backing up to tmp/input.html.bak"
cp tmp/input.html tmp/input.html.bak
delta -in_place -test=reduce_test_case_multidelta.sh -suffix=.html tmp/input.html