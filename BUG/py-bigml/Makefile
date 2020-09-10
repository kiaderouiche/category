# $NetBSD$

DISTNAME=	bigml-5.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/98/63/c032381a16d81574d468e045d6344dc4f50ce073c147e5d0df18746e3056/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://bigml.com/developers
COMMENT=	An open source binding to BigML.io, the public BigML API
#LICENSE=	http://www.apache.org/licenses/LICENSE-2.0 # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	py-nose>=0:../../devel/py-nose
DEPENDS+=	# TODO: unidecode>=0
DEPENDS+=	# TODO: bigml-chronos>=0.4.3
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-requests-toolbelt>=0:../../devel/py-requests-toolbelt
DEPENDS+=	py-scipy>=0:../../math/py-scipy
DEPENDS+=	py-msgpack>=0:../../devel/py-msgpack

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
