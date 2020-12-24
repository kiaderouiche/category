# $NetBSD$

BUILDLINK_TREE+=	libseccomp

.if !defined(LIBSECCOMP_BUILDLINK3_MK)
LIBSECCOMP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libseccomp+=	libseccomp>=2.5.1
BUILDLINK_PKGSRCDIR.libseccomp?=	../../category/libseccomp
.endif	# LIBSECCOMP_BUILDLINK3_MK

BUILDLINK_TREE+=	-libseccomp
