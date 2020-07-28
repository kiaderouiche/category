# $NetBSD$

DISTNAME=	docker_interface-0.4.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/70/ee/33189ac031ef7b4d4a9eecf5a2ecd50d686ac56fc34f1695ef43791a25e6/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/spotify/docker_interface
COMMENT=	Declarative interface for building images and running commands in containers using Docker
#LICENSE=	License :: OSI Approved :: Apache Software License # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-jsonschema>=2.6.0:../../textproc/py-jsonschema
DEPENDS+=	# TODO: PyYAML>=3.12

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
