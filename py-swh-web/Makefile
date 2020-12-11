# $NetBSD$

DISTNAME=	swh.web-0.0.273
PKGNAME=	${PYPKGPREFIX}-swh-web-0.0.273
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_PYPI:=s/swh.web/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://forge.softwareheritage.org/diffusion/DWUI/
COMMENT=	Software Heritage Web UI
LICENSE=	gnu-gpl-v3

BUILD_DEPENDS+=	${PYPKGPREFIX}-setuptools-scm>=0
DEPENDS+=	${PYPKGPREFIX}-beautifulsoup4>=0:../../www/py-beautifulsoup4
DEPENDS+=	${PYPKGPREFIX}-cryptography>=0:../../security/py-cryptography
DEPENDS+=	${PYPKGPREFIX}-django<3>=0
DEPENDS+=	${PYPKGPREFIX}-django-cors-headers>=0:../../www/py-django-cors-headers
DEPENDS+=	${PYPKGPREFIX}-django-js-reverse>=0
DEPENDS+=	${PYPKGPREFIX}-djangorestframework>=0:../../www/py-djangorestframework
DEPENDS+=	# TODO: django-webpack-loader>=0
DEPENDS+=	${PYPKGPREFIX}-docutils>=0:../../textproc/py-docutils
DEPENDS+=	# TODO: htmlmin>=0
DEPENDS+=	py-iso8601>=0:../../time/py-iso8601
DEPENDS+=	py-lxml>=0:../../textproc/py-lxml
DEPENDS+=	# TODO: prometheus-client>=0
DEPENDS+=	# TODO: pybadges>=0
DEPENDS+=	py-pygments>=0:../../textproc/py-pygments
DEPENDS+=	# TODO: python-keycloak>=0.19.0
DEPENDS+=	# TODO: python-magic>=0.4.0
DEPENDS+=	# TODO: python-memcached>=0
DEPENDS+=	# TODO: pyyaml>=0
DEPENDS+=	py-requests>=0:../../devel/py-requests
DEPENDS+=	py-sentry-sdk>=0:../../wip/py-sentry-sdk
DEPENDS+=	py-typing-extensions>=0:../../devel/py-typing-extensions
DEPENDS+=	# TODO: swh.core>=0.0.95
DEPENDS+=	# TODO: swh.indexer>=0.4.1
DEPENDS+=	# TODO: swh.model>=0.5.0
DEPENDS+=	# TODO: swh.scheduler>=0.7.0
DEPENDS+=	# TODO: swh.search>=0.2.0
DEPENDS+=	# TODO: swh.storage>=0.11.10
DEPENDS+=	# TODO: swh.vault>=0.0.33

USE_LANGUAGES=	c++

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
