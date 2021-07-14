# $NetBSD$

DISTNAME=	giotto-ph-0.1.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
GITHUB_PROJECT=	giotto-ph
GITHUB_TAG=	refs/tags/v0.1.0
CATEGORIES=	math
MASTER_SITES=	${MASTER_SITE_GITHUB:=giotto-ai/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/giotto-ai/giotto-ph/
COMMENT=	High performance tool for Persistent Homology computations
LICENSE=	gnu-agpl-v3

DEPENDS+=	${PYPKGPREFIX}-scipy>=1.5.0:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-scikit-learn>=0.23.1:../../math/py-scikit-learn

CMAKE_USE=	yes

BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
