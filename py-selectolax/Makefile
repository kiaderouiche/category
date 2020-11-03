# $NetBSD$

DISTNAME=	selectolax-0.2.9
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f4/91/8844d61b2129ebc36baba795d6ea41107ed85bb88c6acdcb2ff34e64c397/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/rushter/selectolax
COMMENT=	Fast HTML5 parser with CSS selectors
LICENSE=	mit

TEST_DEPENDS+=	# TODO: pytest>=0

USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	modest/modest.pc.in

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
