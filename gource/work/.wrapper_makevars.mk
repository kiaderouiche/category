.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

BUILDLINK_PREFIX.bzip2=	/usr
BUILDLINK_PREFIX.freetype2=	/usr/pkg
BUILDLINK_PREFIX.zlib=	/usr
BUILTIN_PKG.bzip2=	bzip2-1.0.8
BUILTIN_PKG.freetype2=	freetype2-2.10.4
BUILTIN_PKG.zlib=	zlib-1.2.11
H_BZIP2=	/usr/include/bzlib.h
H_FREETYPE2=	/usr/pkg/include/freetype2/freetype/freetype.h
H_FREETYPE2_NEW=	__nonexistent__
H_ZLIB=	/usr/include/zlib.h
IS_BUILTIN.bzip2=	yes
IS_BUILTIN.freetype2=	yes
IS_BUILTIN.zlib=	yes
PKG_BUILD_OPTIONS.freetype2=	
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
USE_BUILTIN.bzip2=	yes
USE_BUILTIN.freetype2=	no
USE_BUILTIN.zlib=	yes
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/gource/work
_BLNK_PKG_DBDIR.freetype2=	/usr/pkg/pkgdb/freetype2-2.10.4
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find grep gzcat head hostname id install ln ls mkdir mv pkg-config printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
