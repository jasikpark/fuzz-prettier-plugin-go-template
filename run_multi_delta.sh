#!/bin/bash

multidelta -level=0 ./reduce_test_case_multidelta.sh tmp/input.html
multidelta -level=0 ./reduce_test_case_multidelta.sh tmp/input.html
multidelta -level=1 ./reduce_test_case_multidelta.sh tmp/input.html
multidelta -level=1 ./reduce_test_case_multidelta.sh tmp/input.html
multidelta -level=2 ./reduce_test_case_multidelta.sh tmp/input.html
multidelta -level=2 ./reduce_test_case_multidelta.sh tmp/input.html
multidelta -level=10 ./reduce_test_case_multidelta.sh tmp/input.html