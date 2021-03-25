# $NetBSD$

DISTNAME=	carculator-1.4.5
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/f1/89/f0dccf067bc3d16f020d4bf0b0b0b7abf91155dffa9dd433387d45c2b40b/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/romainsacchi/carculator
COMMENT=	Prospective environmental and economic life cycle assessment of vehicles made blazing fast
#LICENSE=	BSD 3-Clause License

DEPENDS+=	py-pandas>=0:../../math/py-pandas
DEPENDS+=	py-xarray>=0:../../math/py-xarray
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	# TODO: pytest>=0
DEPENDS+=	# TODO: pytest-cov>=0
DEPENDS+=	py-klausen>=0:../../wip/py-klausen
DEPENDS+=	py-xlrd>=0:../../textproc/py-xlrd
DEPENDS+=	# TODO: pytest>=0
DEPENDS+=	py-numexpr>=0:../../math/py-numexpr
DEPENDS+=	py-bw2io>=0:../../category/py-bw2io
DEPENDS+=	# TODO: pycountry>=0
DEPENDS+=	py-wurst>=0:../../wip/py-wurst

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
