$NetBSD$

--- Bicho/db/mysql.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/db/mysql.py
@@ -27,8 +27,8 @@ import warnings
 
 from storm.locals import Store, create_database
 
-from Bicho.Config import Config
-from Bicho.db.database import DBDatabase, DBTracker, DBPeople, \
+from .Bicho.Config import Config
+from .Bicho.db.database import DBDatabase, DBTracker, DBPeople, \
     DBIssue, DBIssuesWatchers, DBIssueRelationship, DBComment, DBAttachment, \
     DBChange, DBSupportedTracker, DBIssueTempRelationship
 
