# $NetBSD$

DISTNAME=	pandera-0.4.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/c4/4d/827e90f91f5236914039955252154026d27ad58c53cb0cd2e35acf322404/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/pandera-dev/pandera
COMMENT=	Light-weight and flexible validation package for pandas data structures
LICENSE=	mit

PYTHON_VERSIONS_INCOMPATIBLE=	27

DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-wrapt>=0:../../devel/py-wrapt
DEPENDS+=	${PYPKGPREFIX}-yaml>=5.1:../../devel/py-yaml
DEPENDS+=	${PYPKGPREFIX}-scipy:../../devel/py-scipy
DEPENDS+=	${PYPKGPREFIX}-black:../../devel/py-black
DEPENDS+=	${PYPKGPREFIX}-autopep8:../../devel/py-autopep8
DEPENDS+=	${PYPKGPREFIX}-typing-inspect:../../wip/py-typing-inspect


USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.${PYPKGPREFIX}-numpy+=	${PYPKGPREFIX}-numpy>=1.9.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
