$NetBSD$

--- Bicho/Config.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/Config.py
@@ -51,9 +51,9 @@ class Config:
     def load_from_file (config_file):
         try:
             f = open (config_file, 'r')
-            exec f in Config.__dict__
+            exec (f in Config.__dict__)
             f.close ()
-        except Exception, e:
+        except Exception as e:
             raise ErrorLoadingConfig ("Error reading config file %s (%s)" % (\
                     config_file, str (e)))
 
@@ -103,13 +103,13 @@ class Config:
         req = Request(check_url)
         try:
             response = urlopen(req)
-        except HTTPError, e:
+        except HTTPError as e:
             raise InvalidConfig('The server could not fulfill the request '
                                + str(e.msg) + '('+ str(e.code)+')')
-        except URLError, e:
+        except URLError as e:
             raise InvalidConfig('We failed to reach a server. ' + str(e.reason))
         
-        except ValueError, e:
+        except ValueError as e:
             print ("Not an URL: "  + Config.url)
             
                 
