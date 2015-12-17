#!/bin/bash

set -eu

git clone git@github.com:mrrrgn/glowing-guacamole.git puzzle-repo

cd puzzle-repo
git reset --hard 5c848ead46598c632ebc76b09c6d10965f90ffed^
git reset --soft 5c848ead46598c632ebc76b09c6d10965f90ffed^^
git reset lib/parse.js
git checkout lib/parse.js
sed -i "" 's/-evaluateExpression/-evaluateExpressoin/' lib/eval.js
git add lib/eval.js
sed -i "" 's/-evaluateExpressoin/-evaluateExpression/' lib/eval.js
git update-ref refs/remotes/origin/master 5c848ead46598c632ebc76b09c6d10965f90ffed^^
git prune --expire now
cd ..

zip -r puzzle-repo puzzle-repo
rm -rf puzzle-repo

