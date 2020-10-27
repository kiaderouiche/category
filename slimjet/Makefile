# $NetBSD$

DISTNAME=	slimjet_amd64
CATEGORIES=	category
MASTER_SITES=	https://www.slimjetbrowser.com/beta/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://www.slimjetbrowser.com/beta/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

WRKSRC=		${WRKDIR}/slimjet

EMUL_PLATFORMS=		freebsd-i386 freebsd-x86_64 \
			linux-i386 linux-x86_64
			
NO_BUILD=		yes

.include "../../mk/bsd.prefs.mk"

PLIST_VARS+=		ia32w linux

.if ${EMUL_OPSYS} == "linux"
EMUL_MODULES.linux=	base x11 fontconfig
EMUL_REQD=		suse>=11.3
OPERA_ARCH.x86_64=	x86_64
OPERA_OPSYS_SUBDIR=	linux
.  if !defined(EMUL_IS_NATIVE) && ${OPSYS} == "NetBSD"
TOOLS_CREATE+=		md5
TOOLS_SCRIPT.md5=	/usr/bin/md5 -n "$$2" | { read sum file; echo $$sum; }
.  endif
.  if ${EMUL_ARCH} == "x86_64"
PLIST.ia32w=		yes
.  endif
PLIST.linux=		yes

.elif ${EMUL_OPSYS} == "freebsd"
OPERA_ARCH.x86_64=		amd64
OPERA_OPSYS_SUBDIR=		unix
# XXX: TBD
#.  if defined(EMUL_IS_NATIVE)
#DEPENDS+=			{gtk2+-[0-9]*,kdelibs4-[0-9]*}:../../x11/gtk2
#CHECK_SHLIBS_SUPPORTED=	no
#.  endif
.endif
.include "../../mk/bsd.pkg.mk"
