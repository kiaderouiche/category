
PKG_OPTIONS_VAR=	PKG_OPTIONS.pymanopt
PKG_SUPPORTED_OPTIONS=	py-autograd py-tensorflow py-Theano
PKG_SUGGESTED_OPTIONS=	py-autograd py-Theano

.include "../../mk/bsd.options.mk"

.if !empty(PKG_OPTIONS:Mpy-autograd)
DEPENDS+=	${PYPKGPREFIX}-autograd>=1.3:../../math/py-autograd
CONFIGURE_ARGS+=        --with-py-autograd
.endif

.if !empty(PKG_OPTIONS:Mpy-theano)
DEPENDS+=	${PYPKGPREFIX}-Theano>=1.0.4:../../math/py-Theano
CONFIGURE_ARGS+=        --with-py-Theano
.endif
