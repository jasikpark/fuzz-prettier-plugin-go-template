#!/bin/bash


# use delta (https://web.archive.org/web/20170730171602/http://delta.tigris.org/using_delta.html)
# to minimize the test case using the output of `test_input.sh`

mkdir -p 'tmp'
TMP_DIR="$HOME/Github/fuzz-prettier-plugin-go-template/tmp"
PRETTIER="$HOME/Github/fuzz-prettier-plugin-go-template/node_modules/.bin/prettier"

"$PRETTIER" --parser go-template $TMP_DIR/input.html 2>/dev/null > "$TMP_DIR/formatted.html"
FIRST_TRY=$?
if [ "$FIRST_TRY" -ne 0 ]; then
    echo "continuing"
    exit 1
fi
"$PRETTIER" --parser go-template "$TMP_DIR/formatted.html" 2>/dev/null > "$TMP_DIR/formatted_but_again.html"
SECOND_TRY=$?
# if [ "$FIRST_TRY" -ne "$SECOND_TRY" ]; then
#     echo "Difference found! different error codes: $FIRST_TRY v.s. $SECOND_TRY"
#     exit 1
# fi
diff "$TMP_DIR/formatted.html" "$TMP_DIR/formatted_but_again.html"
if [ $? -eq 1 ]; then
    echo "Difference found!"
    exit 0
fi
exit 1