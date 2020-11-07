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



SUBST_CLASSES+=                 py_interpreter
SUBST_STAGE.py_interpreter=     post-extract
SUBST_FILES.py_interpreter+=	deps/bin/find-spark-home
SUBST_SED.py_interpreter=       -e "s,python,python${PYVERSSUFFIX},g"

post-extract:
	${RM} -f ${WRKSRC}/deps/bin/*.cmd


.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
