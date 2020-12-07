# $NetBSD$

DISTNAME=	python-debian-0.1.38
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/99/b6/5c748994f5085f419bbc0c508a9265c56544e853f7d6aa31316cf9e327af/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://salsa.debian.org/python-debian-team/python-debian
COMMENT=	Debian package related modules
#LICENSE=	GPL-2+ # TODO: from setup.py; needs to be adjusted

DEPENDS+=	py-six>=0:../../lang/py-six
DEPENDS+=	py-chardet>=0:../../converters/py-chardet

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
