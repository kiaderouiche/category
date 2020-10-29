$NetBSD$

--- Bicho/backends/allura.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/backends/allura.py
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
@@ -37,7 +37,7 @@ import random
 import sys
 import time
 import traceback
-import urllib
+import urllib.request
 import feedparser
 
 from storm.locals import DateTime, Desc, Int, Reference, Unicode, Bool
@@ -239,7 +239,7 @@ class Allura():
         bug_number = bug_url.split('/')[-1]
 
         try:
-            f = urllib.urlopen(bug_url)
+            f = urllib.request.urlopen(bug_url)
 
             # f = urllib.urlopen(bug_url) 
             json_ticket = f.read()
@@ -252,12 +252,12 @@ class Allura():
                     issue.add_change(c)                 
                 return issue
 
-            except Exception, e:
+            except Exception as e:
                 print "Problems with Ticket format: " + bug_number
                 print e
                 return None
     
-        except Exception, e:
+        except Exception as e:
             printerr("Error in bug analysis: " + bug_url);
             print(e)
             raise
@@ -374,10 +374,10 @@ class Allura():
         self.url_issues = Config.url + "/search/?limit=1"
         self.url_issues += "&q="
         # A time range with all the tickets
-        self.url_issues +=  urllib.quote("mod_date_dt:["+time_window+"]")
+        self.url_issues +=  urllib.request.quote("mod_date_dt:["+time_window+"]")
         printdbg("URL for getting metadata " + self.url_issues)
 
-        f = urllib.urlopen(self.url_issues)
+        f = urllib.request.urlopen(self.url_issues)
         ticketTotal = json.loads(f.read())
         
         total_issues = int(ticketTotal['count'])
@@ -401,7 +401,7 @@ class Allura():
 
             printdbg("URL for next issues " + self.url_issues) 
 
-            f = urllib.urlopen(self.url_issues)
+            f = urllib.request.urlopen(self.url_issues)
 
             ticketList = json.loads(f.read())
 
@@ -419,7 +419,7 @@ class Allura():
                     remaining -= 1
                     print "Remaining time: ", (remaining)*Config.delay/60, "m"
                     time.sleep(self.delay)
-                except Exception, e:
+                except Exception as e:
                     printerr("Error in function analyze_bug " + issue_url)
                     traceback.print_exc(file=sys.stdout)
                 except UnicodeEncodeError:
