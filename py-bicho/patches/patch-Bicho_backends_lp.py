$NetBSD$

--- Bicho/backends/lp.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/backends/lp.py
@@ -25,11 +25,11 @@ import pwd
 from launchpadlib.launchpad import Launchpad
 from launchpadlib.credentials import Credentials
 
-from Bicho.backends import Backend
-from Bicho.Config import Config
-from Bicho.utils import printerr, printdbg, printout
-from Bicho.common import Tracker, People, Issue, Comment, Change, TempRelationship, Attachment
-from Bicho.db.database import DBIssue, DBBackend, get_database, NotFoundError
+from .Bicho.backends import Backend
+from .Bicho.Config import Config
+from .Bicho.utils import printerr, printdbg, printout
+from .Bicho.common import Tracker, People, Issue, Comment, Change, TempRelationship, Attachment
+from .Bicho.db.database import DBIssue, DBBackend, get_database, NotFoundError
 
 from storm.locals import DateTime, Int, Reference, Unicode, Desc
 from datetime import datetime
