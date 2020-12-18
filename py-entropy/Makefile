# $NetBSD$

DISTNAME=	entropy-0.1.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=e/entropy/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/h4ck3rk3y/entropy
COMMENT=	Command line friend that helps you reduce entropy in your life
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-colorama>=0.4.3:../../comms/py-colorama
DEPENDS+=	${PYPKGPREFIX}-docopt>=0.6.2:../../devel/py-docopt

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
