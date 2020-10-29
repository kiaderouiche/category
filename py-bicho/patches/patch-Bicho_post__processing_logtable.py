$NetBSD$

--- Bicho/post_processing/logtable.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/post_processing/logtable.py
@@ -30,13 +30,13 @@ import traceback
 
 from BeautifulSoup import BeautifulSoup
 from BeautifulSoup import Comment as BFComment
-from Bicho.backends import Backend
-from Bicho.backends.bg import DBBugzillaIssueExt
-from Bicho.backends.jira import DBJiraIssueExt
-from Bicho.Config import Config
-from Bicho.utils import printerr, printdbg, printout
-from Bicho.common import Tracker, People, Issue, Comment, Change
-from Bicho.db.database import DBIssue, DBBackend, get_database, DBTracker, \
+from .Bicho.backends import Backend
+from .Bicho.backends.bg import DBBugzillaIssueExt
+from .Bicho.backends.jira import DBJiraIssueExt
+from .Bicho.Config import Config
+from .Bicho.utils import printerr, printdbg, printout
+from .Bicho.common import Tracker, People, Issue, Comment, Change
+from .Bicho.db.database import DBIssue, DBBackend, get_database, DBTracker, \
      DBPeople, DBChange
 
 from storm.locals import DateTime, Int, Reference, Unicode, Desc, Asc, Store, \
@@ -47,7 +47,7 @@ import xml.sax.handler
 from dateutil.parser import parse
 from datetime import datetime
 
-from Bicho.Config import Config
+from .Bicho.Config import Config
 
 __sql_table_bugzilla__ = 'CREATE TABLE IF NOT EXISTS issues_log_bugzilla ( \
                      id INTEGER NOT NULL AUTO_INCREMENT, \
