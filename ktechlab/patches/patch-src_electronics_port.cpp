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
 
@@ -264,7 +264,7 @@ const int INPUT_MODE_BIT = 1 << 21; // C
 
 // No code using these values will be reached on Darwin, this is just to
 // keep the preprocessor happy.
-#if defined(DARWIN) || defined(__FreeBSD__)
+#if defined(DARWIN) || defined(__FreeBSD__) || defined(__NetBSD__)
 	#define PPRDATA		0xFACADE
 	#define PPRCONTROL	0xC001D00D
 	#define PPWDATA		0xC0EDBABE
