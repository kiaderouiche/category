# $NetBSD$
# XXX
# XXX This file was created automatically using createbuildlink-3.18.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified buildlink3.mk files.
# XXX
# XXX Packages that only install static libraries or headers should
# XXX include the following line:
# XXX
# XXX	BUILDLINK_DEPMETHOD.libseccomp?=	build

BUILDLINK_TREE+=	libseccomp

.if !defined(LIBSECCOMP_BUILDLINK3_MK)
LIBSECCOMP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libseccomp+=	libseccomp>=2.5.1
BUILDLINK_PKGSRCDIR.libseccomp?=	../../category/libseccomp
.endif	# LIBSECCOMP_BUILDLINK3_MK

BUILDLINK_TREE+=	-libseccomp
