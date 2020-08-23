# $NetBSD$

DISTNAME=	arxiv-connections-0.1.2
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/93/e1/78dd17c48dd6611711de4ddc6f4315ed7edece86f743bb7c22c41a4a0ea5/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	None
COMMENT=	python package used to visualize academics and find related people
#LICENSE=	# TODO: (see mk/license.mk)

DEPENDS+=	py-arxiv>=0.5.3,<0.6.0:../../category/py-arxiv
DEPENDS+=	py-click>=7.1.2,<8.0.0:../../devel/py-click
DEPENDS+=	py-matplotlib>=3.3.0,<4.0.0:../../graphics/py-matplotlib
DEPENDS+=	# TODO: nb_black>=1.0.7,<2.0.0
DEPENDS+=	py-networkx>=2.4,<3.0:../../math/py-networkx
DEPENDS+=	py-pandas>=1.1.0,<2.0.0:../../math/py-pandas
DEPENDS+=	py-plotly>=4.9.0,<5.0.0:../../wip/py-plotly
DEPENDS+=	py-wheel>=0.34.2,<0.35.0:../../devel/py-wheel

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
