# $NetBSD$

DISTNAME=	pandera-0.4.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/c4/4d/827e90f91f5236914039955252154026d27ad58c53cb0cd2e35acf322404/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/pandera-dev/pandera
COMMENT=	A light-weight and flexible validation package for pandas data structures
LICENSE=	mit

DEPENDS+=	py-pandas>=0.23.0:../../math/py-pandas
DEPENDS+=	py-wrapt>=0:../../devel/py-wrapt
DEPENDS+=	# TODO: pyyaml>=5.1
DEPENDS+=	# TODO: scipy;python_version>='3.5'
DEPENDS+=	# TODO: black;python_version>'3.5'
DEPENDS+=	# TODO: autopep8;python_version=='3.5'>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.9.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
