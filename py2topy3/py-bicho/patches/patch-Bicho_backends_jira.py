$NetBSD$

--- Bicho/backends/jira.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/backends/jira.py
@@ -22,18 +22,18 @@
 #          Alvaro del Castillo <acs@bitergia.com>
 
 import datetime
-import urllib
+import urllib.request
 import time
 import sys
 
 from storm.locals import Int, DateTime, Unicode, Reference, Desc
 
 from dateutil.parser import parse
-from Bicho.common import Issue, People, Tracker, Comment, Change, Attachment
-from Bicho.backends import Backend
-from Bicho.db.database import DBIssue, DBBackend, DBTracker, get_database
-from Bicho.Config import Config
-from Bicho.utils import printout, printerr, printdbg
+from .Bicho.common import Issue, People, Tracker, Comment, Change, Attachment
+from .Bicho.backends import Backend
+from .Bicho.db.database import DBIssue, DBBackend, DBTracker, get_database
+from .Bicho.Config import Config
+from .Bicho.utils import printout, printerr, printdbg
 from BeautifulSoup import BeautifulSoup, Tag, NavigableString 
 #from BeautifulSoup import NavigableString
 from BeautifulSoup import Comment as BFComment
@@ -763,7 +763,7 @@ class BugsHandler(xml.sax.handler.Conten
 
         bug_activity_url = bug.link + '?page=com.atlassian.jira.plugin.system.issuetabpanels%3Achangehistory-tabpanel'
         printdbg("Bug activity: " + bug_activity_url)
-        data_activity = urllib.urlopen(bug_activity_url).read()
+        data_activity = urllib.request.urlopen(bug_activity_url).read()
         parser = SoupHtmlParser(data_activity, bug.key_id)
         changes = parser.parse_changes()
         for c in changes:
@@ -810,7 +810,7 @@ class JiraBackend(Backend):
         oneBug = self.basic_jira_url()
         oneBug += "&tempMax=1"
         printdbg("Getting number of issues: " + oneBug)
-        data_url = urllib.urlopen(oneBug).read()
+        data_url = urllib.request.urlopen(oneBug).read()
         bugs = data_url.split("<issue")[1].split('\"/>')[0].split("total=\"")[1]
         return int(bugs)
 
@@ -824,7 +824,7 @@ class JiraBackend(Backend):
             )
         
     def safe_xml_parse(self, url_issues, handler):
-        f = urllib.urlopen(url_issues)
+        f = urllib.request.urlopen(url_issues)
         parser = xml.sax.make_parser()
         parser.setContentHandler(handler)
 
