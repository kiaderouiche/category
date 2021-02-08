# $NetBSD$

GITHUB_PROJECT=	flux-core
DISTNAME=	flux-core-0.23.1
CATEGORIES=	category
MASTER_SITES=	${MASTER_SITE_GITHUB:=flux-framework/}
GITHUB_RELEASE=	v0.23.1

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/flux-framework/flux-core/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

GNU_CONFIGURE=	yes
USE_TOOLS+=	pkg-config

PKGCONFIG_OVERRIDE+=	etc/flux-core.pc.in
PKGCONFIG_OVERRIDE+=	etc/flux-hostlist.pc.in
PKGCONFIG_OVERRIDE+=	etc/flux-idset.pc.in
PKGCONFIG_OVERRIDE+=	etc/flux-optparse.pc.in
PKGCONFIG_OVERRIDE+=	etc/flux-pmi.pc.in
PKGCONFIG_OVERRIDE+=	etc/flux-schedutil.pc.in

.include "../../mk/bsd.pkg.mk"
