# $NetBSD$

GITHUB_PROJECT=	incubator-mxnet
GITHUB_TAG=	1.7.0
DISTNAME=	1.7.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_GITHUB:=apache/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research]@gmail.com
HOMEPAGE=	https://mxnet.apache.org/
COMMENT=	MXNet is an ultra-scalable deep learning framework
LICENSE=	apache-2.0

WRKSRC=		${WRKDIR}/incubator-mxnet-1.7.0

USE_CMAKE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	gmake

.include "../../mk/bsd.pkg.mk"
