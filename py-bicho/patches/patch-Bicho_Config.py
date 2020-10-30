$NetBSD$

--- Bicho/Config.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/Config.py
@@ -22,13 +22,16 @@
 #
 # We should migrate to argparse. optparse is deprecated since Python 2.7
 
-from backends import Backend
-import info
+from .backends import Backend
+from .info import VERSION, DESCRIPTION
 from optparse import OptionGroup, OptionParser
 import os
 import pprint
 import sys
-from urllib2 import Request, urlopen, urlparse, URLError, HTTPError
+from urllib.error import HTTPError, URLError
+from urllib.request import urlopen, Request
+import urllib.parse
+
 
 
 class ErrorLoadingConfig(Exception):
@@ -51,16 +54,16 @@ class Config:
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
 
     @staticmethod        
     def load ():
         # FIXME: a hack to avoid circular dependencies. 
-        from utils import bicho_dot_dir, printout
+        from .utils import bicho_dot_dir, printout
 
         # First look in /etc
         # FIXME /etc is not portable
@@ -97,19 +100,19 @@ class Config:
             raise InvalidConfig('Backend "'+ Config.backend + '" does not exist')
 
 
-        url = urlparse.urlparse(Config.url)
-        check_url = urlparse.urljoin(url.scheme + '://' + url.netloc,'')
+        url = urllib.parse.urlparse(Config.url)
+        check_url = urllib.parse.urljoin(url.scheme + '://' + url.netloc,'')
         print("Checking URL: " + check_url)
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
             
                 
@@ -134,8 +137,8 @@ class Config:
         """
         """
         
-        parser = OptionParser(usage=usage, description=info.DESCRIPTION,
-                              version=info.VERSION)
+        parser = OptionParser(usage=usage, description=DESCRIPTION,
+                              version=VERSION)
 
         # General options
         parser.add_option('-b', '--backend', dest='backend',
@@ -220,5 +223,5 @@ class Config:
             Config.url=args[1]
 
         # Not remove config file options with empty default values
-        Config.__dict__.update(Config.clean_empty_options(options))
+        Config.__dict__(Config.clean_empty_options(options))
         Config.check_config ()
