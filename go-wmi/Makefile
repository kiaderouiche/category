# $NetBSD$

DISTNAME=	go-wmi-1.1.0
GITHUB_PROJECT=	wmi
CATEGORIES=	sysutils
MASTER_SITES=	${MASTER_SITE_GITHUB:=StackExchange/}
GITHUB_TAG=	${PKGVERSION_NOREV}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/StackExchange/wmi/
COMMENT=	Package wmi provides a WQL interface to Windows WMI 
LICENSE=	mit

GO_SRCPATH=     github.com/StackExchange/wmi
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

#.include "../../wip/go-ole/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
