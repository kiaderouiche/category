# $NetBSD$

DISTNAME=	carculator-1.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/carculator/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/romainsacchi/carculator
COMMENT=	Prospective environmental and economic life cycle assessment of vehicles made blazing fast
#LICENSE=	BSD 3-Clause License

DEPENDS+=	py-pandas>=0:../../math/py-pandas
DEPENDS+=	py-xarray>=0:../../math/py-xarray
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	# TODO: pytest>=0
DEPENDS+=	# TODO: pytest-cov>=0
DEPENDS+=	# TODO: klausen>=0
DEPENDS+=	py-xlrd>=0:../../textproc/py-xlrd
DEPENDS+=	# TODO: pytest>=0
DEPENDS+=	py-numexpr>=0:../../math/py-numexpr
DEPENDS+=	# TODO: bw2io>=0
DEPENDS+=	# TODO: pycountry>=0
DEPENDS+=	# TODO: wurst>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
