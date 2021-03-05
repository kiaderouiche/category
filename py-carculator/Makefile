# $NetBSD$

DISTNAME=	carculator-1.4.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/67/23/67380c587e56ef387928c87246bbd3c2cff5c18ea4a8996253e06af346e7/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/romainsacchi/carculator
COMMENT=	Prospective environmental and economic life cycle assessment of vehicles made blazing fast
#LICENSE=	BSD 3-Clause License

DEPENDS+=	${PYPKGPREFIX}-pandas>=0:../../math/py-pandas
DEPENDS+=	${PYPKGPREFIX}-xarray>=0:../../math/py-xarray
DEPENDS+=	${PYPKGPREFIX}-test-cov>=0
DEPENDS+=	${PYPKGPREFIX}-klausen>=0:../../category/py-klausen
DEPENDS+=	${PYPKGPREFIX}-xlrd>=0:../../textproc/py-xlrd
DEPENDS+=	${PYPKGPREFIX}-test>=0
DEPENDS+=	${PYPKGPREFIX}-numexpr>=0:../../math/py-numexpr
DEPENDS+=	${PYPKGPREFIX}-bw2io>=0:../../category/py-bw2io
DEPENDS+=	${PYPKGPREFIX}-country>=0
DEPENDS+=	${PYPKGPREFIX}-wurst>=0:../../category/py-wurst

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
