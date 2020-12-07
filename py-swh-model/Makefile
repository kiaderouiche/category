# $NetBSD$

DISTNAME=	swh.model-0.9.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/17/58/4895ce1188b5ec48390f811d364d5885fd78b557e2936f8e9f889cf44518/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DMOD/
COMMENT=	Software Heritage data model
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	# TODO: setuptools-scm>=0
DEPENDS+=	py-attrs>=0:../../devel/py-attrs
DEPENDS+=	# TODO: attrs_strict>=0.0.7
DEPENDS+=	# TODO: deprecated>=0
DEPENDS+=	py-hypothesis>=0:../../devel/py-hypothesis
DEPENDS+=	py-iso8601>=0:../../time/py-iso8601
DEPENDS+=	# TODO: python-dateutil>=0
DEPENDS+=	# TODO: typing_extensions>=0
DEPENDS+=	# TODO: pyblake2;python_version<"3.6">=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
