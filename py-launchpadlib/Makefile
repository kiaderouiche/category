# $NetBSD$

DISTNAME=	launchpadlib-1.10.13
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	sysutils python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/dpath/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://help.launchpad.net/API/launchpadlib
COMMENT=	Script Launchpad through its web services interfaces
LICENSE=	gnu-lgpl-v3

DEPENDS+=	${PYPKGPREFIX}-httplib2>=0.18.1:../../www/py-httplib2
DEPENDS+=	${PYPKGPREFIX}-keyring>=21.2.1:../../security/py-keyring
DEPENDS+=	${PYPKGPREFIX}-lazr.restfulclient>=0.14.2:../..//py-lazr.restfulclient
DEPENDS+=	${PYPKGPREFIX}-lazr.uri>=1.0.3:../../wip/py-lazr.uri
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-testresources>=2.0.1:../../devel/py-testresources
DEPENDS+=	${PYPKGPREFIX}-wadllib-[0-9]*:../../wip/py-wadllib

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
