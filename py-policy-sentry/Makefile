# $NetBSD$

DISTNAME=	policy_sentry-0.11.8
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/4b/5b/5cec64c9053281649cf5ab6f6c39260d2733e5353418b59d5c7001603116/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/salesforce/policy_sentry
COMMENT=	Generate locked-down AWS IAM Policies
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	${PYPKGPREFIX}-beautifulsoup4>=4.9.3:../../www/py-beautifulsoup4
DEPENDS+=	${PYPKGPREFIX}-click>=7.1.2:../../devel/py-click
DEPENDS+=	${PYPKGPREFIX}-requests>=2.25.1:../../devel/py-requests
DEPENDS+=	${PYPKGPREFIX}-schema>=0.7.4:../../wip/py-schema
DEPENDS+=	${PYPKGPREFIX}-yaml>=5.1.3:../../textproc/py-yaml
TEST_DEPENDS+=	${PYPKGPREFIX}-coverage>=5.3.1:../../devel/py-coverage
TEST_DEPENDS+=	py-nose>=1.3.7:../../devel/py-nose
TEST_DEPENDS+=	${PYPKGPREFIX}-test>=5.3.1:../../devel/py-test

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
