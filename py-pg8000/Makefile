# $NetBSD$

DISTNAME=	pg8000-1.16.6
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/pg8000/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://files.pythonhosted.org/packages/24/1b/584dda6665ce38535c8892b42d458c24e517d139a5baa172bf43bf4c4dfb/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

PYTHON_VERSIONS_INCOMPATIBLE=	27

DEPENDS+=	${PYPKGPREFIX}-scramp>=1.2.0:../../wip/py-scramp

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
