# $NetBSD$

DISTNAME=	chempy-0.7.12
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b4/f2/b2d10356dfeb2c48d123af3a1b717bcdfefd5c1cd8fb59a256eb042ddc78/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/bjodah/chempy
COMMENT=	ChemPy is a Python package useful for solving problems in chemistry
#LICENSE=	BSD # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-scipy>=1.0.1:../../math/py-scipy
DEPENDS+=	py-matplotlib>=2.2.3:../../graphics/py-matplotlib
DEPENDS+=	py-sympy>=1.1.1,!=1.2:../../math/py-sympy
DEPENDS+=	# TODO: quantities>=0.12.1
DEPENDS+=	# TODO: pyneqsys>=0.5.5
DEPENDS+=	# TODO: pyodesys>=0.13.1
DEPENDS+=	py-pyparsing>=2.0.3:../../devel/py-pyparsing
DEPENDS+=	# TODO: sym>=0.3.4
DEPENDS+=	# TODO: jupyter>=0
DEPENDS+=	# TODO: pulp>=1.6.8
DEPENDS+=	# TODO: dot2tex>=2.11.3

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>1.11.3
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
