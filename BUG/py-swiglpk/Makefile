# $NetBSD$

DISTNAME=	swiglpk-4.65.1
PKGNAME=        ${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=     math python
MASTER_SITES=	https://files.pythonhosted.org/packages/0e/c9/9b0ec3e2ca942b6d067e84e52d72818fa9c3a1a1524671fcbec4841b54b2/

MAINTAINER=     jihbed.research@gmail.com
HOMEPAGE=	https://github.com/biosustain/swiglpk
COMMENT=	Simple swig bindings for the GNU Linear Programming Kit
LICENSE=	gnu-gpl-v3

DEPENDS+=       ${PYPKGPREFIX}-requests>=2.24.0:../../devel/py-requests
DEPENDS+=       ${PYPKGPREFIX}-swig>=1.5.1:../../devel/py-swig

USE_LANGUAGES=	c c++

.include "../../math/glpk/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
