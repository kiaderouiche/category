# $NetBSD$

DISTNAME=	arabic_reshaper-2.1.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/0a/1e/b78cacd22bd55c43f2711115d67ece3ed9616ba82d2d0e0914db2a6db985/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mpcabd/python-arabic-reshaper/
COMMENT=	Reconstruct Arabic sentences to be used in applications that don't support Arabic
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE+=  27

DEPENDS+=	${PYPKGPREFIX}-future>=0:../../devel/py-future

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
