$NetBSD$

--- setup.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ setup.py
@@ -22,6 +22,7 @@
 #          Luis Cañas Díaz <lcanas@libresoft.es>
 #
 from distutils.core import setup
+import sys
 
 setup(name = "Bicho",
       version = "0.9",
@@ -31,5 +32,5 @@ setup(name = "Bicho",
       url = "https://projects.libresoft.es/projects/bicho",      
       packages = ['Bicho', 'Bicho.backends', 'Bicho.db',
                   'Bicho.post_processing'],
-      data_files = [('share/man/man1/',['doc/bicho.1'])],
-      scripts = ["bin/bicho"])
+      data_files = [('man/man1/',['doc/bicho.1'])],
+      scripts = ["bin/bicho"+sys.version[0:3]])
