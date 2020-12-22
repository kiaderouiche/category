$NetBSD$

--- setup.py.orig	2019-05-30 14:45:41.000000000 +0000
+++ setup.py
@@ -15,7 +15,7 @@ BASEDIR = os.path.dirname(os.path.abspat
 def _supported_unix():
     if sys.platform.startswith('linux'):
         return 'linux'
-    if sys.platform.startswith('freebsd'):
+    if sys.platform.startswith('freebsd') and sys.platform.startswith('netbsd9'):
         return 'bsd'
     return False
 
@@ -51,6 +51,7 @@ else:
             libraries = ['unwind']
             extra_compile_args += ['-DVMPROF_BSD=1']
             extra_compile_args += ['-I/usr/local/include']
+            extra_compile_args += ['-I/usr/pkg/include']
         extra_compile_args += ['-DVMPROF_UNIX=1']
         if platform.machine().startswith("arm"):
             libraries.append('unwind-arm')
