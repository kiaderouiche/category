.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

BUILDLINK_PREFIX.flint=	/usr/pkg
BUILDLINK_PREFIX.gmp=	/usr/pkg
BUILDLINK_PREFIX.mpfr=	/usr/pkg
H_GMP=	__nonexistent__
H_MPFR=	__nonexistent__
IS_BUILTIN.gmp=	no
IS_BUILTIN.mpfr=	no
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
USE_BUILTIN.gmp=	no
USE_BUILTIN.mpfr=	no
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/calcium/work
_BLNK_PKG_DBDIR.flint=	/usr/pkg/pkgdb/flint-2.6.3
_BLNK_PKG_DBDIR.gmp=	/usr/pkg/pkgdb/gmp-6.2.0
_BLNK_PKG_DBDIR.mpfr=	/usr/pkg/pkgdb/mpfr-4.1.0
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_TOOLS_USE_PKGSRC.gmake=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find gmake grep gzcat head hostname id install ln ls mkdir mv printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
