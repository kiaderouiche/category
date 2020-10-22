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
## option1 SUPPORT
##
.if !empty(PKG_OPTIONS:Moption1)
CONFIGURE_ARGS+=		--enable-option1
.endif

##
## option2 SUPPORT
##
.if !empty(PKG_OPTIONS:option2)
sed -f /tmp/sedrules.options.1700 <<EOF
BUILDLINK_PKGSRCDIR.py37-fastavro?=	../../category/py-fastavro
