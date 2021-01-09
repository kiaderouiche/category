# $NetBSD$

DISTNAME=	gtk-20191030
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	go-gtk
GITHUB_TAG=	af2e013261f57706ec683a61f85e8759a3faf6be
CATEGORIES=	x11
MASTER_SITES=	${MASTER_SITE_GITHUB:=mattn/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://mattn.github.com/go-gtk
COMMENT=	Go binding for GTK 
LICENSE=	2-clause-bsd

GO_DIST_BASE=   ${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=     github.com/mattn/${GITHUB_PROJECT}

.include "../../devel/glib/buildlink3.mk"
.include "../../x11/gtk/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
