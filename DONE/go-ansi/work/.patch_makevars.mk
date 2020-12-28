.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

BUILDLINK_PREFIX.go-colorable=	/usr/pkg
BUILDLINK_PREFIX.go-isatty=	/usr/pkg
BUILDLINK_PREFIX.go-sys=	/usr/pkg
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/go-ansi/work
_BLNK_PKG_DBDIR.go-colorable=	/usr/pkg/pkgdb/go-colorable-0.0.9nb22
_BLNK_PKG_DBDIR.go-isatty=	/usr/pkg/pkgdb/go-isatty-0.0.3nb26
_BLNK_PKG_DBDIR.go-sys=	/usr/pkg/pkgdb/go-sys-0.0.20200202nb9
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find grep gzcat head hostname id install ln ls mkdir mv pax printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
