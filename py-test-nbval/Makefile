# $NetBSD$

DISTNAME=	nbval-0.9.6
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	https://files.pythonhosted.org/packages/7a/5c/ae5ea6f6bbaefcb4de94072bd31566682fe927f33ab8bfeb8f0179aa346a/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/computationalmodelling/nbval
COMMENT=	A py.test plugin to validate Jupyter notebooks
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-pytest>=2.8
DEPENDS+=	${PYPKGPREFIX}-six>=0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-jupyter_client>=0:../../devel/py-jupyter_client
DEPENDS+=	${PYPKGPREFIX}-nbformat>=0:../../www/py-nbformat
DEPENDS+=	${PYPKGPREFIX}-ipykernel>=0:../../devel/py-ipykernel
DEPENDS+=	${PYPKGPREFIX}-coverage>=0:../../devel/py-coverage

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
