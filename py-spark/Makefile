# $NetBSD$

DISTNAME=	pyspark-${VERS}
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/${DISTNAME:S/${VERS}//}/}

MAINTAINER=	kamel.derouiche@gmail.com
HOMEPAGE=	https://github.com/apache/spark/tree/master/python
COMMENT=	Apache Spark Python API
LICENSE=	apache-2.0

VERS=		3.0.1

PYTHON_VERSIONS_INCOMPATIBLE=	27
#DEPENDS+=	${PYPKGPREFIX}-py4j>=0.10.90:

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
