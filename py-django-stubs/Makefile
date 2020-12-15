# $NetBSD$

DISTNAME=	django-stubs-1.7.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/41/98/369f6daf6e96b3a1ce1d15f98c30403323395defbbc7c9e15270e4b476ad/

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/typeddjango/django-stubs
COMMENT=	Mypy stubs for Django
LICENSE=	mit

DEPENDS+=	py-mypy>=0.790:../../lang/py-mypy
DEPENDS+=	${PYPKGPREFIX}-typing-extensions>=3.7.4.3:../../devel/py-typing-extensions
DEPENDS+=	${PYPKGPREFIX}-django>=1.11.29:../../www/py-django

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
