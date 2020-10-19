$NetBSD$

--- src/Messages.sh.orig	2019-03-12 21:44:04.000000000 +0000
+++ src/Messages.sh
@@ -9,7 +9,7 @@ function find_files()
     while IFS='' read -r line ; do
         if echo "$line" | grep -q "${1}_LIB_SRCS" > /dev/null; then
             while IFS=' ' read -a file ; do
-                if [ "$file" == ")" ]; then
+                if [ "$file" = ")" ]; then
                     break
                 elif echo "$file" | grep -q "^\w*#" > /dev/null || [ ! -f "$file" ] || \
                      echo "$file" | grep -qv "\.cpp\w*$" > /dev/null; then
