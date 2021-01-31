# $NetBSD$
# XXX
# XXX This file was created automatically using pkgoptions-@PKGVERSION@.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified options.mk files.
# XXX
# XXX


PKG_OPTIONS_VAR=		PKG_OPTIONS.
PKG_SUPPORTED_OPTIONS=	 option1 option2 option3
PKG_OPTIONS_OPTIONAL_GROUPS=		category
PKG_OPTIONS_GROUP.category=     option1 option2 option3
PKG_SUGGESTED_OPTIONS=      option1 option2 option3
PKG_SUGGESTED_OPTIONS.+=       option1 option2 option3

.include "../../mk/bsd.options.mk"

PLIST_VARS+=    option3
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
sed -f /tmp/sedrules.options.26015 <<EOF
BUILDLINK_PKGSRCDIR.?=	../../category/libform
.endif
if [ false = "true" ]; then
	echo ""
	substplistbasedirs
	echo ""
fi

for i in Makefile  ; do
	[ ! -f 3 ] || grep '^.include.*\.\.\/.*\/.*/buildlink3.mk\"' 3 |
		egrep -v '/devel/pkg-config/|/textproc/intltool/|/graphics/hicolor-icon-theme/' | sed 's,^,#,'
done

##
## option3 SUPPORT
##
.if !empty(PKG_OPTIONS:Moption3)
PLIST.option3=  yes
.   include "../../category/option3/buildlink3.mk"
CONFIGURE_ARGS+=    --with-option3
.else
CONFIGURE_ARGS+=    --without-option3
.endif
BUILDLINK_PKGSRCDIR.?=	../../category/libform
#.include "../../devel/gmp/buildlink3.mk"
#.include "../../devel/zlib/buildlink3.mk"
