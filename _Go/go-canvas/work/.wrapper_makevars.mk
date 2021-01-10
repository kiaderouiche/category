.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

BUILDLINK_PREFIX.go-freetype=	/usr/pkg
BUILDLINK_PREFIX.go-image=	/usr/pkg
BUILDLINK_PREFIX.go-text=	/usr/pkg
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/go-canvas/work
_BLNK_PKG_DBDIR.go-freetype=	/usr/pkg/pkgdb/go-freetype-20170609
_BLNK_PKG_DBDIR.go-image=	/usr/pkg/pkgdb/go-image-20170405nb25
_BLNK_PKG_DBDIR.go-text=	/usr/pkg/pkgdb/go-text-0.3.3nb2
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find grep gzcat head hostname id install ln ls mkdir mv pax printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
