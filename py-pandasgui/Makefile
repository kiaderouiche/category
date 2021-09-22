# $NetBSD$

DISTNAME=	pandasgui-0.2.13
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/70/60/dfbe9817d621bb6868427283273e17c1209d0c5b763106a75acccd44ebda/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/adamerose/pandasgui
COMMENT=	A GUI for Pandas DataFrames
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-git>=0
DEPENDS+=	${PYPKGPREFIX}-pandas>=0:../../math/py-pandas
DEPENDS+=	# TODO: PyQt5>=0
DEPENDS+=	# TODO: PyQt5-sip>=0
DEPENDS+=	# TODO: PyQtWebEngine>=0
DEPENDS+=	${PYPKGPREFIX}-plotly>=0:../../wip/py-plotly
DEPENDS+=	# TODO: wordcloud>=0
DEPENDS+=	${PYPKGPREFIX}-setuptools>=0:../../devel/py-setuptools
DEPENDS+=	${PYPKGPREFIX}-appdirs>=0:../../devel/py-appdirs
DEPENDS+=	# TODO: pynput>=0
DEPENDS+=	# TODO: IPython>=0
DEPENDS+=	# TODO: pyarrow>=0
DEPENDS+=	${PYPKGPREFIX}-astor>=0:../../devel/py-astor
DEPENDS+=	${PYPKGPREFIX}-typing-extensions>=0:../../devel/py-typing-extensions
DEPENDS+=	# TODO: qtstylish>=0.1.2

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
