$NetBSD$

--- src/electronics/port.cpp.orig	2020-09-20 11:17:29.000000000 +0000
+++ src/electronics/port.cpp
@@ -22,7 +22,7 @@
 #include <sys/ioctl.h>
 #include <unistd.h>
 
-#if !defined(DARWIN) && !defined(__FreeBSD__)
+#if !defined(DARWIN) && !defined(__FreeBSD__) && !defined(__NetBSD__)
 #include <linux/ppdev.h>
 #endif
 
