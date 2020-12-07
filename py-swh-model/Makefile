# $NetBSD$

DISTNAME=	swh.model-0.9.0
PKGNAME=	${PYPKGPREFIX}-swh-model-0.9.0
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.model/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DMOD/
COMMENT=	Software Heritage data model
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools-scm>=0
DEPENDS+=	${PYPKGPREFIX}-attrs>=0:../../devel/py-attrs
DEPENDS+=	${PYPKGPREFIX}-attrs_strict>=0.0.7
DEPENDS+=	${PYPKGPREFIX}-deprecated>=0
DEPENDS+=	${PYPKGPREFIX}-hypothesis>=0:../../devel/py-hypothesis
DEPENDS+=	${PYPKGPREFIX}-iso8601>=0:../../time/py-iso8601
DEPENDS+=	${PYPKGPREFIX}-dateutil>=0
DEPENDS+=	${PYPKGPREFIX}-typing_extensions>=0
DEPENDS+=	${PYPKGPREFIX}-pyblake2;python_version<"3.6">=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
