# $NetBSD$

DISTNAME=	lark-parser-0.11.1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel lang python
MASTER_SITES=	${MASTER_SITE_PYPI:=l/lark-parser/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/erezsh/lark
COMMENT=	a modern parsing library
LICENSE=	mit

USE_LANGUAGES=	# none

# adhoc fix to convert below
# lark-parser-0.1-py3.8.egg-info
# lark-parser-0.0.0-py3.8.egg-info

#EGG_INFODIR=	${DISTNAME:S/-/_/:S/0.1/0.0.0/}-py${PYVERSSUFFIX}.egg-info

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
