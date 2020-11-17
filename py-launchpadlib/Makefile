# $NetBSD$

DISTNAME=	launchpadlib-1.10.13
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	sysutils python
MASTER_SITES=	${MASTER_SITE_PYPI:=d/dpath/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://help.launchpad.net/API/launchpadlib
COMMENT=	Script Launchpad through its web services interfaces.  Officially supported
#LICENSE=	LGPL v3 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-httplib2>=0:../../www/py-httplib2
DEPENDS+=	${PYPKGPREFIX}-keyring>=0:../../security/py-keyring
DEPENDS+=	${PYPKGPREFIX}-lazr.restfulclient>=0.9.19:../../wip/py-lazr.restfulclient
DEPENDS+=	${PYPKGPREFIX}-lazr.uri>=0:../../wip/py-lazr.uri
DEPENDS+=	${PYPKGPREFIX}-six>=0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-testresources>=0:../../devel/py-testresources
DEPENDS+=	${PYPKGPREFIX}-wadllib>=0:../../wip/py-wadllib

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
