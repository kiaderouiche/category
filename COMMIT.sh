#!/bin/sh

git add . && git status && git commit -m "ADD/REMOVE/UPDATE PKG/PKGS, SET {LICENSE, CATEGORY, MAINTAINER, HOMEPAGE, COMMENT, MAKEFILE}, RENAME PKGS/PKGS, ADDED NEW DEPENDENCE/S, ADDED PATCHES, REMOVE PATCHES_ORIG,CLEAN WORKDIR,DONE PKG/PKGS, MOVE TO DONE, MOVE TO WIP" && git push
