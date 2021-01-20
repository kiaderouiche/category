# $NetBSD$

DISTNAME=	go-quic-go-0.19.3
GITHUB_PROJECT=	quic-go
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	net
MASTER_SITES=	${MASTER_SITE_GITHUB:=lucas-clemente/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/lucas-clemente/quic-go/
COMMENT=	QUIC implementation in pure go 
LICENSE=	mit

GO_DIST_BASE=	${GITHUB_PROJECT}-${PKGVERSION_NOREV}
GO_SRCPATH=	github.com/lucas-clemente/quic-go

.include "../../devel/go-protobuf/buildlink3.mk"
.include "../../net/go-net/buildlink3.mk"
.include "../../security/go-crypto/buildlink3.mk"
.include "../../wip/go-genny/buildlink3.mk"
.include "../../wip/go-mock/buildlink3.mk"
.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
