# $NetBSD$

DISTNAME=	portray-1.4.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/34/a0/3a664ec95d0e96dd4ba5b37943dbb15622b697f7190455c645e85b759f9f/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	None
COMMENT=	Your Project with Great Documentation
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-GitPython>=3.0,<4.0
DEPENDS+=	${PYPKGPREFIX}-hug>=2.6,<3.0
DEPENDS+=	${PYPKGPREFIX}-mkdocs-material>=5.0,<6.0
DEPENDS+=	${PYPKGPREFIX}-mkdocs>=1.0,<2.0:../../textproc/py-mkdocs
DEPENDS+=	${PYPKGPREFIX}-docs>=1.0.2,<2.0.0
DEPENDS+=	${PYPKGPREFIX}-pymdown-extensions>=7.0,<8.0
DEPENDS+=	${PYPKGPREFIX}-toml>=0.10.0,<0.11.0:../../textproc/py-toml
DEPENDS+=	${PYPKGPREFIX}-yaspin>=0.15.0,<0.16.0:../../wip/py-yaspin

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
