# $NetBSD$

DISTNAME=	wuzz-0.5.0
GITHUB_PROJECT=	wuzz
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=asciimoo/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/asciimoo/wuzz/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GO_SRCPATH=     github.com/asciimoo/wuzz
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../devel/go-homedir/buildlink3.mk"
.include "../../net/go-net/buildlink3.mk"
.include "../../textproc/go-runewidth/buildlink3.mk"
.include "../../www/go-toml-burntsushi/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
