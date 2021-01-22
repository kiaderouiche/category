# $NetBSD$

BUILDLINK_TREE+=	go-whatlanggo

.if !defined(GO_WHATLANGGO_BUILDLINK3_MK)
GO_WHATLANGGO_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-whatlanggo=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-whatlanggo?=		build

BUILDLINK_API_DEPENDS.go-whatlanggo+=	go-whatlanggo>=1.0.1
BUILDLINK_PKGSRCDIR.go-whatlanggo?=	../../wip/go-whatlanggo
.endif	# GO_WHATLANGGO_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-whatlanggo
