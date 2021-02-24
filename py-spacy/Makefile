# $NetBSD$

DISTNAME=	spacy-3.0.3
PKGNAME=        ${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_PYPI:=s/spacy/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://spacy.io/
COMMENT=	Library for advanced NLP in Python and Cython
LICENSE=	mit

USE_LANGUAGES=	fortran

PYTHON_VERSIONS_INCOMPATIBLE+=  36

BUILDLINK_API_DEPENDS.py-cython+=       ${PYPKGPREFIX}-cython>=0.12.1
.include "../../devel/py-cython/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
