# $NetBSD$

DISTNAME=	Mesa-0.8.8.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/8a/fa/218a3ff0ede43b18356a7c9de44fc922b7ac32a2856ea27ece439fe8eb6c/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/projectmesa/mesa
COMMENT=	Agent-based modeling (ABM) in Python 3+
LICENSE=	apache-2.0

BUILD_DEPENDS+=	${PYPKGPREFIX}-coverage>=0:../../devel/py-coverage
BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=0:../../devel/py-flake8
BUILD_DEPENDS+=	# TODO: pytest>=4.6
BUILD_DEPENDS+=	# TODO: pytest-cov>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-sphinx>=0:../../textproc/py-sphinx
DEPENDS+=	${PYPKGPREFIX}-click>=0:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-cookiecutter>=0:../../devel/py-cookiecutter
DEPENDS+=	${PYPKGPREFIX}-networkx>=0:../../math/py-networkx
DEPENDS+=	${PYPKGPREFIX}-pandas>=0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-tornado>=0:../../www/py-tornado
DEPENDS+=	${PYPKGPREFIX}-tqdm>=0:../../misc/py-tqdm

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
