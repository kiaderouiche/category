# $NetBSD$

DISTNAME=	magic_docker-0.0.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/c0/81/0e852e991f40e992b70482486a943b766ba26891d822b06942da00b4ac26/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/BabakEA/magic_docker
COMMENT=	Automated Docker-Image-Builder Extention for Docker
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-nose>=1.3.7:../../devel/py-nose
DEPENDS+=	# TODO: stdlib_list>=0.6.0
DEPENDS+=	# TODO: ipywidgets==7.5.1>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.18.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
