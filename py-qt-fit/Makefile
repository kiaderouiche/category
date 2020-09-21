# $NetBSD$

DISTNAME=	PyQt-Fit-1.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	x11 python
MASTER_SITES=	https://files.pythonhosted.org/packages/bd/26/1679b81e3ca65aa955d91f57c2bd9fca7e05cb1b65bcc7d464961056e296/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/PierreBdR/PyQt-fit
COMMENT=	Parametric and non-parametric regression with plotting and testing
#LICENSE=	LICENSE.txt # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-distribute>=0.6:../../mail/distribute
DEPENDS+=	${PYPKGPREFIX}-scipy>=0.10.0:../../math/py-scipy
DEPENDS+=	${PYPKGPREFIX}-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	${PYPKGPREFIX}-path>=13.0:../../
DEPENDS+=	${PYPKGPREFIX}-qtpy>=1.7.1:../../wip/py-qtpy

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=1.5.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
