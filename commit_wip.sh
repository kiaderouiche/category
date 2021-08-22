#!/bin/sh

pkg=$1

git add .
git commit -m "Import wip/$pkg to wip"
git push
