# $NetBSD$

DISTNAME=	sonia-0.0.45
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b5/e6/a27d04e19d44d8325cd829ce3f46aa61f2a0839e7820226bb4337397bf4e/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/statbiophys/SONIA
COMMENT=	Infer and compute selection factors of CDR3 sequences
#LICENSE=	GPLv3 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: tensorflow>=2.1.0
DEPENDS+=	${PYPKGPREFIX}-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	# TODO: olga>=1.2.3
DEPENDS+=	${PYPKGPREFIX}-tqdm>=0:../../misc/py-tqdm

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
