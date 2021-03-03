# $NetBSD$

DISTNAME=	wurst-0.2.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=m/msrest/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/cmutel/wurst
COMMENT=	Wurst is a python package for linking and modifying industrial ecology models
#LICENSE=	BSD 3-clause # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-appdirs>=0:../../devel/py-appdirs
DEPENDS+=	# TODO: constructive_geometries>=0
DEPENDS+=	py-docopt>=0:../../devel/py-docopt
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	py-pandas>=0:../../math/py-pandas
DEPENDS+=	# TODO: python-json-logger>=0
DEPENDS+=	py-toolz>=0:../../devel/py-toolz
DEPENDS+=	py-tqdm>=0:../../misc/py-tqdm
DEPENDS+=	py-wrapt>=0:../../devel/py-wrapt

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
