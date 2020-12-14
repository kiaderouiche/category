# $NetBSD$

DISTNAME=	pyfuse3-3.1.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/py//}
CATEGORIES=	sysutils python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pyfuse3/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://files.pythonhosted.org/packages/af/3a/94f4cdf85ffcb03c80036b427f5797e2b70ed0413fcc632a284bd1703fd4/
COMMENT=	Python 3 bindings for libfuse 3 with async I/O support
LICENSE=	gnu-lgpl-v3


.include "../../devel/py-cython/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
