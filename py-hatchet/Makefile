# $NetBSD$

DISTNAME=	hatchet-1.3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/df/76/2b4f00d711f326c7302f49c7dab02e050ee220368cf9baa9ef8c0d143607/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/LLNL/hatchet
COMMENT=	A Python library for analyzing hierarchical performance data
LICENSE=	mit

DEPENDS+=	# TODO: pydot>=0
DEPENDS+=	# TODO: PyYAML>=0
DEPENDS+=	py-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	py-pandas>=0:../../math/py-pandas

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
