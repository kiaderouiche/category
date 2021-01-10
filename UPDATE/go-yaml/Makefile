# $NetBSD$

DISTNAME=	go-yaml-2.4.0
GITHUB_PROJECT=	yaml
GITHUB_TAG=	v${PKGVERSION_NOREV}
CATEGORIES=	textproc
MASTER_SITES=	${MASTER_SITE_GITHUB:=go-yaml/}

MAINTAINER=     pkgsrc-users@NetBSD.org
HOMEPAGE=       https://gopkg.in/yaml.v2
COMMENT=        YAML support for the Go language
LICENSE=        gnu-lgpl-v3

GO_SRCPATH=     github.com/mailru/easyjson
GO_DIST_BASE=   ${GITHUB_PROJECT}-${PKGVERSION_NOREV}

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
