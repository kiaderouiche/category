$NetBSD$

--- src/3rdparty/chromium/third_party/protobuf/post_process_dist.sh.orig	2020-05-06 14:21:29.000000000 +0000
+++ src/3rdparty/chromium/third_party/protobuf/post_process_dist.sh
@@ -15,7 +15,7 @@
 #    non-testdata .txt files are converted to Windows-style line endings.
 # 5) Cleans up after itself.
 
-if [ "$1" == "" ]; then
+if [ "$1" = "" ]; then
   echo "USAGE:  $0 DISTFILE" >&2
   exit 1
 fi
