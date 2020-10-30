$NetBSD$

--- Bicho/utils.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/utils.py
@@ -29,7 +29,7 @@ import sys
 import time
 import urllib
 
-from Config import Config
+from .Config import Config
 
 def printout (str = '\n'):
     if str != '\n':
@@ -76,7 +76,7 @@ def url_strip_protocol(url):
     return url[p:]
 
 def url_get_attr(url, attr=None):
-    query = urllib.splitquery(url)
+    query = urllib.parse.splitquery(url)
     try:
         if query[1] is None:
             return None;
@@ -104,8 +104,8 @@ _dirs = {}
 
 def create_dir(dir):
     try:
-        os.mkdir (dir, 0700)
-    except OSError, e:
+        os.mkdir(dir)
+    except OSError as e:
         if e.errno == errno.EEXIST:
             if not os.path.isdir (dir):
                 raise
