# $NetBSD$

GITHUB_PROJECT=	exceltogdx
GITHUB_TAG=	v0.0.2
DISTNAME=	v0.0.2
PKGNAME=	${PYPKGPREFIX}-${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_GITHUB:=diw-berlin/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/diw-berlin/exceltogdx
COMMENT=	Excel files by creating GDX files for GAMS
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-appdirs>=0:../../devel/py-appdirs
DEPENDS+=	${PYPKGPREFIX}-docopt>=0:../../devel/py-docopt
DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-gdxpds>=1.2.0:../../wip/py-gdxpds
DEPENDS+=	${PYPKGPREFIX}-openpyxl>=2.6.3:../../textproc/py-openpyxl
DEPENDS+=	${PYPKGPREFIX}-xlrd>=1.2.0:../../textproc/py-xlrd

WRKSRC=		${WRKDIR}/exceltogdx-0.0.2

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
