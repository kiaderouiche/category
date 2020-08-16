# $NetBSD$

DISTNAME=	mozinfo-1.2.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/49/af/5544ceda137684e1d7dcecfd7e2d7b73dc0b4b99a0b9d1bb0cafb5c4cb73/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://wiki.mozilla.org/Auto-tools/Projects/Mozbase
COMMENT=	Library to get system information for use in Mozilla testing
#LICENSE=	MPL # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-distro>=1.4.0:../../devel/py-distro
DEPENDS+=	py-mozfile>=0.12:../../category/py-mozfile

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
