# $NetBSD$

DISTNAME=	mishkal-0.4
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/e0/08/d76b959718ba48a1bbec4397bbbce29dd1ab9e8360197ec6950017e6f0ff/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://mishkal.sourceforge.net/
COMMENT=	Mishkal: Arabic text diacritization library for Python
LICENSE=	gnu-gpl-v1 OR gnu-gpl-v2 OR gnu-gpl-v3

DEPENDS+=	${PYPKGPREFIX}-libqutrub>=1.0
DEPENDS+=	${PYPKGPREFIX}-naftawayh>=0.2:../../wip/py-naftawayh
DEPENDS+=	${PYPKGPREFIX}-arabic>=0.6.2
DEPENDS+=	${PYPKGPREFIX}-tashaphyne>=0.3.1:../../wip/py-tashaphyne
DEPENDS+=	${PYPKGPREFIX}-arramooz-sqlite>=0.1
DEPENDS+=	py-qalsadi>=0.2:../../wip/py-qalsadi
DEPENDS+=	# TODO: mysam-tagmanager>=0.1
DEPENDS+=	# TODO: alyahmor>=0.1
DEPENDS+=	py-asmai>=0.1:../../category/py-asmai
DEPENDS+=	# TODO: sylajone>=0.1
DEPENDS+=	# TODO: maskouk-pysqlite>=0.1
DEPENDS+=	# TODO: pickledb>=0.9.0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
