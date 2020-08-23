# $NetBSD$

DISTNAME=	python-registry-1.3.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel systutils python
MASTER_SITES=	https://files.pythonhosted.org/packages/a4/82/c9ae8e9764eae863a4d63c05d5f2d767e392b523c2976c16c56f9a3b17b4/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.williballenthin.com/registry/
COMMENT=	Read access to Windows Registry files
#LICENSE=	Apache License (2.0) # TODO: from setup.py; needs to be adjusted

DEPENDS+=	# TODO: enum-compat>=0
DEPENDS+=	py-unicodecsv>=0:../../databases/py-unicodecsv

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
