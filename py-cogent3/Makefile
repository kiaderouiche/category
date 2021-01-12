# $NetBSD$

DISTNAME=	cogent3-2020.12.21a0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	biology python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/cogent3/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/cogent3/cogent3
COMMENT=	COmparative GENomics Toolkit 3
LICENSE=	2-clause-bsd


DEPENDS+=               ${PYPKGPREFIX}-scipy>=1.5.2:../../math/py-scipy
DEPENDS+=               
${PYPKGPREFIX}-tox-gh-actions>=2.3.0:../../wip/py-tox-gh-actions
DEPENDS+=               ${PYPKGPREFIX}-tox>=1.12.43:../../devel/py-tox
DEPENDS+=               ${PYPKGPREFIX}-psutil>=1.12.43:../../devel/py-psutil

 .include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
