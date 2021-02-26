# $NetBSD$


DISTNAME=       easyocr-1.2.5
PKGNAME=        ${PYPKGPREFIX}-${DISTNAME}
GITHUB_PROJECT= EasyOCR
GITHUB_TAG=     v${PKGVERSION_NOREV}
CATEGORIES=	category python
MASTER_SITES=	${MASTER_SITE_GITHUB:=JaidedAI/}

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/jaidedai/easyocr
COMMENT=	End-to-End Multi-Lingual Optical Character Recognition (OCR) Solution
LICENSE=	apache-2.0

DEPENDS+=	# TODO: torch>=0
DEPENDS+=	# TODO: torchvision>=0.5
DEPENDS+=	# TODO: opencv-python>=0
DEPENDS+=	# TODO: scipy>=0
DEPENDS+=	# TODO: numpy>=0
DEPENDS+=	py-Pillow>=0:../../graphics/py-Pillow
DEPENDS+=	# TODO: scikit-image>=0
DEPENDS+=	# TODO: python-bidi>=0
DEPENDS+=	# TODO: PyYAML>=0

WRKSRC=		${WRKDIR}/EasyOCR-1.2.5
USE_LANGUAGES=	# none

# TODO: Migrate MASTER_SITES to MASTER_SITE_PYPI
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
