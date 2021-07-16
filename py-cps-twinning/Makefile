# $NetBSD$

DISTNAME=	cps-twinning-0.0.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
GITHUB_PROJECT=	cps-twinning
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	parallel sysutils python
MASTER_SITES=	${MASTER_SITE_GITHUB:=sbaresearch/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/sbaresearch/cps-twinning/
COMMENT=	Framework for Generating and Executing Digital Twins
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-kafka-python>=1.4.0:../../devel/py-kafka-python
DEPENDS+=	${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	scapy>=2.4.0:../../net/scapy
DEPENDS+=	${PYPKGPREFIX}-paho-mqtt>=1.3.1:../../net/py-paho-mqtt
DEPENDS+=	${PYPKGPREFIX}-lxml>=3.4.2:../../textproc/py-lxml
DEPENDS+=	${PYPKGPREFIX}-modbus>=1.4.0:../../wip/py-modbus

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
