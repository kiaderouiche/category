# $NetBSD$

GITHUB_PROJECT=	checkmake
GITHUB_TAG=	0.1.0
DISTNAME=	{GITHUB_TAG}
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=mrtazz/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mrtazz/checkmake/
COMMENT=	Experimental linter/analyzer for Makefiles
LICENSE=	mit


GO_DIST_BASE=   ${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
GO_SRCPATH=	github.com/mrtazz/checkmake

.include "../../converters/pandoc/buildlink3.mk"
.include "../../textproc/go-tablewriter/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
