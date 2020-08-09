$NetBSD$

--- kate/tests/highlight.sh.orig	2020-04-10 23:08:30.000000000 +0000
+++ kate/tests/highlight.sh
@@ -159,7 +159,7 @@ make  destdir=/usr/
 
 # [[ and [ correctly need spaces to be regarded as structure,
 # otherwise they are patterns (currently treated as normal text)
-if [ "$p" == "" ] ; then
+if [ "$p" = "" ] ; then
 	ls /usr/bin/[a-z]*
 elif [[ $p == 0 ]] ; then
 	ls /usr/share/$p
