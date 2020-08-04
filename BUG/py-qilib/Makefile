# $NetBSD$

DISTNAME=	qilib-0.3.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/bb/df/65538f69f24053ac9f88ebd6ec19388346a5d947e73f508717e0a6d5345a/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://files.pythonhosted.org/packages/bb/df/65538f69f24053ac9f88ebd6ec19388346a5d947e73f508717e0a6d5345a/
COMMENT=	Quantum Library for the Quantum Inspire platform
#LICENSE=	Other/Proprietary License # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	# TODO: pytest>=3.3.1
BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage>=4.5.1:../../devel/py-coverage
BUILD_DEPENDS+=	# TODO: mongomock>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-mypy>=0:../../lang/py-mypy

DEPENDS+=	# TODO: spirack>=0.1.8
DEPENDS+=	# TODO: serialize>=0
DEPENDS+=	# TODO: zhinst>=0
DEPENDS+=	# TODO: pymongo>=0
DEPENDS+=	${PYPKGPREFIX}-requests>=0:../../devel/py-requests
DEPENDS+=	# TODO: qcodes>=0
DEPENDS+=	# TODO: qcodes_contrib_drivers>=0
DEPENDS+=	# TODO: dataclasses-json>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
