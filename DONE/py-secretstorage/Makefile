# $NetBSD$

DISTNAME=	SecretStorage-3.2.0
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:tl}
CATEGORIES=	security python
MASTER_SITES=	${MASTER_SITE_PYPI:=S/SecretStorage/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/mitya57/secretstorage
COMMENT=	Python bindings to FreeDesktop.org Secret Service API
LICENSE=	modified-bsd

USE_LANGUAGES=	# none

PYTHON_VERSIONS_INCOMPATIBLE=	27

DEPENDS+=	${PYPKGPREFIX}-cryptography>=2.9.2:../../security/py-cryptography
DEPENDS+=	${PYPKGPREFIX}-jeepney>=0.5.0:../../wip/py-jeepney

SUBST_CLASSES+=			py_interpreter
SUBST_FILES.py_interpreter+=	tests/run_tests.py
SUBST_STAGE.py_interpreter=	pre-configure
SUBST_VARS.py_interpreter=	PREFIX
SUBST_SED.py_interpreter+=	-e 's,python3,${PREFIX}/bin/python${PYVERSSUFFIX},g'
SUBST_MESSAGE.paths=		Fixing header search paths.

do-test:
	${RUN} cd ${WRKSRC}/tests; ${SETENV} ${TEST_ENV} ${PYTHONBIN} run_tests.py

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
