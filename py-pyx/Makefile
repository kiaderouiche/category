# $NetBSD$

DISTNAME=	PyX-0.15
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://pypi.python.org/packages/source/P/PyX/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://pyx-project.org/
COMMENT=	Python package for the generation of PostScript, PDF, and SVG files
LICENSE=	gnu-gpl-v1 OR gnu-gpl-v2 OR gnu-gpl-v3

BUILD_DEPENDS+=	# TODO: zope.pagetemplate>=0
BUILD_DEPENDS+=	py-sphinx>=0:../../textproc/py-sphinx
BUILD_DEPENDS+=	# TODO: sphinx_selective_exclude>=0
BUILD_DEPENDS+=	# TODO: pillow>=0
BUILD_DEPENDS+=	# TODO: IPython>=0
BUILD_DEPENDS+=	py-nbformat>=0:../../www/py-nbformat
BUILD_DEPENDS+=	py-testfixtures>=0:../../wip/py-testfixtures

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
