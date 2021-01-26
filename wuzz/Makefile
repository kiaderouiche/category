# $NetBSD$

DISTNAME=	wuzz-0.5.0
GITHUB_PROJECT=	wuzz
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_GITHUB:=asciimoo/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/asciimoo/wuzz/
COMMENT=	Interactive cli tool for HTTP inspection
LICENSE=	gnu-lgpl-v3

GO_SRCPATH=     github.com/asciimoo/wuzz
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../devel/go-homedir/buildlink3.mk"
.include "../../devel/go-text/buildlink3.mk"
.include "../../devel/go-xerrors/buildlink3.mk"
.include "../../graphics/go-image/buildlink3.mk"
.include "../../net/go-net/buildlink3.mk"
.include "../../textproc/go-runewidth/buildlink3.mk"
.include "../../graphics/go-freetype/buildlink3.mk"
.include "../../wip/go-jsoncolor/buildlink3.mk"
.include "../../wip/go-htmlcolor/buildlink3.mk"
.include "../../wip/go-gjson/buildlink3.mk"
.include "../../wip/go-goquery/buildlink3.mk"
.include "../../wip/go-shellescape/buildlink3.mk"
.include "../../www/go-toml-burntsushi/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
