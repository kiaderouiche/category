$NetBSD$

--- pymlstats/__init__.py.orig	2014-02-16 07:21:22.000000000 +0000
+++ pymlstats/__init__.py
@@ -42,9 +42,9 @@ credits = "%s\n%s\n" % (name, author)
 
 
 def usage():
-    print credits
-    print "Usage: %s [options] [URL1] [URL2] ... [URLn]" % (sys.argv[0])
-    print """
+    print (credits)
+    print ("Usage: %s [options] [URL1] [URL2] ... [URLn]".format((sys.argv[0]))
+    print ("""
     where URL1, URL2, ...., URLn are the urls of the archive web pages
     of the mailing list. If they are a local dir instead of a remote URL,
     the directory will be recursively scanned for mbox files.
@@ -93,7 +93,7 @@ Database options:
                        (default is root)
   --db-admin-password  Password to create the mlstats database
                        (default is empty)
-"""
+""")
 
 
 def start():
