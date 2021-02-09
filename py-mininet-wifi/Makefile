# $NetBSD$

DISTNAME=	mininet-wifi-2.4.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
GITHUB_PROJECT=	mininet-wifi
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=intrig-unicamp/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	http://mininet-wifi.github.io/
COMMENT=	Emulator for Software-Defined Wireless Networks
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-matplotlib>=3.3.4:../../graphics/py-matplotlib

.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
