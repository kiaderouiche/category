# $NetBSD$
# XXX
# XXX This file was created automatically using createbuildlink-1.0.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified options.mk files.
# XXX
# XXX Packages that only install static libraries or headers should
# XXX include the following line:
# XXX
# XXX	BUILDLINK_DEPMETHOD.b2?=	build

BUILDLINK_TREE+=	b2

.if !defined(B2_BUILDLINK3_MK)
B2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.b2+=	b2>=2.0alpha6
BUILDLINK_PKGSRCDIR.b2?=	../../category/bertini2
.endif	# B2_BUILDLINK3_MK

BUILDLINK_TREE+=	-b2
