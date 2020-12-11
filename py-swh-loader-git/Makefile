# $NetBSD$

DISTNAME=	swh.loader.git-0.5.0
PKGNAME=	${PYPKGPREFIX}-swh-loader-git-0.5.0
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.loader.git/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DLDG/
COMMENT=	Software Heritage git loader
LICENSE=	gnu-gpl-v3

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	${PYPKGPREFIX}-dulwich>=0.18.7:../../devel/py-dulwich
DEPENDS+=	${PYPKGPREFIX}-retrying>=0:../../wip/py-retrying
DEPENDS+=	${PYPKGPREFIX}-click>=7.1.2:../../devel/py-click
DEPENDS+=	# TODO: swh.core>=0.0.7
DEPENDS+=	# TODO: swh.loader.core>=v0.11.0
DEPENDS+=	# TODO: swh.model>=0.4.0
DEPENDS+=	# TODO: swh.scheduler>=0.0.39
DEPENDS+=	# TODO: swh.storage>=0.12.0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
