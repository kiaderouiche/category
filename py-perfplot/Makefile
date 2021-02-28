# $NetBSD$

DISTNAME=	perfplot-0.8.10
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	graphics python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/perfplot/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/nschloe/perfplot
COMMENT=	Performance plots for Python code snippets
LICENSE=	gnu-gpl-v3

post-extract:
	${MV} ${WRKSRC}/setup.cfg ${WRKSRC}/setup.py

.include "../../mk/bsd.pkg.mk"
