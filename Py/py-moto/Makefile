# $NetBSD$

VERS=		1.3.16
DISTNAME=	moto-${VERS}
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_PYPI:=m/${DISTNAME:S/${VERS}//}/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://files.pythonhosted.org/packages/a3/f4/d7052895a582a14ef7539afbc17c8620b313f41d110298cc35e34218f6fa/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-test>=6.0.2:../../devel/py-test
DEPENDS+=       ${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-xmltodict>=0.12.0:../../textproc/py-xmltodict
DEPENDS+=       ${PYPKGPREFIX}-requests>=2.24.0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-responses>=0.12.0:../../net/py-responses
DEPENDS+=	${PYPKGPREFIX}-markupsafe=1.1.1:../../textproc/py-markupsafe
DEPENDS+=	${PYPKGPREFIX}-test>=6.0.2:../../devel/py-test
DEPENDS+=	${PYPKGPREFIX}-test>=6.0.2:../../devel/py-test

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
