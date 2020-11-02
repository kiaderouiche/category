# $NetBSD$

GITHUB_PROJECT=	exceltogdx
GITHUB_TAG=	v0.0.2
DISTNAME=	v0.0.2
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_GITHUB:=diw-berlin/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/diw-berlin/exceltogdx
COMMENT=	A simple python tool to extract sets and parameters from excel files by creating GDX files for GAMS
LICENSE=	mit

DEPENDS+=	py-appdirs>=0:../../devel/py-appdirs
DEPENDS+=	py-docopt>=0:../../devel/py-docopt
DEPENDS+=	py-pandas>=0:../../math/py-pandas
DEPENDS+=	# TODO: gdxpds>=0
DEPENDS+=	py-openpyxl>=0:../../textproc/py-openpyxl
DEPENDS+=	py-xlrd>=0:../../textproc/py-xlrd

WRKSRC=		${WRKDIR}/exceltogdx-0.0.2
USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
# TODO: Migrate MASTER_SITES to MASTER_SITE_PYPI
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
