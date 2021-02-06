# $NetBSD$

VERSION=	3.1
DISTNAME=	firefly-master
PKGNAME=	${DISTNAME:S/-master//}-${VERSION}
CATEGORIES=	math
MASTER_SITES=	https://gitlab.com/firefly-library/firefly/-/archive/master/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	jihbed.research@gmail.com
HOMEPAGE=	https://gitlab.com/firefly-library/firefly
COMMENT=	Library for rational functions written in C++
#LICENSE=	# TODO: (see mk/license.mk)

USE_CMAKE=	yes
USE_LANGUAGES=	c c++

#C++ compiler supporting C++14

.include "../../devel/gmp/build.mk"
.include "../../wip/flint/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
