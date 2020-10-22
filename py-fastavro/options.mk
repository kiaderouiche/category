# $NetBSD$
# XXX
# XXX This file was created automatically using pkgoptions-0.2.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified options.mk files.
# XXX
# XXX


PKG_OPTIONS_VAR=		PKG_OPTIONS.py37-fastavro
PKG_SUPPORTED_OPTIONS=	 option1 option2 option3
PKG_OPTIONS_OPTIONAL_GROUPS=		category
PKG_OPTIONS_GROUP.category=     option1 option2 option3
PKG_SUGGESTED_OPTIONS=      option1 option2 option3
PKG_SUGGESTED_OPTIONS.py37-fastavro+=       option1 option2 option3

.include "../../mk/bsd.options.mk"

PLIST_VARS+=    option3
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
