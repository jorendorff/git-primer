#!/bin/bash

set -eu

if [ -e test-repo ]; then
   echo "Directory exists: test-repo. Delete or rename before running this script."
   exit 1
fi

git init test-repo
cd test-repo

echo "# Test repository" > README.md
echo >> README.md
echo "This repository is for you to clone and mess around with." >> README.md
git add README.md
git commit -m readme

cat > index.js <<EOF
"use strict";
var app = require('express')();
var server = require('http').Server(app);
var io = require('slow.io')(server);
app.get('/', function (req, res) {
  res.sendFile(__dirname + "/index.html");
});
server.listen(3000, function () {});
EOF
git add index.js
git commit -m 'add index.js'

mkdir test
cd test

