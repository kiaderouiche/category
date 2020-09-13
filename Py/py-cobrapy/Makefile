# $NetBSD$

DISTNAME=	cobra-0.18.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/ad/4f/ad6e7378a9fb9af80ae856d59adcc41e807ffd0070daf3235594a03ecb5d/

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://opencobra.github.io/cobrapy
COMMENT=	Package for constraints-based modeling of biological networks
#LICENSE=	LGPL/GPL v2+ # TODO: from setup.py; needs to be adjusted

DEPENDS+=	${PYPKGPREFIX}-six>=0:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-future>=0:../../devel/py-future
DEPENDS+=	# TODO: swiglpk>=0
DEPENDS+=	# TODO: ruamel.yaml>=0.16
DEPENDS+=	${PYPKGPREFIX}-pandas>=0.17.0:../../math/py-pandas
#DEPENDS+=	${PYPKGPREFIX}-optlang>=1.4.2:../../category/py-optlang
DEPENDS+=	# TODO: depinfo>=0
DEPENDS+=	# TODO: python-libsbml-experimental==5.18.1>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-jsonschema>2.5:../../textproc/py-jsonschema
TEST_DEPENDS+=	# TODO: pytest>=0
TEST_DEPENDS+=	# TODO: pytest-benchmark>=0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	${PYPKGPREFIX}-numpy>=1.13
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
