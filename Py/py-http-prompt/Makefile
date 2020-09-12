# $NetBSD$

DISTNAME=	http-prompt-1.0.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/55/aa/5039344dea3f1db6b9ed883378374b867aae605f21734d5de49c206e9f18/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/eliangcs/http-prompt
COMMENT=	An interactive HTTP command-line client
LICENSE=	mit

DEPENDS+=	py-click>=5.0:../../devel/py-click
DEPENDS+=	py-httpie>=0.9.2:../../www/py-httpie
DEPENDS+=	# TODO: parsimonious>=0.6.2
DEPENDS+=	# TODO: prompt-toolkit>=1.0.0,<2.0.0
DEPENDS+=	# TODO: Pygments>=2.1.0
DEPENDS+=	py-six>=1.10.0:../../lang/py-six

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
