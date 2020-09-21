# $NetBSD$

DISTNAME=	jitcdde-1.7.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	https://files.pythonhosted.org/packages/36/40/bee04a1b1c790188c600284394854b1031ecf41840279d82e1d91f310717/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://github.com/neurophysik/jitcdde
COMMENT=	Just-in-Time Compilation for Delay Differential Equations
#LICENSE=	# TODO: (see mk/license.mk)

BUILD_DEPENDS+=	py-setuptools_scm>=0:../../devel/py-setuptools_scm
DEPENDS+=	# TODO: jitcxde_common>1.3
DEPENDS+=	# TODO: symengine>=0.3.1.dev0
DEPENDS+=	# TODO: chspy>=1.1

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
