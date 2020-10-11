# $NetBSD$

GITHUB_PROJECT=	incubator-mxnet
GITHUB_TAG=	1.7.0
DISTNAME=	1.7.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=apache/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/apache/incubator-mxnet/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/incubator-mxnet-1.7.0
USE_CMAKE=	yes
USE_LANGUAGES=	c++
USE_TOOLS+=	gmake

.include "../../mk/bsd.pkg.mk"
