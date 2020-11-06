# $NetBSD$

DISTNAME=	jupyter_console-6.2.0
PKGNAME=	${PYPKGPREFIX}-jupyter-console-6.2.0
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=j/jupyter_console/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://jupyter.org
COMMENT=	Jupyter terminal console
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-jupyter_client>=0:../../devel/py-jupyter_client
DEPENDS+=	${PYPKGPREFIX}-ipython>=0:../../devel/py-ipython
DEPENDS+=	${PYPKGPREFIX}-ipykernel>=0:../../devel/py-ipykernel
DEPENDS+=	${PYPKGPREFIX}-prompt_toolkit>=2.0.0,<3.1.0,!=3.0.0,!=3.0.1:../../devel/py-prompt_toolkit
DEPENDS+=	${PYPKGPREFIX}-pygments>=0:../../textproc/py-pygments

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
