# $NetBSD$

DISTNAME=	yfinance-0.1.54
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/c2/31/8b374a12b90def92a4e27d0fc595fc43635f395984e36a075244d98bd265/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/ranaroussi/yfinance
COMMENT=	Yahoo! Finance market data downloader
LICENSE=	apache-1.1 OR apache-2.0

DEPENDS+=	py-pandas>=0.24:../../math/py-pandas
DEPENDS+=	py-requests>=2.20:../../devel/py-requests
DEPENDS+=	py-multitasking>=0.0.7:../../wip/py-multitasking

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.15
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
