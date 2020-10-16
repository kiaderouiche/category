# $NetBSD$

DISTNAME=	graphene-sqlalchemy-2.3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	databases python
MASTER_SITES=	https://files.pythonhosted.org/packages/68/a9/2ba20a7d9c6d34bc2bdc0b5dfdf4ff33be16fead8a0593cd3b0454bb96d1/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/graphql-python/graphene-sqlalchemy
COMMENT=	Graphene SQLAlchemy integration
LICENSE=	mit

BUILD_DEPENDS+=	${PYPKGPREFIX}-tox>=3.7.0:../../devel/py-tox
BUILD_DEPENDS+=	${PYPKGPREFIX}-coveralls==1.10.0>=0
BUILD_DEPENDS+=	# TODO: pre-commit==1.14.4>=0
DEPENDS+=	${PYPKGPREFIX}-graphene>=2.1.3:../../wip/py-graphene
DEPENDS+=	${PYPKGPREFIX}-promise>=2.3
DEPENDS+=	${PYPKGPREFIX}-SQLAlchemy>=1.2,<2
DEPENDS+=	${PYPKGPREFIX}-six>=1.10.0,<2:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-singledispatch>=3.4.0.3,<4:../../devel/py-singledispatch
TEST_DEPENDS+=	${PYPKGPREFIX}-test==4.3.1>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-mock==2.0.0>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-test-cov>=2.10.1:../../devel/py-test-cov
TEST_DEPENDS+=	${PYPKGPREFIX}-sqlalchemy_utils==0.33.9>=0
TEST_DEPENDS+=	${PYPKGPREFIX}-test-benchmark==3.2.1>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
