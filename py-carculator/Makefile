# $NetBSD$

DISTNAME=	carculator-1.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/carculator/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/romainsacchi/carculator
COMMENT=	Prospective environmental and economic life cycle assessment of vehicles made blazing fast
#LICENSE=	BSD 3-Clause License

DEPENDS+=	${PYPKGPREFIX}-pandas>=0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-xarray>=0:../../math/py-xarray
DEPENDS+=	${PYPKGPREFIX}-test-cov>=0
DEPENDS+=	${PYPKGPREFIX}-klausen>=0
DEPENDS+=	${PYPKGPREFIX}-xlrd>=0:../../textproc/py-xlrd
DEPENDS+=	${PYPKGPREFIX}-test>=1.6.0:../../devel/py-test
DEPENDS+=	${PYPKGPREFIX}-numexpr>=0:../../math/py-numexpr
DEPENDS+=	${PYPKGPREFIX}-bw2io>=0
DEPENDS+=	${PYPKGPREFIX}-country>=0
DEPENDS+=	${PYPKGPREFIX}-wurst>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
