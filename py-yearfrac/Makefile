# $NetBSD$

DISTNAME=	yearfrac-0.4.4
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/6d/a5/97553f1183d34a178d35792a6791fa79e39ce971e243651441a0feed239c/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://github.com/kmedian/yearfrac
COMMENT=	Daycount methods to compute date differences in year units
LICENSE=	mit

DEPENDS+=	py-setuptools>=40.0.0:../../devel/py-setuptools

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.14.*
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
