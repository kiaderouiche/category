# $NetBSD$

DISTNAME=	executor-23.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	https://files.pythonhosted.org/packages/c3/1f/978d19bdf45cd52da008cd5f9c4dd9fe2931eb4d3dbc47e8dfba9e9b9868/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://executor.readthedocs.io
COMMENT=	Programmer friendly subprocess wrapper
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-coloredlogs>=3.5:../../category/py-coloredlogs
DEPENDS+=	${PYPKGPREFIX}-fasteners>=0.14.1:../../devel/py-fasteners
DEPENDS+=	${PYPKGPREFIX}-humanfriendly>=8.0:../../category/py-humanfriendly
DEPENDS+=	# TODO: property-manager>=3.0
DEPENDS+=	${PYPKGPREFIX}-six>=1.9.0:../../lang/py-six
#TEST_DEPENDS+=	${PYPKGPREFIX}-virtualenv>=0:../../devel/py-virtualenv

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
