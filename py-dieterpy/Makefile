# $NetBSD$

DISTNAME=	dieter_py-master
PKGNAME=	${PYPKGPREFIX}-dieter
CATEGORIES=	category python
MASTER_SITES=	https://gitlab.com/diw-evu/dieter_public/dieter_py/-/archive/master/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://gitlab.com/diw-evu/dieter_public/dieter_py/-/archive/master/
COMMENT=	GAMS-Python framework of a power system model DIETER
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-exceltogdx>=0
DEPENDS+=	# TODO: pandas==1.0.5>=0
DEPENDS+=	# TODO: pyyaml==5.3.1>=0
DEPENDS+=	${PYPKGPREFIX}-psutil>=0:../../sysutils/py-psutil
DEPENDS+=	${PYPKGPREFIX}-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	${PYPKGPREFIX}-plotly>=0:../../wip/py-plotly
DEPENDS+=	${PYPKGPREFIX}-streamlit>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
