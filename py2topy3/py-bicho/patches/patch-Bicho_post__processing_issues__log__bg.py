$NetBSD$

--- Bicho/post_processing/issues_log_bg.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/post_processing/issues_log_bg.py
@@ -19,8 +19,8 @@
 #
 #
 
-from Bicho.post_processing import IssueLogger
-from issues_log import *
+from .Bicho.post_processing import IssueLogger
+from .issues_log import *
 
 __sql_drop__ = 'DROP TABLE IF EXISTS issues_log_bugzilla;'
 
