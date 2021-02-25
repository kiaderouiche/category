# $NetBSD$

DISTNAME=	sylajone-0.3.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/95/bc/50239a8953f185d6dbb0cced4988e6b1a396b358ceada871657a1156e58c/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://sylajone.sourceforge.net/
COMMENT=	Sylajone: Arabic syntax Analyzer library
LICENSE=	gnu-gpl-v1 OR gnu-gpl-v2 OR gnu-gpl-v3

DEPENDS+=	${PYPKGPREFIX}-arabic>=0.6.2:../../wip/py-arabic
DEPENDS+=	${PYPKGPREFIX}-pickledb>=0.9.0:../../wip/py-pickledb
DEPENDS+=	${PYPKGPREFIX}-libqutrub>=1.2.4.1:../../wip/py-libqutrub
DEPENDS+=	${PYPKGPREFIX}-naftawayh>=0.4:../../wip/py-naftawayh
DEPENDS+=	${PYPKGPREFIX}-qalsadi>=0.3.5:../../wip/py-qalsadi


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
