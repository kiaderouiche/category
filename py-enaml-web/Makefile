# $NetBSD$

DISTNAME=	enaml-web-0.10.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
GITHUB_PROJECT=	enaml-web
GITHUB_TAG=	refs/tags/v0.10.1
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_GITHUB:=codelv/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/codelv/enaml-web
COMMENT=	Web component toolkit for Enaml
LICENSE=	mit

DEPENDS+=	# TODO: enaml>=0
DEPENDS+=	# TODO: enaml>=0.9.8
DEPENDS+=	${PYPKGPREFIX}-lxml>=3.4.0:../../textproc/py-lxml

USE_LANGUAGES=	# none

# TODO: Migrate MASTER_SITES to MASTER_SITE_PYPI
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
