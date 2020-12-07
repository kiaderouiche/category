.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/py-swh-scheduler/work
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find grep gzcat head hostname id install ln ls mkdir mv printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
