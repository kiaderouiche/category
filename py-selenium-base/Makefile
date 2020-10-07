# $NetBSD$

DISTNAME=	selenium-base-1.49.23
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	www python
MASTER_SITES=	https://files.pythonhosted.org/packages/a7/86/6783ab822a18296a3baeaf186c6361c6d9e4f9b18bd2b57097a83ce3e2ac/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/seleniumbase/SeleniumBase
COMMENT=	Complete framework for Web-UI testing
LICENSE=	mit

#DEPENDENCY FOR Python>=3.7
DEPENDS+=       ${PYPKGPREFIX}-zipp>=1.2.0:../../archivers/py-zipp
DEPENDS+=       ${PYPKGPREFIX}-chardet>=3.0.4:../../converters/py-chardet
DEPENDS+=       ${PYPKGPREFIX}-pymysql>=0.10.0:../../databases/py-pymysql
DEPENDS+=       ${PYPKGPREFIX}-packaging>=20.4:../../devel/py-packaging
DEPENDS+=	${PYPKGPREFIX}-setuptools_scm>=4.1.2:../../devel/py-setuptools_scm
DEPENDS+=       ${PYPKGPREFIX}-test-metadata>=1.7.04:../../devel/py-test-metadata
DEPENDS+=       ${PYPKGPREFIX}-test-rerunfailures>=9.0:../../devel/py-test-rerunfailures
DEPENDS+=       ${PYPKGPREFIX}-parso>=0.8.0:../../lang/py-parso
DEPENDS+=       ${PYPKGPREFIX}-six>=1.15.1:../../lang/py-six
DEPENDS+=	${PYPKGPREFIX}-cssselect>=1.1.0:../../textproc/py-cssselect
DEPENDS+=       ${PYPKGPREFIX}-wheel>=:../../devel/py-wheel
DEPENDS+=       ${PYPKGPREFIX}-test-html>=1.17.0:../../wip/py-test-html
DEPENDS+=       ${PYPKGPREFIX}-soupsieve>=1.9.5:../../www/py-soupsieve
DEPENDS+=       ${PYPKGPREFIX}-boto-[0-9]*:../../net/py-boto
DEPENDS+=       ${PYPKGPREFIX}-idna>=2.10:../../www/py-idna
DEPENDS+=       ${PYPKGPREFIX}-pluggy>=0.13.1:../../devel/py-pluggy
DEPENDS+=       ${PYPKGPREFIX}-attrs>=19.3.0:../../devel/py-attrs
DEPENDS+=       ${PYPKGPREFIX}-traitlets>=4.3.3:../../devel/py-traitlets
DEPENDS+=       ${PYPKGPREFIX}-otp>=2.4.0:../../wip/py-otp
DEPENDS+=       ${PYPKGPREFIX}-importlib-metadata>=1.7.0:../../devel/py-importlib-metadata
DEPENDS+=       ${PYPKGPREFIX}-virtualenv>=20.0.32:../../devel/py-virtualenv
DEPENDS+=       ${PYPKGPREFIX}-jedi>=0.17.2:../../editors/py-jedi
DEPENDS+=       ${PYPKGPREFIX}-pip>=2.4.0:../../devel/py-pip
DEPENDS+=       ${PYPKGPREFIX}-urllib3>=1.25.10:../../www/py-urllib3
DEPENDS+=       ${PYPKGPREFIX}-requests>=2.24.0:../../devel/py-requests
DEPENDS+=       ${PYPKGPREFIX}-more-itertools>=8.5.0:../../wip/py-more-itertools
DEPENDS+=       ${PYPKGPREFIX}-coverage>=0.7.4:../../devel/py-coverage
DEPENDS+=       ${PYPKGPREFIX}-brython>=0.7.4:../../devel/py-brython
DEPENDS+=       ${PYPKGPREFIX}-nose>=1.3.7:../../devel/py-nose
DEPENDS+=       ${PYPKGPREFIX}-parso>=0.8.0:../../lang/py-parso
DEPENDS+=       ${PYPKGPREFIX}-parameterized>=0.7.4:../../devel/py-parameterized
DEPENDS+=       ${PYPKGPREFIX}-prompt_toolkit-3.0.7>=1.0.3:../../devel/py-prompt_toolkit
DEPENDS+=       ${PYPKGPREFIX}-test-metadata>=1.7.04:../../devel/py-test-metadata
DEPENDS+=       ${PYPKGPREFIX}-setuptools-scm>=4.1.2:../../devel/py-setuptools-scm
DEPENDS+=       ${PYPKGPREFIX}-rich>=7.1.0:../../wip/py-rich
DEPENDS+=       ${PYPKGPREFIX}-certifi>=2020.6.20:../../devel/py-certifi
DEPENDS+=       ${PYPKGPREFIX}-colorama>=0.4.3:../../devel/py-colorama
DEPENDS+=       ${PYPKGPREFIX}-cryptography>=3.1.1:../../devel/py-cryptography
DEPENDS+=       ${PYPKGPREFIX}-openssl>=0.7.4:../../security/py-openssl
DEPENDS+=       ${PYPKGPREFIX}-pygments>=0.7.4:../../devel/py-pygments
DEPENDS+=       ${PYPKGPREFIX}-pdfminer-six-[0-9]*:../../wip/py-pdfminer-six
DEPENDS+=       ${PYPKGPREFIX}-beautifulsoup4>=0.7.4:../../www/py-beautifulsoup4
DEPENDS+=       ${PYPKGPREFIX}-selenium>=3.141.0:../../www/py-selenium


USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
