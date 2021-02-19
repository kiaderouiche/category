# $NetBSD$

DISTNAME=	adawat-0.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/35/65/0c8252cc3da395fdf271933fd7fc8c41d8b1d008978c35330a50596cd4cf/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://adawat.sourceforge.net/
COMMENT=	Adawat: Arabic Language Toolkit
LICENSE=	gnu-gpl-v1 OR gnu-gpl-v2 OR gnu-gpl-v3

DEPENDS+=	${PYPKGPREFIX}-asmai>=0.1:../../wip/py-asmai
DEPENDS+=	${PYPKGPREFIX}-mishkal>=0.3:../../wip/py-mishkal
DEPENDS+=	${PYPKGPREFIX}-naftawayh>=0.4:../../wip/py-naftawayh
DEPENDS+=	${PYPKGPREFIX}-arabic>=0.6.8:../../wip/py-arabic
DEPENDS+=	${PYPKGPREFIX}-qalsadi>=0.3.6:../../wip/py-qalsadi
DEPENDS+=	# TODO: repr>=0.3.1
DEPENDS+=	# TODO: sylajone>=0.2
DEPENDS+=	${PYPKGPREFIX}-tashaphyne>=0.3.4.1:../../wip/py-tashaphyne

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
