# $NetBSD: options.mk,v 1.8 2021/01/01 15:25:51 jihbed Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.lhapdf
PKG_SUPPORTED_OPTIONS=	lhaglue python
PKG_SUGGESTED_OPTIONS+=	lhaglue python
PLIST_VARS+=		lhaglue python

.include "../../mk/bsd.options.mk"

###
### Enable lhaglue support
###
.if !empty(PKG_OPTIONS:Mlhaglue)
.else
CONFIGURE_ARGS+=	--disable-lhaglue
.endif

###
### Enable python support
###
.if !empty(PKG_OPTIONS:Mpython)
PY_PATCHPLIST=		yes
REPLACE_PYTHON+=  lhapdf.in
PYTHON_VERSIONS_ACCEPTED=	27
.  include "../../lang/python/application.mk"
.  include "../../lang/python/extension.mk"
BUILDLINK_API_DEPENDS.py-cython+=       ${PYPKGPREFIX}-cython>=0.12.1
.  include "../../devel/py-cython/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--disable-python
.endif
