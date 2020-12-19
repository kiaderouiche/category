# $NetBSD$

DISTNAME=	flatbuffers-1.12
EGG_INFODIR?=	flatbuffers-20201129142929-py${PYVERSSUFFIX}.egg-info
#EGG_NAME=	flatbuffers-20201129142929-py${PYVERSSUFFIX}.egg-info
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	devel python
MASTER_SITES=	${MASTER_SITE_PYPI:=f/flatbuffers/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://google.github.io/flatbuffers/
COMMENT=	The FlatBuffers serialization format for Python
LICENSE=	apache-2.0

# adhoc fix to convert below
# lark-parser-0.1-py3.8.egg-info
# lark-parser-0.0.0-py3.8.egg-info

#EGG_INFODIR=	${DISTNAME:S/-/_/:S/0.1/0.0.0/}-py${PYVERSSUFFIX}.egg-info

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
