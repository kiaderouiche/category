# $NetBSD$
# XXX
# XXX This file was created automatically using pkgoptions-1.0.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified options.mk files.
# XXX
# XXX

PKG_OPTIONS_VAR=		PKG_OPTIONS.pkgoptions
PKG_SUPPORTED_OPTIONS=	 pkgoptions
PKG_OPTIONS_OPTIONAL_GROUPS=		category
PKG_OPTIONS_GROUP.category=     option1 option2 option3
PKG_SUGGESTED_OPTIONS=      pkgoptions
PKG_SUGGESTED_OPTIONS.pkgoptions+=       pkgoptions

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
BUILDLINK_PKGSRCDIR.pkgoptions?=	../../category/pkgoptions
.endif	# PKGOPTIONS_BUILDLINK3_MK

BUILDLINK_TREE+=	-pkgoptions
