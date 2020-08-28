# $NetBSD$

DISTNAME=	copent-0.1.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/e1/10/a93aed30ae29c673ecb55e7bead98dfae1d2a23642be0989fac3a0c5e634/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/majianthu/pycopent
COMMENT=	Estimating Copula Entropy
LICENSE=	gnu-gpl-v3

DEPENDS+=	${PYPKGPREFIX}-scipy>=1.5.2:../../math/py-scipy

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=1.19.1
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
