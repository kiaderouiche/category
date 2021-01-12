# $NetBSD$

DISTNAME=	tox-gh-actions-2.3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=t/tox-gh-actions/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ymyzk/tox-gh-actions
COMMENT=	Seamless integration of tox into GitHub Actions
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-pluggy>=0.13.1:../../devel/py-pluggy
DEPENDS+=	${PYPKGPREFIX}-tox>=3.20.1:../../devel/py-tox

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
