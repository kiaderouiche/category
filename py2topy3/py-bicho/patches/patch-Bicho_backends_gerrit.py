$NetBSD$

--- Bicho/backends/gerrit.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/backends/gerrit.py
@@ -19,12 +19,12 @@
 # Authors:  Alvaro del Castillo <acs@bitergia.com>
 #
 
-from Bicho.Config import Config
+from .Bicho.Config import Config
 
-from Bicho.backends import Backend
-from Bicho.utils import create_dir, printdbg, printout, printerr
-from Bicho.db.database import DBIssue, DBBackend, get_database
-from Bicho.common import Tracker, Issue, People, Change
+from .Bicho.backends import Backend
+from .Bicho.utils import create_dir, printdbg, printout, printerr
+from .Bicho.db.database import DBIssue, DBBackend, get_database
+from .Bicho.common import Tracker, Issue, People, Change
 
 from dateutil.parser import parse
 from datetime import datetime
@@ -37,7 +37,6 @@ import random
 import sys
 import time
 import traceback
-import urllib
 import feedparser
 
 from storm.locals import DateTime, Desc, Int, Reference, Unicode, Bool
@@ -188,7 +187,7 @@ class Gerrit():
         except Exception, e:
             print "Problems with Review format: " + review['number']
             pprint.pprint(review)           
-            print e
+            print (e)
             return None
     
         
@@ -363,4 +362,4 @@ class Gerrit():
 
         print("Done. Number of reviews: " + str(total_reviews))
         
-Backend.register_backend('gerrit', Gerrit)
\ No newline at end of file
+Backend.register_backend('gerrit', Gerrit)
