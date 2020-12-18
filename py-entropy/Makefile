# $NetBSD$

DISTNAME=	entropy-0.1.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/58/69/0417391d23a1407395e6b63ff7a38f2a4978eec18d0629b89b6e21eba1e3/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/h4ck3rk3y/entropy
COMMENT=	entropy is a command line friend that helps you reduce entropy in your life
LICENSE=	mit

DEPENDS+=	py-colorama>=0.4.3:../../comms/py-colorama
DEPENDS+=	py-docopt>=0.6.2:../../devel/py-docopt
DEPENDS+=	py-setuptools>=42.0.2:../../devel/py-setuptools

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
