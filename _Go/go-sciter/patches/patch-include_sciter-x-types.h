$NetBSD$

--- include/sciter-x-types.h.orig	2020-11-29 12:50:56.000000000 +0000
+++ include/sciter-x-types.h
@@ -75,6 +75,10 @@ enum GFX_LAYER
   #ifndef LINUX
   #define LINUX
   #endif
+#elif defined(__NetBSD__)
+  #ifndef NETBSD
+  #define NETBSD
+  #endif
 #else
   #error "This platform is not supported yet"
 #endif
