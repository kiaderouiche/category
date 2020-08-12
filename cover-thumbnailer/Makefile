# $NetBSD$

DISTNAME=	cover-thumbnailer_0.8.3_src
PKGNAME=	${PYPKGPREFIX}-cover-thumbnailer-0.8.3
CATEGORIES=	category
MASTER_SITES=	https://launchpad.net/cover-thumbnailer/v0.8/v0.8.3/+download/

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://launchpad.net/cover-thumbnailer/v0.8/v0.8.3/+download/
COMMENT=	TODO: Short description of the package
ICENSE=		gnu-gpl-v3

USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		# none
NO_CONFIGURE=		yes
NO_BUILD=		yes

USE_TOOLS+=		bash:run msgfmt intltool xgettext

REPLACE_BASH+=		install.sh
REPLACE_PYTHON+=	cover-thumbnailer-gui.py
REPLACE_PYTHON+=	cover-thumbnailer-gui.py

SUBST_CLASSES+=         paths
SUBST_STAGE.paths=      pre-configure
SUBST_SED.paths+=       -e 's,/usr/share/cover-thumbnailer,${DESTDIR}${PREFIX}/share/cover-thumbnailer,g'
SUBST_SED.paths+=       -e 's,/usr/share/man/man1,${DESTDIR}${PREFIX}/man/man1,g'
SUBST_SED.paths+=       -e 's,/usr/share/applications,${DESTDIR}${PREFIX}/share/applications,g'
SUBST_SED.paths+=	-e 's,/usr/share/doc/cover-thumbnailer,${DESTDIR}${PREFIX}/share/doc/cover-thumbnailer,g'
SUBST_SED.paths+=       -e 's,/usr/share/locale/,${DESTDIR}${PREFIX}/share/locale,g'

SUBST_FILES.paths+=     install.sh
SUBST_MESSAGE.paths=    Fixing header search paths.


DEPENDS+=	${PYPKGPREFIX}-gobject3>=3.36.1:../../devel/py-gobject3
DEPENDS+=	${PYPKGPREFIX}-Pillow>=6.2.2:../../graphics/py-Pillow
#DEPENDS+=	${PYPKGPREFIX}-nautilus>=3.16.2:../../wip/nautilus

do-install:
	cd ${WRKSRC} && ${BASH} install.sh --install

.include "../../devel/GConf/buildlink3.mk"
.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../lang/python/application.mk"
.include "../../mk/bsd.pkg.mk"
