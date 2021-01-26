# $NetBSD$

VERSION=	1.1.5
DISTNAME=	susyai
PKGNAME=	susyai-${VERSION}
CATEGORIES=	benchmark
MASTER_SITES=	https://susyai.hepforge.org/downloads/
EXTRACT_SUFX=	.tar

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://susyai.hepforge.org/
COMMENT=	The Supersymmetric Artificial Intelligence Package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/examples

DEPENDS+=	${PYPKGPREFIX}-scikit-learn>=0.22.1:../../math/py-scikit-learn

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
