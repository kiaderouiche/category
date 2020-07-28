# $NetBSD$

DISTNAME=	mlabtex-0.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/48/9b/bb587d649aba1036237f5094a78193e111d26a5691adf717066fe955efe8/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/MuellerSeb/mlabtex
COMMENT=	mlabtex: A renderer for latex code in mayavi
LICENSE=	mit

DEPENDS+=	# TODO: mayavi>=4.5.0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.14.5
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
