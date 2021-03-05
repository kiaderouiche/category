# $NetBSD$

DISTNAME=	carculator-1.4.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/carculator/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/romainsacchi/carculator
COMMENT=	Prospective environmental and economic life cycle assessment of vehicles made blazing fast
LICENSE=	2-clause-bsd

DEPENDS+=	${PYPKGPREFIX}-pandas>=0.23.5:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-xarray>=0:../../math/py-xarray
DEPENDS+=	${PYPKGPREFIX}-test-cov>=0:../../devel/py-test-cov
DEPENDS+=	${PYPKGPREFIX}-klausen>=0:../../category/py-klausen
DEPENDS+=	${PYPKGPREFIX}-xlrd>=0:../../textproc/py-xlrd
DEPENDS+=	${PYPKGPREFIX}-test>=0:../../devel/py-test
DEPENDS+=	${PYPKGPREFIX}-numexpr>=0:../../math/py-numexpr
DEPENDS+=	${PYPKGPREFIX}-bw2io>=0:../../category/py-bw2io
DEPENDS+=	${PYPKGPREFIX}-country>=0:../../wip/py-country
DEPENDS+=	${PYPKGPREFIX}-wurst>=0:../../category/py-wurst

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
