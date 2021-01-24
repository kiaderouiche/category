# $NetBSD$

BUILDLINK_TREE+=	go-mdns

.if !defined(GO_MDNS_BUILDLINK3_MK)
GO_MDNS_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-mdns=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-mdns?=		build

BUILDLINK_API_DEPENDS.go-mdns+=	go-mdns>=20210118
BUILDLINK_PKGSRCDIR.go-mdns?=	../../wip/go-mdns

.include "../../net/go-net/buildlink3.mk"
.include "../../wip/go-logging/buildlink3.mk"
.endif	# GO_MDNS_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-mdns
