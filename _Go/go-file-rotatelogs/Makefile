# $NetBSD$

DISTNAME=	go-file-rotatelogs-2.4.0
GITHUB_PROJECT=	file-rotatelogs
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=lestrrat-go/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/lestrrat-go/file-rotatelogs/
COMMENT=	Port of perl5 File::RotateLogs to Go
LICENSE=	mit


GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=     github.com/lestrrat-go/file-rotatelogs


.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
