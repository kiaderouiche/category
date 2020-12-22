.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

BUILDLINK_PREFIX.go-compress=	/usr/pkg
BUILDLINK_PREFIX.go-cpuid=	/usr/pkg
BUILDLINK_PREFIX.go-xxhash=	/usr/pkg
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/go-pgzip/work
_BLNK_PKG_DBDIR.go-compress=	/usr/pkg/pkgdb/go-compress-1.9.1nb12
_BLNK_PKG_DBDIR.go-cpuid=	/usr/pkg/pkgdb/go-cpuid-1.2.1nb12
_BLNK_PKG_DBDIR.go-xxhash=	/usr/pkg/pkgdb/go-xxhash-2.1.0nb12
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find grep gzcat head hostname id install ln ls mkdir mv pax printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
