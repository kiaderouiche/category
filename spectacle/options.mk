# $NetBSD$
# XXX
# XXX This file was created automatically using pkgoptions-1.0.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified options.mk files.
# XXX
# XXX

PKG_OPTIONS_VAR=		PKG_OPTIONS.spectacle
PKG_SUPPORTED_OPTIONS=	 KF5Kipi
PKG_OPTIONS_OPTIONAL_GROUPS=		category
PKG_OPTIONS_GROUP.category=     option1 option2 option3
PKG_SUGGESTED_OPTIONS=      spectacle
PKG_SUGGESTED_OPTIONS.spectacle+=       spectacle

.include "../../mk/bsd.options.mk"

##
## option1 SUPPORT
##
.if !empty(PKG_OPTIONS:Moption1)
CONFIGURE_ARGS+=		--enable-option1
.endif

##
## option2 SUPPORT
##
.if !empty(PKG_OPTIONS:option2)
.   include "../../category/option2/buildlink3.mk"
.endif
##
## option3 SUPPORT
##
.if !empty(PKG_OPTIONS:Moption3)
.   include "../../category/option3/buildlink3.mk"
CONFIGURE_ARGS+=    --with-option3
.else
CONFIGURE_ARGS+=    --without-option3
.endif
BUILDLINK_PKGSRCDIR.spectacle?=	../../category/spectacle

# XXX
# XXX Uncomment and keep only the buildlink3 lines below which are directly
# XXX needed for dependencies to compile, link, and run.  If this package
# XXX provides a wrappered API or otherwise does not expose the APIs of the
# XXX buildlink3 lines below to dependencies, remove them.
# XXX
#.include "../../devel/kio/buildlink3.mk"
#.include "../../devel/knotifications/buildlink3.mk"
#.include "../../devel/kservice/buildlink3.mk"
#.include "../../devel/kwayland/buildlink3.mk"
#.include "../../net/knewstuff/buildlink3.mk"
#.include "../../security/kauth/buildlink3.mk"
#.include "../../sysutils/solid/buildlink3.mk"
#.include "../../textproc/kcodecs/buildlink3.mk"
#.include "../../textproc/kcompletion/buildlink3.mk"
#.include "../../x11/libxcb/buildlink3.mk"
#.include "../../x11/kconfigwidgets/buildlink3.mk"
#.include "../../x11/kitemviews/buildlink3.mk"
#.include "../../x11/kjobwidgets/buildlink3.mk"
#.include "../../x11/xcb-util-cursor/buildlink3.mk"
#.include "../../x11/xcb-util-image/buildlink3.mk"
#.include "../../x11/xcb-util/buildlink3.mk"
#.include "../../x11/qt5-qtsvg/buildlink3.mk"
#.include "../../x11/qt5-qtwayland/buildlink3.mk"
#.include "../../x11/qt5-qtx11extras/buildlink3.mk"
#.include "../../x11/qt5-qtbase/buildlink3.mk"
