# $NetBSD$

DISTNAME=	flatbuffers-20210122
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	flatbuffers
GITHUB_TAG=	786f69b
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=google/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/google/flatbuffers/
COMMENT=	Memory Efficient Serialization Library 
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}*
GO_SRCPATH=	github.com/google/${GITHUB_PROJECT}

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

.include "../../devel/flatbuffers/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
