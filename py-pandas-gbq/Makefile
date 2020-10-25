# $NetBSD$

VERS=		0.14.0
DISTNAME=	pandas-gbq-${VERS}
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_PYPI:=g/${DISTNAME:S/${VERS}//}/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/pydata/pandas-gbq/
COMMENT=	TODO: Short description of the package
LICENSE=	modified-bsd

PYTHON_VERSIONS_INCOMPATIBLE=	27

DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-google-auth>=:../../math/py-google-auth
DEPENDS+=	${PYPKGPREFIX}-google-auth-oauthlib>=0.23.0:../../math/py-google-auth-oauthlib
DEPENDS+=	${PYPKGPREFIX}-google-cloud-bigquery>=:../../math/py-google-cloud-bigquery
DEPENDS+=	${PYPKGPREFIX}-data-google-auth>=:../../math/py-data-google-auth

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
