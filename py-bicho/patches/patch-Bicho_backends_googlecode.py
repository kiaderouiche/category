$NetBSD$

--- Bicho/backends/googlecode.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/backends/googlecode.py
@@ -20,12 +20,12 @@
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
@@ -38,7 +38,6 @@ import random
 import sys
 import time
 import traceback
-import urllib
 import feedparser
 
 from storm.locals import DateTime, Int, Reference, Unicode, Bool
@@ -226,7 +225,7 @@ class GoogleCode():
         d = feedparser.parse(self.url_issues)
                 
         total_issues = int(d['feed']['opensearch_totalresults'])
-        print "Total bugs: ", total_issues
+        print ("Total bugs: ", total_issues)
         if  total_issues == 0:
             printout("No bugs found. Did you provide the correct url?")
             sys.exit(0)
@@ -251,7 +250,7 @@ class GoogleCode():
                     remaining -= 1
                     print "Remaining time: ", (remaining)*Config.delay/60, "m", " issues ", str(remaining) 
                     time.sleep(Config.delay)
-                except Exception, e:
+                except Exception as e:
                     printerr("Error in function analyze_bug ")
                     pprint.pprint(entry)
                     traceback.print_exc(file=sys.stdout)
@@ -264,4 +263,4 @@ class GoogleCode():
                                             
         printout("Done. %s bugs analyzed" % (total_issues-remaining))
         
-Backend.register_backend('googlecode', GoogleCode)
\ No newline at end of file
+Backend.register_backend('googlecode', GoogleCode)
