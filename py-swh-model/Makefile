# $NetBSD$

DISTNAME=	swh.model-0.9.0
PKGNAME=	${PYPKGPREFIX}-swh-model-0.9.0
CATEGORIES=	databases python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.model/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DMOD/
COMMENT=	Software Heritage data model
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=	${PYPKGPREFIX}-attrs>=19.3.0:../../devel/py-attrs
DEPENDS+=	${PYPKGPREFIX}-attrs_strict>=0.2.0:../../wip/py-attrs-strict
DEPENDS+=	${PYPKGPREFIX}-deprecated>=0:../../devel/py-Deprecated
DEPENDS+=	${PYPKGPREFIX}-hypothesis>=0:../../devel/py-hypothesis
DEPENDS+=	${PYPKGPREFIX}-iso8601>=0:../../time/py-iso8601
DEPENDS+=	${PYPKGPREFIX}-dateutil>=0:../../time/py-dateutil
DEPENDS+=	${PYPKGPREFIX}-typing_extensions>=0:../../
DEPENDS+=	${PYPKGPREFIX}-pyblake2;python_version<"3.6">=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
