# $NetBSD$

BUILDLINK_TREE+=	go-tunnel

.if !defined(GO_TUNNEL_BUILDLINK3_MK)
GO_TUNNEL_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-tunnel=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-tunnel?=		build

BUILDLINK_API_DEPENDS.go-tunnel+=	go-tunnel>=0.0.2
BUILDLINK_PKGSRCDIR.go-tunnel?=		../../wip/go-tunnel
.endif	# GO_TUNNEL_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-tunnel
