# $NetBSD$

DISTNAME=	gtk-20110529
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	go-gtk
GITHUB_TAG=	6388c6c908200752a677905432d8caaf64d3d3ad
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=mattn/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://mattn.github.com/go-gtk
COMMENT=	Go binding for GTK 
LICENSE=	2-clause-bsd

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/mattn/${GITHUB_PROJECT}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
