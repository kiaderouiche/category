# $NetBSD$

DISTNAME=	typer-0.3.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/d5/74/40abdad73bc8b5b17a5a6e442fc57b20f5cc2ee869632625083762490de6/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/tiangolo/typer
COMMENT=	Typer, build great CLIs. Easy to code. Based on Python type hints
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-autoflake>=1.3.1,<2.0.0:../../wip/py-autoflake
BUILD_DEPENDS+=	py-flake8>=3.8.3,<4.0.0:../../devel/py-flake8
DEPENDS+=	py-click>=7.1.1,<7.2.0:../../devel/py-click

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
