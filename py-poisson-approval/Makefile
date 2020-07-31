# $NetBSD$

VERSION=	0.26.0
DISTNAME=	poisson_approval-0.26.0
PKGNAME=	${PYPKGPREFIX}-poisson-approval-${VERSION}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/20/c1/4e996c171f7c7e06258f95b1671096f935a506589ed5ab1d881d6c2304ca/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/francois-durand/poisson_approval
COMMENT=	Poisson Approval studies the Poisson Game of Approval Voting
#LICENSE=	GNU General Public License v3 # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	# TODO: pytest-runner>=0
DEPENDS+=	py-scipy>=0:../../math/py-scipy
DEPENDS+=	py-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	# TODO: python-ternary>=0
DEPENDS+=	# TODO: shapely>=0
DEPENDS+=	py-sympy>=0:../../math/py-sympy
TEST_DEPENDS+=	# TODO: pytest>=3

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
