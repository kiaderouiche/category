# $NetBSD$

DISTNAME=	django-pandas-0.6.4
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/bc/ff/0faa4f7225591a5b04806c805d1f6d567c0da6fa8e904e8209cfc6c83fa5/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/chrisdev/django-pandas/
COMMENT=	Tools for working with pydata.pandas in your Django projects
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-pandas>=0.14.1:../../math/py-pandas
DEPENDS+=	py-six>=1.15.0:../../lang/py-six
TEST_DEPENDS+=	py-pandas>=0.20.1:../../math/py-pandas
TEST_DEPENDS+=	py-coverage>=4.0:../../devel/py-coverage
TEST_DEPENDS+=	# TODO: semver==2.10.1>=0

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
