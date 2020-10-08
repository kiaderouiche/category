# $NetBSD$

DISTNAME=	selenium-generator-0.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	www python
MASTER_SITES=	https://files.pythonhosted.org/packages/14/4e/a0a1f476ac52c0c4de5e87be937fb0c72b98132a5d1c798e204bb1045c3a/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://files.pythonhosted.org/packages/14/4e/a0a1f476ac52c0c4de5e87be937fb0c72b98132a5d1c798e204bb1045c3a/
COMMENT=	Automated generating of Selenim WebDriver tests from yaml
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE=	27

DEPENDS+=	${PYPKGPREFIX}-unittest2>=0.5.1:../../devel/py-unittest2

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
