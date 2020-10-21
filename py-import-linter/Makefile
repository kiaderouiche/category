# $NetBSD$

DISTNAME=	import-linter-1.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	https://files.pythonhosted.org/packages/68/55/1e8d1dd068239cde9602d214e1f092cfd17cbbe55841574b84a814a3056b/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://files.pythonhosted.org/packages/68/55/1e8d1dd068239cde9602d214e1f092cfd17cbbe55841574b84a814a3056b/
COMMENT=	Enforces rules for the imports within and between Python packages
#LICENSE=	BSD 2-Clause License # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-click>=6:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-grimp>=1.2.2:../../wip/py-grimp

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
