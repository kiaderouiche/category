# $NetBSD$

DISTNAME=	bpytop-1.0.50
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/ba/df/8d73c1134944116f96cd13cb82bf0295e0d1832450b783b023764b00d5a1/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/aristocratos/bpytop
COMMENT=	Resource monitor that shows usage and stats for processor, memory, disks, network and processes
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-psutil>=5.7.0,<6.0.0:../../sysutils/py-psutil

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
