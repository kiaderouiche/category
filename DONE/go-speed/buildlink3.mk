# $NetBSD$

BUILDLINK_TREE+=	go-speed

.if !defined(GO_SPEED_BUILDLINK3_MK)
GO_SPEED_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-speed=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-speed?=		build

BUILDLINK_API_DEPENDS.go-speed+=	go-speed>=20190404
BUILDLINK_PKGSRCDIR.go-speed?=		../../wip/go-speed
.endif	# GO_SPEED_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-speed
