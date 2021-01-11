.if !defined(_MAKEVARS_MK)
_MAKEVARS_MK=	defined

PERL5_SUB_INSTALLARCHLIB=	lib/perl5/5.32.0/x86_64-linux-thread-multi
PERL5_SUB_INSTALLSCRIPT=	lib/perl5/bin
PERL5_SUB_INSTALLVENDORARCH=	lib/perl5/vendor_perl/5.32.0/x86_64-linux-thread-multi
PERL5_SUB_INSTALLVENDORBIN=	lib/perl5/vendor_perl/bin
PERL5_SUB_INSTALLVENDORLIB=	lib/perl5/vendor_perl/5.32.0
PERL5_SUB_INSTALLVENDORMAN1DIR=	lib/perl5/vendor_perl/man/man1
PERL5_SUB_INSTALLVENDORMAN3DIR=	lib/perl5/vendor_perl/man/man3
PERL5_SUB_INSTALLVENDORSCRIPT=	lib/perl5/vendor_perl/bin
TOOLS_DEPENDS.ghostscript=	ghostscript>=6.01:../../print/ghostscript
_BLNK_PHYSICAL_PATH.LOCALBASE=	/usr/pkg
_BLNK_PHYSICAL_PATH.WRKDIR=	/usr/pkgsrc/category/samurai/work
_IGNORE_INFO_PATH=	
_MANCOMPRESSED=	no
_MANZ=	no
_PERL5_PREFIX=	/usr/pkg
_PERL5_REQD=	5.0
_PERL5_VARS_OUT=	prefix=/usr/pkg installarchlib=/usr/pkg/lib/perl5/5.32.0/x86_64-linux-thread-multi installscript=/usr/pkg/lib/perl5/bin installvendorbin=/usr/pkg/lib/perl5/vendor_perl/bin installvendorscript=/usr/pkg/lib/perl5/vendor_perl/bin installvendorarch=/usr/pkg/lib/perl5/vendor_perl/5.32.0/x86_64-linux-thread-multi installvendorlib=/usr/pkg/lib/perl5/vendor_perl/5.32.0 installvendorman1dir=/usr/pkg/lib/perl5/vendor_perl/man/man1 installvendorman3dir=/usr/pkg/lib/perl5/vendor_perl/man/man3
_TOOLS_USE_PKGSRC.gmake=	no
_USE_TOOLS=	[ awk basename cat chgrp chmod chown cmp cp curl cut date diff digest dirname echo egrep env expr false fgrep find gmake grep gzcat head hostname id install ln ls mkdir mv patch perl pkg-config printf pwd rm rmdir sed sh sort tail tar test touch tr true uname wc xargs

.endif # _MAKEVARS_MK
