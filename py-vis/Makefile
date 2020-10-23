# $NetBSD$

DISTNAME=	pyvis-0.1.8.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/5c/ba/a7681cf31b2c2c8a19190dc4dae7a3dbc9a17e6b3b8f4667127f0aca22b0/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/WestHealth/pyvis
COMMENT=	A Python network visualization library
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.9.6:../../textproc/py-jinja2
DEPENDS+=	${PYPKGPREFIX}-networkx>=1.11:../../math/py-networkx
DEPENDS+=	${PYPKGPREFIX}-ipython>=5.3.0:../../devel/py-ipython
DEPENDS+=	${PYPKGPREFIX}-jsonpickle>=1.4.1:../../textproc/py-jsonpickle

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
