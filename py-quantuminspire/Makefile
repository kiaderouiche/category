# $NetBSD$

DISTNAME=	quantuminspire-1.3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/33/54/861780f3164428a20c336385ae0941882fb20b3464bec315eae1dfa004b0/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://files.pythonhosted.org/packages/33/54/861780f3164428a20c336385ae0941882fb20b3464bec315eae1dfa004b0/
COMMENT=	SDK for the Quantum Inspire platform
LICENSE=	apache-2.0

DEPENDS+=	# TODO: pytest>=3.3.1
DEPENDS+=	py-coverage>=4.5.1:../../devel/py-coverage
DEPENDS+=	py-matplotlib>=2.1:../../graphics/py-matplotlib
DEPENDS+=	# TODO: pylatexenc>=0
DEPENDS+=	# TODO: coreapi>=2.3.3
DEPENDS+=	# TODO: jupyter>=0
DEPENDS+=	# TODO: nbimporter>=0
DEPENDS+=	# TODO: sklearn>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.17
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
