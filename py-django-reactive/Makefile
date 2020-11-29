# $NetBSD$

DISTNAME=	django-reactive-0.0.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/django-reactive/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/tyomo4ka/django-reactive
COMMENT=	Django JSON form field on steroids using react-json-schema-form
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-psycopg2-binary>=2.7,<3.0:../../textproc/py-psycopg2-binary
DEPENDS+=	${PYPKGPREFIX}-test-cov>=2.10.1:../../devel/py-test-cov
DEPENDS+=	${PYPKGPREFIX}-test-django>=4.1.0:../../devel/py-test-django
DEPENDS+=	${PYPKGPREFIX}-test>=6.1.2:../../devel/py-test
DEPENDS+=	${PYPKGPREFIX}-jsonschema>=3.0:../../textproc/py-jsonschema
DEPENDS+=	${PYPKGPREFIX}-django>=2.2:../../www/py-django

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
