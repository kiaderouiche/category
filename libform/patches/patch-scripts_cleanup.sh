$NetBSD$

--- scripts/cleanup.sh.orig	2018-11-21 06:20:16.000000000 +0000
+++ scripts/cleanup.sh
@@ -25,7 +25,7 @@ echo "Deleting $FILES"
 echo -n "Okay (y/n) : "
 read answer
 
-if [ x"$answer" == "xy" -o x"$answer" == "xY" ]
+if [ x"$answer" = "xy" -o x"$answer" = "xY" ]
 then
     rm -fr $FILES
 else
