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

REPLACE_BASH+=	deps/sbin/spark-daemon.sh
REPLACE_BASH+=	deps/sbin/start-history-server.sh
REPLACE_BASH+=	deps/sbin/stop-history-server.sh

post-extract:
	${RM} -f ${WRKSRC}/deps/bin/*.cmd


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
