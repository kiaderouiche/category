# $NetBSD$

DISTNAME=	voila-0.2.10
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	www python
MASTER_SITES=	${MASTER_SITE_PYPI:=v/voila/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://files.pythonhosted.org/packages/01/95/2f7ab2b1ed417b61d3f20873e61e94fd9f2c5ba1d16e197fffff527cd2be/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

PYTHON_VERSIONS_INCOMPATIBLE+=	27

devel/py-jupyter_client
devel/py-jupyter_core
DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.9.6:../../textproc/py-jinja2
DEPENDS+=	${PYPKGPREFIX}-jinja2>=2.9.6:../../www/py-nbconvert



.include "../../mk/bsd.pkg.mk"
