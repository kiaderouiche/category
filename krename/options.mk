# $NetBSD: options.mk,v 1.2 2014/05/03 13:01:24 alnsn Exp $

PKG_OPTIONS_VAR=		PKG_OPTIONS.krename
PKG_SUPPORTED_OPTIONS=		taglib podofo exiv2 freetype

.include "../../mk/bsd.options.mk"

###
### freetype support
###
.if !empty(PKG_OPTIONS:freetype)
.include "../../graphics/freetype2/buildlink3.mk"
CMAKE_ARGS+=	-DLUA_ENABLED:LUA_ENABLED=true
.endif

###
### podofo support
###
.if !empty(PKG_OPTIONS:podofo)
LUA_VERSIONS_INCOMPATIBLE=	52
.  include "../../lang/lua/buildlink3.mk"
CMAKE_ARGS+=	-DLUA_ENABLED:LUA_ENABLED=true
.endif

###
### taglib support
###
.if !empty(PKG_OPTIONS:Mtaglib)
BUILDLINK_API_DEPENDS.taglib+=	taglib>=1.0
.include "../../audio/taglib/buildlink3.mk"
CMAKE_ARGS+=	-DLUA_ENABLED:LUA_ENABLED=true
.endif

###
### exiv2 support
###
.if !empty(PKG_OPTIONS:Mexiv2)
.include "../../audio/taglib/buildlink3.mk"
CMAKE_ARGS+=	-DLUA_ENABLED:LUA_ENABLED=true
.endif
