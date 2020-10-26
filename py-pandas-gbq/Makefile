# $NetBSD$

DISTNAME=	pandas-gbq-0.14.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pandas-gbq/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/pydata/pandas-gbq/
COMMENT=	Interface to the Google BigQuery API from pandas
LICENSE=	modified-bsd

PYTHON_VERSIONS_INCOMPATIBLE=	27

DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-google-auth>=:../../math/py-google-auth
DEPENDS+=	${PYPKGPREFIX}-google-auth-oauthlib>=0.23.0:../../math/py-google-auth-oauthlib
DEPENDS+=	${PYPKGPREFIX}-google-cloud-bigquery>=:../../math/py-google-cloud-bigquery
DEPENDS+=	${PYPKGPREFIX}-data-google-auth>=:../../math/py-data-google-auth

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
