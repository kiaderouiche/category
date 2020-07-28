# $NetBSD$

DISTNAME=	fermilib-0.1a3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/e0/08/cce26340c8a2f2bca318e3c566f458f893c49cd8542a8e84984c8871f04e/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.projectq.ch
COMMENT=	FermiLib - An open source package for analyzing, compiling and emulating quantum algorithms for simulation of fermions
LICENSE=	apache-2.0

DEPENDS+=	py-scipy>=0.18.0:../../math/py-scipy
DEPENDS+=	# TODO: pytest>=3.0
DEPENDS+=	py-h5py>=0:../../devel/py-h5py
DEPENDS+=	py-future>=0:../../devel/py-future
DEPENDS+=	# TODO: projectq>=0.3.1

USE_LANGUAGES=	# none

BUILDLINK_API_DEPENDS.py-numpy+=	py-numpy>=1.11.0
.include "../../math/py-numpy/buildlink3.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
