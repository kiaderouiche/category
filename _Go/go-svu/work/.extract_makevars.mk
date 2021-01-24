.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

BUILDLINK_PREFIX.go-kingpin.v3-unstable=	/usr/pkg
BUILDLINK_PREFIX.go-semver=	/usr/pkg
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/go-svu/work
_BLNK_PKG_DBDIR.go-kingpin.v3-unstable=	/usr/pkg/pkgdb/go-kingpin.v3-unstable-3.0.0.0.20100811nb21
_BLNK_PKG_DBDIR.go-semver=	/usr/pkg/pkgdb/go-semver-3.1.1
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find grep gzcat head hostname id install ln ls mkdir mv pax printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
