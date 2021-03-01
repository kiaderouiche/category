.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

BUILDLINK_PREFIX.dl=	/usr
BUILDLINK_PREFIX.gettext=	/usr
BUILDLINK_PREFIX.iconv=	/usr
BUILDLINK_PREFIX.pthread=	/usr
BUILDLINK_PREFIX.python38=	/usr/pkg
BUILTIN_LIB_FOUND.c_r=	no
BUILTIN_LIB_FOUND.dl=	yes
BUILTIN_LIB_FOUND.iconv=	no
BUILTIN_LIB_FOUND.intl=	no
BUILTIN_LIB_FOUND.pthread=	yes
BUILTIN_LIB_FOUND.rt=	yes
H_CITRUS_ICONV=	__nonexistent__
H_DL=	/usr/include/dlfcn.h
H_GENTOO_GETTEXT=	__nonexistent__
H_GETTEXT=	/usr/include/libintl.h
H_GLIBC_ICONV=	/usr/include/iconv.h
H_ICONV=	__nonexistent__
H_NGETTEXT_GETTEXT=	/usr/include/libintl.h
H_OPNSVR5_GETTEXT=	__nonexistent__
H_PTHREAD=	/usr/include/pthread.h
IS_BUILTIN.dl=	yes
IS_BUILTIN.gettext=	yes
IS_BUILTIN.iconv=	no
IS_BUILTIN.pthread=	yes
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
USE_BUILTIN.dl=	yes
USE_BUILTIN.gettext=	yes
USE_BUILTIN.iconv=	yes
USE_BUILTIN.pthread=	yes
_BLNK_DLOPEN_REQUIRE_PTHREADS=	no
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/py-azure-core/work
_BLNK_PKG_DBDIR.python38=	/usr/pkg/pkgdb/python38-3.8.7
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find grep head hostname id install ln ls mkdir mv printf pwd rm rmdir sed sh sort tail test touch tr true uname unzip wc xargs

.endif # _MAKEVARS_MK
