#!/bin/sh

find . -name "work" -print -type d -exec rm -rf {} \;
find . -name "*.orig" -print -type f -exec rm -rf {} \;
find . -name "*.*~" -print -type f -exec rm -rf {} \;
