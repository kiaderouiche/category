# $NetBSD$

DISTNAME=	arabic_reshaper-2.1.1
PKGNAME=	${PYPKGPREFIX}-arabic-reshaper-2.1.1
CATEGORIES=	textproc python
MASTER_SITES=	${MASTER_SITE_PYPI:=a/arabic_reshaper/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mpcabd/python-arabic-reshaper/
COMMENT=	Reconstruct Arabic sentences to be used in applications that don't support Arabic
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE+=  27

DEPENDS+=	${PYPKGPREFIX}-future>=0:../../devel/py-future

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
