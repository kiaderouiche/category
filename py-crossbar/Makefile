# $NetBSD$

DISTNAME=	crossbar-20.8.1
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_PYPI:=d/crossbar/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://crossbar.io/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-scour>=0.38.2:../../wip/py-scour
DEPENDS+=	${PYPKGPREFIX}-keyring>=21.2.1:../../security/py-keyring
DEPENDS+=	${PYPKGPREFIX}-lazr.restfulclient>=0.14.3:../../wip/py-lazr.restfulclient
DEPENDS+=	${PYPKGPREFIX}-lazr.uri>=1.0.3:../../wip/py-lazr.uri
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-testresources>=2.0.1:../../devel/py-testresources
DEPENDS+=	${PYPKGPREFIX}-wadllib-[0-9]*:../../wip/py-wadllib

.include "../../lang/python/distutils.mk"
.include "../../mk/bsd.pkg.mk"
