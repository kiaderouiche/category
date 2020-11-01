$NetBSD$

--- setup.py.orig	2020-08-28 07:28:53.000000000 +0000
+++ setup.py
@@ -197,7 +197,7 @@ try:
         },
         package_data={
             'pyspark.jars': ['*.jar'],
-            'pyspark.bin': ['*'],
+            'pyspark.bin': ['beeline','docker-image-tool.sh','find-spark-home','load-spark-env.sh','pyspark','run-example','spark-class','spark-shell','spark-sql','spark-submit','sparkR'],
             'pyspark.sbin': ['spark-config.sh', 'spark-daemon.sh',
                              'start-history-server.sh',
                              'stop-history-server.sh', ],
