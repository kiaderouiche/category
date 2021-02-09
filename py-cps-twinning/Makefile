# $NetBSD$

DISTNAME=	cps-twinning-0.0.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
GITHUB_PROJECT=	cps-twinning
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	parallel systutils python
MASTER_SITES=	${MASTER_SITE_GITHUB:=sbaresearch/}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/sbaresearch/cps-twinning/
COMMENT=	TODO: Short description of the package
LICENSE=	mit

DEPENDS+=	# TODO: lxml==3.4.2>=0
DEPENDS+=       ${PYPKGPREFIX}-six>=1.15.0:../../lang/py-six
DEPENDS+=	# TODO: pymodbus==1.4.0>=0
DEPENDS+=	# TODO: scapy==2.4.0>=0
DEPENDS+=	# TODO: kafka-python==1.4.0>=0
DEPENDS+=	# TODO: paho-mqtt==1.3.1>=0

# TODO: Migrate MASTER_SITES to MASTER_SITE_PYPI
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
