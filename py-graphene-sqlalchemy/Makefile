# $NetBSD$

DISTNAME=	graphene-sqlalchemy-2.3.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/68/a9/2ba20a7d9c6d34bc2bdc0b5dfdf4ff33be16fead8a0593cd3b0454bb96d1/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/graphql-python/graphene-sqlalchemy
COMMENT=	Graphene SQLAlchemy integration
LICENSE=	mit

BUILD_DEPENDS+=	# TODO: tox==3.7.0>=0
BUILD_DEPENDS+=	# TODO: coveralls==1.10.0>=0
BUILD_DEPENDS+=	# TODO: pre-commit==1.14.4>=0
DEPENDS+=	py-graphene>=2.1.3,<3:../../category/py-graphene
DEPENDS+=	# TODO: promise>=2.3
DEPENDS+=	# TODO: SQLAlchemy>=1.2,<2
DEPENDS+=	py-six>=1.10.0,<2:../../lang/py-six
DEPENDS+=	py-singledispatch>=3.4.0.3,<4:../../devel/py-singledispatch
TEST_DEPENDS+=	# TODO: pytest==4.3.1>=0
TEST_DEPENDS+=	# TODO: mock==2.0.0>=0
TEST_DEPENDS+=	# TODO: pytest-cov==2.6.1>=0
TEST_DEPENDS+=	# TODO: sqlalchemy_utils==0.33.9>=0
TEST_DEPENDS+=	# TODO: pytest-benchmark==3.2.1>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
