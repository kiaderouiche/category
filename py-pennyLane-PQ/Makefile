# $NetBSD$

DISTNAME=	PennyLane-PQ-0.8.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/2d/9f/06127feedadb1153f2b4a41e8482cf4588a9d31ede4edba806d38f1a0755/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/XanaduAI/PennyLane-PQ
COMMENT=	PennyLane plugin for ProjectQ
LICENSE=	apache-2.0

DEPENDS+=	py-projectq>=0.4.1:../../category/py-projectq
DEPENDS+=	# TODO: pennylane>=0.6

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
