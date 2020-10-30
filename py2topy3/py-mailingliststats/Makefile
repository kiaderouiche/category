# $NetBSD$

GITHUB_PROJECT=	MailingListStats
GITHUB_TAG=	0.4.1
DISTNAME=	${GITHUB_TAG}
PKGNAME=	${PYPKGPREFIX}-${GITHUB_PROJECT:tl}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_GITHUB:=MetricsGrimoire/}
DIST_SUBDIR=	${GITHUB_PROJECT}

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://github.com/MetricsGrimoire/MailingListStats
COMMENT=	Mailing List Stats is a tool to parse and analyze mail boxes
LICENSE=	gnu-gpl-v2

DEPENDS+=	${PYPKGPREFIX}-sqlalchemy>=1.0.9:../../databases/py-sqlalchemy


.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
