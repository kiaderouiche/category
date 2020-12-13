import functools
import sys

import _common

# just making sure importing Trio doesn't fail if sys.excepthook doesn't have a
# .__name__ attribute

sys.excepthook = functools.partial(sys.excepthook)

assert not hasattr(sys.excepthook, "__name__")

import trio
