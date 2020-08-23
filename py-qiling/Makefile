# $NetBSD$

DISTNAME=	qiling-1.1.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/1d/25/beb5ac1aa8de23c084aaed2588b171a187a5fd9a303cd79ddb24f3b061e6/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://qiling.io
COMMENT=	Qiling is an advanced binary emulation framework that cross-platform-architecture
#LICENSE=	GPLv2 # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-capstone>=4.0.1:../../devel/py-capstone
DEPENDS+=	${PYPKGPREFIX}-unicorn>=1.0.2rc4:../../emulators/py-unicorn
DEPENDS+=	${PYPKGPREFIX}-pefile>=2019.4.18:../../sysutils/py-pefile
DEPENDS+=	# TODO: python-registry>=1.3.1
DEPENDS+=	# TODO: keystone-engine>=0.9.2
DEPENDS+=	${PYPKGPREFIX}-pyelftools>=0.26:../../devel/py-pyelftools
DEPENDS+=	# TODO: python-magic>=0.4.16

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
