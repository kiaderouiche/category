# $NetBSD$

DISTNAME=	discopop-1.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/25/9a/82c0440c47c09285f4fc9d3e039bf6b2895f806ce72fc8e2c0f9e84a432a/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.discopop.tu-darmstadt.de/
COMMENT=	DiscoPoP is a tool that helps software developers parallelize their programs with threads. It discovers potential parallelism in a sequential program and makes recommendations on how to exploit it
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-matplotlib>=0:../../graphics/py-matplotlib
DEPENDS+=	py-networkx>=0:../../math/py-networkx
DEPENDS+=	py-pluginbase>=1.0.0:../../wip/py-pluginbase
DEPENDS+=	py-contextlib2>=0.5.5:../../devel/py-contextlib2
DEPENDS+=	py-docopt>=0.6.2:../../devel/py-docopt
DEPENDS+=	py-lxml>=4.3.3:../../textproc/py-lxml
DEPENDS+=	# TODO: schema>=0.7.0

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.16.3
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
