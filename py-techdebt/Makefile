# $NetBSD$

DISTNAME=	techdebt-0.1.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=g/git_code_debt/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/lcetinsoy/tech-debt
COMMENT=	A technical debt tracker package
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	py-pandas>=0:../../math/py-pandas

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
