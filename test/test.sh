#!/bin/bash

set -eu

rm -rf ./test-repo ./test-repo-?/ ./test-repo-?-orig/
./make-test-repo.sh

echo "# Undoing simple edits"
git clone test-repo test-repo-1
cp -Rp test-repo-1 test-repo-1-orig
cd test-repo-1
sed -i 's/fun/malfun/' index.js
git checkout index.js  #UNDO
cd ..
(cd test-repo-1-orig && git log > log.txt && git ls-files --stage >> log.txt)
(cd test-repo-1 && git log > log.txt && git ls-files --stage >> log.txt)
# If diff finds any changes, this bash script stops with an error code.
# This is due to `set -e` at the top.
diff -U8 test-repo-1-orig/log.txt test-repo-1/log.txt
echo "PASS"
echo
rm -rf test-repo-1 test-repo-1-orig

echo "# Undelete"
git clone test-repo test-repo-2
cp -Rp test-repo-2 test-repo-2-orig
cd test-repo-2
rm -r test
