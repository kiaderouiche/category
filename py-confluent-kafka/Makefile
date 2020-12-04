# $NetBSD$

DISTNAME=	confluent-kafka-1.5.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/fd/ec/e3b6ce8530b031d0dab663155b0a79d990c4c67ffbcf9b3266289ee703f0/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/confluentinc/confluent-kafka-python
COMMENT=	Confluent's Python client for Apache Kafka
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	${PYPKGPREFIX}-test==4.6.4;python_version<"3.0">=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-test;python_version>="3.0"
BUILD_DEPENDS+=	${PYPKGPREFIX}-test-timeout>=0
BUILD_DEPENDS+=	${PYPKGPREFIX}-flake8>=0:../../devel/py-flake8
BUILD_DEPENDS+=	${PYPKGPREFIX}-fastavro>=0.23.0:../../wip/py-fastavro
BUILD_DEPENDS+=	${PYPKGPREFIX}-avro-python3==1.10.0;python_version>"3.0"
BUILD_DEPENDS+=	${PYPKGPREFIX}-requests>=0:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-futures;python_version<"3.2">=0
DEPENDS+=	${PYPKGPREFIX}-enum34;python_version<"3.4">=0

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
