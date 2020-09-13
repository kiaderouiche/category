# $NetBSD$

DISTNAME=	swiglpk-4.65.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math
MASTER_SITES=	https://files.pythonhosted.org/packages/0e/c9/9b0ec3e2ca942b6d067e84e52d72818fa9c3a1a1524671fcbec4841b54b2/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/biosustain/swiglpk
COMMENT=	Plain python bindings for the GNU Linear Programming Kit
LICENSE=	gnu-gpl-v3


BUILDLINK_API_DEPENDS.glpk+=    glpk>=4.8nb1
.include "../../math/glpk/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
