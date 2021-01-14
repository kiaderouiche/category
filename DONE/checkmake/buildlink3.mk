# $NetBSD$

BUILDLINK_TREE+=	go-checkmake

.if !defined(GO_CHECKMAKE_BUILDLINK3_MK)
GO_CHECKMAKE_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-checkmake=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-checkmake?=	build

BUILDLINK_API_DEPENDS.go-checkmake+=	go-checkmake>=20200922
BUILDLINK_PKGSRCDIR.go-checkmake?=	../../wip/checkmake

.endif	# GO_CHECKMAKE_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-checkmake
