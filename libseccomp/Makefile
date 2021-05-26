# $NetBSD$

GITHUB_PROJECT=	libseccomp
DISTNAME=	libseccomp-2.5.1
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=seccomp/}
GITHUB_RELEASE=	v2.5.1

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/seccomp/libseccomp/
COMMENT=	API for the Linux Kernel's syscall filtering mechanism
LICENSE=	gnu-lgpl-v2.1

GNU_CONFIGURE=	yes
USE_TOOLS+=	gmake pkg-config

PKGCONFIG_OVERRIDE+=	libseccomp.pc.in

.include "../../devel/gperf/buildlink3.mk"
CONFIGURE_ARGS+=	--enable-python
BUILDLINK_API_DEPENDS.py-cython+=	${PYPKGPREFIX}-cython>=0.12.1
.include "../../devel/py-cython/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
