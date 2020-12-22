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
# XXX	BUILDLINK_DEPMETHOD.go-cascadia?=	build

BUILDLINK_TREE+=	go-cascadia

.if !defined(GO_CASCADIA_BUILDLINK3_MK)
GO_CASCADIA_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-cascadia=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-cascadia?=		build

BUILDLINK_API_DEPENDS.go-cascadia+=	go-cascadia>=1.0.0
BUILDLINK_PKGSRCDIR.go-cascadia?=	../../category/go-cascadia
.endif	# GO_CASCADIA_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-cascadia
