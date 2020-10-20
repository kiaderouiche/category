# $NetBSD$

DISTNAME=	PySimpleGUI-4.30.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/Py//tl}
CATEGORIES=	devel x11 python
MASTER_SITES=	https://files.pythonhosted.org/packages/85/12/2233fc192c2b4f21919851698a99e8bcef9c00ace7da44eefe80735e313b/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/PySimpleGUI/PySimpleGUI
COMMENT=	GUI SDK Launched in 2018. It's 2020 and PySimpleGUI is actively developed and supported. 
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-Tk-[0-9]*../../x11/py-Tk

PYTHON_VERSIONS_INCOMPATIBLE=	27

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
