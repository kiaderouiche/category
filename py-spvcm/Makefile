# $NetBSD$

DISTNAME=	spvcm-0.3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b4/c9/43fb98bc60728b76fceee175119a1ff7e5033ed9012d07570e34a2a19a8f/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ljwolf/spvcm
COMMENT=	Fit spatial multilevel models and diagnose convergence
#LICENSE=	3-Clause BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: scipy>=0
DEPENDS+=	# TODO: libpysal>=0
DEPENDS+=	# TODO: spreg>=0
DEPENDS+=	py-pandas>=0:../../math/py-pandas
DEPENDS+=	py-seaborn>=0:../../graphics/py-seaborn

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
