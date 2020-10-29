$NetBSD$

--- Bicho/backends/github.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/backends/github.py
@@ -19,16 +19,16 @@
 
 import sys
 import time
-import urllib2
+import urllib.request
 import base64
 import json
 
-from Bicho.backends import Backend
-from Bicho.Config import Config
-from Bicho.utils import printerr, printdbg, printout
-from Bicho.common import Tracker, People, Issue, Comment, Change, \
+from .Bicho.backends import Backend
+from .Bicho.Config import Config
+from .Bicho.utils import printerr, printdbg, printout
+from .Bicho.common import Tracker, People, Issue, Comment, Change, \
      TempRelationship, Attachment
-from Bicho.db.database import DBIssue, DBBackend, get_database
+from .Bicho.db.database import DBIssue, DBBackend, get_database
 
 from storm.locals import DateTime, Int, Reference, Unicode, Desc
 from datetime import datetime
@@ -479,10 +479,10 @@ class GithubBackend(Backend):
             '%s:%s' % (self.backend_user,
                        self.backend_password)).replace('\n', '')
 
-        request = urllib2.Request(url)
+        request = urllib.request.Request(url)
         request.add_header("Authorization", "Basic %s" % base64string)
 
-        result = urllib2.urlopen(request)
+        result = urllib.request.urlopen(request)
         content = result.read()
 
         events = json.loads(content)
@@ -495,10 +495,10 @@ class GithubBackend(Backend):
             '%s:%s' % (self.backend_user,
                        self.backend_password)).replace('\n', '')
 
-        request = urllib2.Request(url)
+        request = urllib.request.Request(url)
         request.add_header("Authorization", "Basic %s" % base64string)
 
-        result = urllib2.urlopen(request)
+        result = urllib.request.urlopen(request)
         content = result.read()
 
         comments = json.loads(content)
@@ -522,10 +522,10 @@ class GithubBackend(Backend):
             '%s:%s' % (self.backend_user,
                        self.backend_password)).replace('\n', '')
 
-        request = urllib2.Request(url)
+        request = urllib.request.Request(url)
         request.add_header("Authorization", "Basic %s" % base64string)
 
-        result = urllib2.urlopen(request)
+        result = urllib.request.urlopen(request)
         content = result.read()
 
         self.remaining_ratelimit = result.info()['x-ratelimit-remaining']
@@ -613,9 +613,9 @@ class GithubBackend(Backend):
                     printerr(
                         "UnicodeEncodeError: the issue %s couldn't be stored"
                         % (issue_data.issue))
-                except Exception, e:
+                except Exception as e:
                     printerr("ERROR: ")
-                    print e
+                    print (e)
 
                 time.sleep(self.delay)
 
