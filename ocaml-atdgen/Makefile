# $NetBSD$

DISTNAME=	atd-2.2.1
PKGNAME=	atdgen-2.2.1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=ahrefs/atd/releases/download/2.2.1/}
EXTRACT_SUFX=	.tbz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/ahrefs/atd/releases/download/2.2.1/ # TODO: check
COMMENT=	executable that generates OCaml code dealing with json and biniou data formats
LICENSE=	mit

USE_TOOLS+=	gmake

.include "../../lang/ocaml/buildlink3.mk"
.include "../../devel/ocaml-dune/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
