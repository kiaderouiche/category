$NetBSD$

--- Bicho/main.py.orig	2013-05-03 10:33:44.000000000 +0000
+++ Bicho/main.py
@@ -26,12 +26,12 @@
 import pprint
 import sys
 
-from Config import Config, ErrorLoadingConfig, InvalidConfig
+from .Config import Config, ErrorLoadingConfig, InvalidConfig
 
-from backends import Backend
-from utils import printerr, printdbg
+from .backends import Backend
+from .utils import printerr, printdbg
 
-from post_processing import IssueLogger
+from .post_processing import IssueLogger
 
 
 def main():
@@ -43,13 +43,13 @@ def main():
 
     try:
         Config.set_config_options(usage)
-    except (ErrorLoadingConfig, InvalidConfig), e:
+    except (ErrorLoadingConfig, InvalidConfig) as e:
         printerr(str(e))
         sys.exit(2)
 
     try:
         backend = Backend.create_backend(Config.backend)
-    except ImportError, e:
+    except ImportError as e:
         printerr("Backend ''" + Config.backend + "'' not exists. " + str(e))
         sys.exit(2)
     printdbg("Bicho object created, options and backend initialized")
@@ -57,7 +57,7 @@ def main():
 
     try:
         ilogger = IssueLogger.create_logger(Config.backend)
-    except ImportError, e:
+    except ImportError as e:
         printerr("Logger ''" + Config.backend + "'' doesn't exist. " + str(e))
         sys.exit(2)
     printdbg("Bicho logger object created")
