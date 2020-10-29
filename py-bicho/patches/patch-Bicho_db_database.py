$NetBSD$

--- Bicho/db/database.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/db/database.py
@@ -29,8 +29,8 @@ import datetime
 from storm.exceptions import IntegrityError # DatabaseError,
 from storm.locals import DateTime, Int, Reference, Unicode
 
-from Bicho.utils import printdbg
-from Bicho.Config import Config
+from .Bicho.utils import printdbg
+from .Bicho.Config import Config
 
 
 class NotFoundError(Exception):
