# $NetBSD$

DISTNAME=	trio-0.17.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	category python
MASTER_SITES=	https://files.pythonhosted.org/packages/31/9b/12769731da9e0fe85019995693d478af202407389db2ec9822f4953c1807/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/python-trio/trio
COMMENT=	A friendly Python library for async concurrency and I/O
LICENSE=	mit OR apache-2.0

DEPENDS+=	${PYPKGPREFIX}-attrs>=19.2.0:../../devel/py-attrs
DEPENDS+=	${PYPKGPREFIX}-sortedcontainers>=0:../../devel/py-sortedcontainers
DEPENDS+=	${PYPKGPREFIX}-async_generator>=1.9:../../devel/py-async_generator
DEPENDS+=	${PYPKGPREFIX}-idna>=0:../../www/py-idna
#DEPENDS+=	${PYPKGPREFIX}-outcome>=1.1.0:../../wip/py-outcome
DEPENDS+=	${PYPKGPREFIX}-sniffio>=0:../../misc/py-sniffio
DEPENDS+=	${PYPKGPREFIX}-cffi>=1.14;os_name=='nt'andimplementation_name!='pypy':../../devel/py-cffi
DEPENDS+=	${PYPKGPREFIX}-contextvars>=2.1;python_version<'3.7':../../devel/py-contextvars

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
