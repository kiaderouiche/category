# $NetBSD$

DISTNAME=	carculator-1.4.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/carculator/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/romainsacchi/carculator
COMMENT=	Economic life cycle assessment of vehicles made blazing fast
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-pandas>=0.25.3:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-xarray>=0.15.1:../../math/py-xarray
DEPENDS+=	${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test
DEPENDS+=	${PYPKGPREFIX}-test-cov>=2.11.1:../../devel/py-test-cov
DEPENDS+=	${PYPKGPREFIX}-klausen>=0.1.1:../../wip/py-klausen
DEPENDS+=	${PYPKGPREFIX}-xlrd>=1.2.0:../../textproc/py-xlrd
DEPENDS+=	${PYPKGPREFIX}-numexpr>=2.7.1:../../math/py-numexpr
DEPENDS+=	${PYPKGPREFIX}-bw2io>=0:../../wip/py-bw2io
DEPENDS+=	${PYPKGPREFIX}-country>=19.8.18:../../geography/py-country
DEPENDS+=	${PYPKGPREFIX}-wurst>=0.2.2:../../wip/py-wurst

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
