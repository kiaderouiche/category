# $NetBSD: options.mk,v 1.6 2013/08/01 18:44:06 riastradh Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.pymanopt
PKG_SUPPORTED_OPTIONS=	py-autograd py-tensorflow py-theano
PKG_SUGGESTED_OPTIONS=	py-autograd py-theano

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mpy-autograd)
.include "../../math/glpk/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-glpk
.endif

.if !empty(PKG_OPTIONS:Mpy-theano)
.include "../../devel/hdf5/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--without-hdf5
.endif
