# $NetBSD$

DISTNAME=	cfxdb-20.8.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/b1/9d/6eadd7400836317cfefac0a466296c05f90a25f0b47b8a82323e7b6a2021/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://crossbario.com
COMMENT=	Crossbar.io database schemata, based on zLMDB
#LICENSE=	proprietary # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: numpy==1.15.4>=0
DEPENDS+=	py-txaio>=20.1.1:../../devel/py-txaio
DEPENDS+=	# TODO: zlmdb>=20.1.1

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.flatbuffers+=	flatbuffers>=1.11
.include "../../devel/flatbuffers/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
