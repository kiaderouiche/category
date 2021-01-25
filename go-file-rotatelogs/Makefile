# $NetBSD$

DISTNAME=	file-rotatelogs-20201218
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	file-rotatelogs
GITHUB_TAG=	f6ef97f4d6da2b0d1d65fadc4a1dfa847a72c74f
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=lestrrat-go/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/lestrrat-go/file-rotatelogs/
COMMENT=	Port of perl5 File::RotateLogs to Go
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/lestrrat-go/file-rotatelogs


.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
