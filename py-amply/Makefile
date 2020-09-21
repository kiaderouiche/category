# $NetBSD$

DISTNAME=	amply-0.1.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/7f/11/33cb09557ac838d9488779b79e05a2a3c1f3ce9747cd242ba68332736778/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://github.com/willu47/amply
COMMENT=	Amply allows you to load and manipulate AMPL/GLPK data as Python data structures
#LICENSE=	Eclipse Public License 1.0 (EPL-1.0) # TODO: from setup.py; needs to be adjusted

BUILD_DEPENDS+=	py-setuptools_scm>=0:../../devel/py-setuptools_scm
DEPENDS+=	py-docutils>=0.3:../../textproc/py-docutils
DEPENDS+=	py-pyparsing>=0:../../devel/py-pyparsing

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
