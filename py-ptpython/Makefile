# $NetBSD$

DISTNAME=	ptpython-3.0.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/ptpython/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/prompt-toolkit/ptpython
COMMENT=	Python REPL build on top of prompt_toolkit
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-appdirs>=0:../../devel/py-appdirs
DEPENDS+=	${PYPKGPREFIX}-importlib-metadata:../../wip/py-importlib-metadata
DEPENDS+=	${PYPKGPREFIX}-jedi>=0.9.0:../../editors/py-jedi
DEPENDS+=	${PYPKGPREFIX}-prompt_toolkit>=3.0.0:../../devel/py-prompt_toolkit
DEPENDS+=	${PYPKGPREFIX}-pygments>=0:../../textproc/py-pygments

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
