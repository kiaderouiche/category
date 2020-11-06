$NetBSD$

--- src/3rdparty/chromium/v8/tools/run-llprof.sh.orig	2020-05-06 14:21:29.000000000 +0000
+++ src/3rdparty/chromium/v8/tools/run-llprof.sh
@@ -46,7 +46,7 @@ framework, then calls the low level tick
 EOF
 }
 
-if [ $# -eq 0 ] || [ "$1" == "-h" ]  || [ "$1" == "--help" ] ; then
+if [ $# -eq 0 ] || [ "$1" = "-h" ]  || [ "$1" = "--help" ] ; then
   usage
   exit 1
 fi
