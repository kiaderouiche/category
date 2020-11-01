# $NetBSD$

DISTNAME=	pyspark-${VERS}
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	devel python
MASTER_SITES=   ${MASTER_SITE_PYPI:=p/pyspark/}

MAINTAINER=	kamel.derouiche@gmail.com
HOMEPAGE=	https://github.com/apache/spark/tree/master/python
COMMENT=	Apache Spark Python API
LICENSE=	apache-2.0

VERS=		3.0.1
USE_TOOLS+=	bash

PYTHON_VERSIONS_INCOMPATIBLE=	27
DEPENDS+=	${PYPKGPREFIX}-py4j>=0.10.9.1:../../wip/py-py4j

USE_LANGUAGES=	# none

REPLACE_BASH+=	\
	deps/bin/beeline		\
	deps/bin/docker-image-tool.sh	\
	deps/bin/find-spark-home	\
	deps/bin/load-spark-env.sh	\
	deps/bin/pyspark		\
	deps/bin/run-example		\
	deps/bin/spark-class		\
	deps/bin/spark-shell		\
	deps/bin/spark-sql		\
	deps/bin/spark-submit		\
	deps/bin/sparkR

REPLACE_BASH+=	\
	deps/sbin/spark-daemon.sh	 \
	deps/sbin/start-history-server.sh \
	deps/sbin/stop-history-server.sh

SUBST_CLASSES+=         prefix
SUBST_STAGE.prefix=     pre-configure
SUBST_MESSAGE.prefix=   Setting path to PREFIX in source files.
SUBST_FILES.prefix+=    deps/bin/beeline
SUBST_FILES.prefix+=    deps/bin/docker-image-tool.sh
SUBST_FILES.prefix+=    deps/bin/find-spark-home
SUBST_FILES.prefix+=    deps/bin/find_spark_home.py
SUBST_FILES.prefix+=    deps/bin/load-spark-env.sh
SUBST_FILES.prefix+=    deps/bin/pyspark
SUBST_FILES.prefix+=    deps/bin/run-example
SUBST_FILES.prefix+=    deps/bin/spark-class
SUBST_FILES.prefix+=    deps/bin/spark-shell
SUBST_FILES.prefix+=    deps/bin/spark-sql
SUBST_FILES.prefix+=    deps/bin/spark-submit
SUBST_FILES.prefix+=    deps/bin/sparkR
SUBST_SED.prefix+=      -e "s|/usr/lib/ladspa|${PREFIX}/lib/ladspa|g"
SUBST_SED.prefix+=      -e "s|/usr/share/ladspa|${PREFIX}/share/ladspa|g"

post-extract:
	${RM} -f ${WRKSRC}/deps/bin/*.cmd


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
