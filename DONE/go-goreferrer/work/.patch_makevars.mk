.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

BUILDLINK_PREFIX.go-crypto=	/usr/pkg
BUILDLINK_PREFIX.go-net=	/usr/pkg
BUILDLINK_PREFIX.go-sys=	/usr/pkg
BUILDLINK_PREFIX.go-text=	/usr/pkg
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/go-goreferrer/work
_BLNK_PKG_DBDIR.go-crypto=	/usr/pkg/pkgdb/go-crypto-0.0.20200122nb4
_BLNK_PKG_DBDIR.go-net=	/usr/pkg/pkgdb/go-net-20200130nb9
_BLNK_PKG_DBDIR.go-sys=	/usr/pkg/pkgdb/go-sys-0.0.20200202nb9
_BLNK_PKG_DBDIR.go-text=	/usr/pkg/pkgdb/go-text-0.3.3nb2
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find grep gzcat head hostname id install ln ls mkdir mv pax printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
