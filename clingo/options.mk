# $NetBSD: options.mk,v 1.17 2020/03/23 15:56:55 wiz Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.clingo
PKG_SUPPORTED_OPTIONS=	lua python
PKG_SUGGESTED_OPTIONS+=	lua python
PLIST_VARS+=		lua python

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mlua)
.include "../../lang/lua53/buildlink3.mk"
CONFIGURE_ARGS+=	--disable-monodoc # XXX broken
PLIST.mono=		yes
.else
CONFIGURE_ARGS+=	--disable-mono --disable-monodoc
.endif

###
### Enable python support
###
.if !empty(PKG_OPTIONS:Mpython)
PY_PATCHPLIST=		yes
.  include "../../lang/python/application.mk"
REPLACE_PYTHON+=	avahi-python/avahi-discover/__init__.py
.  include "../../lang/python/extension.mk"
.  include "../../sysutils/py-dbus/buildlink3.mk"
DEPENDS+=		${PYPKGPREFIX}-libxml2-[0-9]*:../../textproc/py-libxml2
DEPENDS+=		${PYPKGPREFIX}-expat-[0-9]*:../../textproc/py-expat
### If python and gdbm are enabled we need py-gdbm as well
.  if !empty(PKG_OPTIONS:Mgdbm)
DEPENDS+=		${PYPKGPREFIX}-gdbm-[0-9]*:../../databases/py-gdbm
PLIST_SRC+=		${PKGDIR}/PLIST.pygdbm
.  endif
PLIST_SRC+=		${PKGDIR}/PLIST.python
.else
CONFIGURE_ARGS+=	--disable-python
CONFIGURE_ARGS+=	--disable-python-dbus
.endif

.if !empty(PKG_OPTIONS:Mtests)
CONFIGURE_ARGS+=	--enable-tests
.endif
