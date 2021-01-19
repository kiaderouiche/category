.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

BUILDLINK_PREFIX.go-fastprinter=	/usr/pkg
BUILDLINK_PREFIX.go-fasttemplate=	/usr/pkg
BUILDLINK_PREFIX.go-flags=	/usr/pkg
BUILDLINK_PREFIX.go-incremental=	/usr/pkg
BUILDLINK_PREFIX.go-rsrc=	/usr/pkg
BUILDLINK_PREFIX.go-spew=	/usr/pkg
BUILDLINK_PREFIX.go-streamquote=	/usr/pkg
BUILDLINK_PREFIX.go-zipexe=	/usr/pkg
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/go-rice/work
_BLNK_PKG_DBDIR.go-fastprinter=	/usr/pkg/pkgdb/go-fastprinter-20200109
_BLNK_PKG_DBDIR.go-fasttemplate=	/usr/pkg/pkgdb/go-fasttemplate-1.2.1
_BLNK_PKG_DBDIR.go-flags=	/usr/pkg/pkgdb/go-flags-1.3.0nb12
_BLNK_PKG_DBDIR.go-incremental=	/usr/pkg/pkgdb/go-incremental-1.0.0
_BLNK_PKG_DBDIR.go-rsrc=	/usr/pkg/pkgdb/go-rsrc-0.10.1
_BLNK_PKG_DBDIR.go-spew=	/usr/pkg/pkgdb/go-spew-1.1.1nb12
_BLNK_PKG_DBDIR.go-streamquote=	/usr/pkg/pkgdb/go-streamquote-1.0.0
_BLNK_PKG_DBDIR.go-zipexe=	/usr/pkg/pkgdb/go-zipexe-1.0.1
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find grep gzcat head hostname id install ln ls mkdir mv pax printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
