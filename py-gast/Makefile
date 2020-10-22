# $NetBSD$

DISTNAME=	gast-0.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=g/${DISTNAME:S/${VERS}//}/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/serge-sans-paille/gast/
COMMENT=	Python AST that abstracts the underlying Python version
LICENSE=	modified-bsd

TEST_DEPENDS+=	${PYPKGPREFIX}-autopep8>=1.5.4:../../devel/py-autopep8

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
