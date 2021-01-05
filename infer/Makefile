# $NetBSD$

GITHUB_PROJECT=	infer
GITHUB_TAG=	v1.0.0
DISTNAME=	v1.0.0
PKGNAME=	${GITHUB_PROJECT}-${DISTNAME:S,^v,,}
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=facebook/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/facebook/infer/
COMMENT=	Static analyzer for Java, C, C++, and Objective-C 
LICENSE=	mit

WRKSRC=		${WRKDIR}/infer-1.0.0

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	autoconf automake autogen pkg-config gmake

REPLACE_BASH+=      autogen.sh

#Precision with platform cible Linux and Darwin
#Prendre en charge CLANG
# facebook-clang-plugins
pre-configure:
	${RUN} cd ${WRKSRC} && ./autogen.sh

.include "../../devel/ocamlbuild/buildlink3.mk"
.include "../../devel/menhir/buildlink3.mk"
.include "../../lang/ocaml/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
