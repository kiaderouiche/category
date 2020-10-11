# $NetBSD$

DISTNAME=	fastapi-0.61.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/da/32/ea2b86e56674ff3d1bb0bbb2e3b74a04694ac0be3331e9f9d431c350bcc2/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/tiangolo/fastapi
COMMENT=	FastAPI framework, high performance, easy to learn, fast to code, ready for production
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: python-jose[cryptography]>=3.1.0,<4.0.0
BUILD_DEPENDS+=	# TODO: passlib[bcrypt]>=1.7.2,<2.0.0
BUILD_DEPENDS+=	# TODO: autoflake>=1.3.1,<2.0.0
BUILD_DEPENDS+=	py-flake8>=3.8.3,<4.0.0:../../devel/py-flake8
BUILD_DEPENDS+=	py-uvicorn>=0.11.5,<0.12.0:../../www/py-uvicorn
BUILD_DEPENDS+=	# TODO: graphene>=2.1.8,<3.0.0
DEPENDS+=	# TODO: starlette==0.13.6>=0
DEPENDS+=	# TODO: pydantic>=1.0.0,<2.0.0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
