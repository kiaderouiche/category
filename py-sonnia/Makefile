# $NetBSD$

DISTNAME=	sonnia-0.0.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/32/d1/3a3e216f79fcbbf4514fae735846f6a2c792050c6b67a8f66c161615c505/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/statbiophys/soNNia
COMMENT=	Infer and compute selection factors of CDR3 sequences
#LICENSE=	GPLv3 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: tensorflow>=2.1.0
DEPENDS+=	${PYPKGPREFIX}-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	# TODO: olga>=1.1.3
DEPENDS+=	${PYPKGPREFIX}-tqdm>=0:../../misc/py-tqdm
DEPENDS+=	${PYPKGPREFIX}-sonia>=0.0.35:../../category/py-sonia

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
