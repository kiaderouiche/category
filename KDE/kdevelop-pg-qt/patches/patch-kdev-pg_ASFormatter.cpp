$NetBSD$

--- kdev-pg/ASFormatter.cpp.orig	2011-04-05 22:20:15.000000000 +0000
+++ kdev-pg/ASFormatter.cpp
@@ -336,7 +336,7 @@ string ASFormatter::nextLine()
         {
             ignoreStuff = false;
             string ret = "# ";
-            ret += QString::number(inLineNumber+2).toAscii().data();
+            ret += QString::number(inLineNumber+2).toLatin1().data();
             ret += " \"" + fileName + "\" 2";
             next
             if(hasMoreLines())
@@ -354,7 +354,7 @@ string ASFormatter::nextLine()
     {
         ignoreStuff = true;
         string ret = "# ";
-        ret += QString::number(inLineNumber+2).toAscii().data();
+        ret += QString::number(inLineNumber+2).toLatin1().data();
         ret += " \"" + fileName + "\"";
         next
         return ret;
