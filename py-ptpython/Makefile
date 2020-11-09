# $NetBSD$

DISTNAME=	ptpython-3.0.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/ptpython/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/prompt-toolkit/ptpython
COMMENT=	Python REPL build on top of prompt_toolkit
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-appdirs>=0:../../devel/py-appdirs
DEPENDS+=	# TODO: importlib_metadata;python_version<'3.8'>=0
DEPENDS+=	py-jedi>=0.9.0:../../editors/py-jedi
DEPENDS+=	py-prompt_toolkit>=3.0.0,<3.1.0:../../devel/py-prompt_toolkit
DEPENDS+=	py-pygments>=0:../../textproc/py-pygments

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
