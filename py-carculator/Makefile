# $NetBSD$

DISTNAME=	carculator-1.4.7
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=c/carculator/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/romainsacchi/carculator
COMMENT=	Economic life cycle assessment of vehicles made blazing fast
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-pandas>=0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-xarray>=0:../../math/py-xarray
DEPENDS+=	${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test
DEPENDS+=	# TODO: pytest-cov>=0:../../
DEPENDS+=	${PYPKGPREFIX}-klausen>=0:../../wip/py-klausen
DEPENDS+=	${PYPKGPREFIX}-xlrd>=0:../../textproc/py-xlrd
DEPENDS+=	${PYPKGPREFIX}-numexpr>=0:../../math/py-numexpr
DEPENDS+=	${PYPKGPREFIX}-bw2io>=0:../../category/py-bw2io
DEPENDS+=	${PYPKGPREFIX}-country>=0:../../
DEPENDS+=	${PYPKGPREFIX}-wurst>=0:../../wip/py-wurst

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
