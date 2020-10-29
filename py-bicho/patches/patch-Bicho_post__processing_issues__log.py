$NetBSD$

--- Bicho/post_processing/issues_log.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/post_processing/issues_log.py
@@ -30,11 +30,11 @@ import traceback
 
 from BeautifulSoup import BeautifulSoup
 from BeautifulSoup import Comment as BFComment
-from Bicho.backends import Backend
-from Bicho.Config import Config
-from Bicho.utils import printerr, printdbg, printout
-from Bicho.common import Tracker, People, Issue, Comment, Change
-from Bicho.db.database import DBIssue, DBBackend, get_database, DBTracker,\
+from .Bicho.backends import Backend
+from .Bicho.Config import Config
+from .Bicho.utils import printerr, printdbg, printout
+from .Bicho.common import Tracker, People, Issue, Comment, Change
+from .Bicho.db.database import DBIssue, DBBackend, get_database, DBTracker,\
      DBPeople
 from storm.locals import DateTime, Int, Reference, Unicode, Desc, Store, \
      create_database
@@ -44,7 +44,7 @@ import xml.sax.handler
 from dateutil.parser import parse
 from datetime import datetime
 
-from Bicho.Config import Config
+from .Bicho.Config import Config
 
 
 class DBIssuesLog(object):
