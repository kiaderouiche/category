# $NetBSD$

DISTNAME=	vmprof-0.4.15
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_PYPI:=v/vmprof/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://vmprof.com/
COMMENT=	Python vmprof client
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-colorama>=1.15.0:../../comms/py-colorama
DEPENDS+=	${PYPKGPREFIX}-requests>=1.15.0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-pytz>=1.15.0:../../time/py-pytz

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
