# $NetBSD$

DISTNAME=	cover-thumbnailer_0.8.3_src
PKGNAME=	cover-thumbnailer-0.8.3
CATEGORIES=	category
MASTER_SITES=	https://launchpad.net/cover-thumbnailer/v0.8/v0.8.3/+download/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://launchpad.net/cover-thumbnailer/v0.8/v0.8.3/+download/
COMMENT=	TODO: Short description of the package
ICENSE=		gnu-gpl-v3

USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		# none
USE_TOOLS+=	bash msgfmt intltool

REPLACE_BASH+=	install.sh
REPLACE_PYTHON+=	cover-thumbnailer-gui.py

SUBST_CLASSES+=         paths
SUBST_STAGE.paths=      pre-configure
SUBST_SED.paths+=       -e 's,tlslite/scripts/tlsdb.py,tlsdb${PYVERSSUFFIX},g'
SUBST_SED.paths+=       -e 's,/usr/share/man/man1,${PREFIX}/man/man1,g'
SUBST_SED.paths+=       -e 's,/usr/share/applications,${PREFIX}/share/applications,g\'
SUBST_SED.paths+=	-e 's,/usr/share/doc/cover-thumbnailer,${PREFIX}/share/doc/cover-thumbnailer,g'
SUBST_FILES.paths+=     install.sh
SUBST_MESSAGE.paths=    Fixing header search paths.

.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
