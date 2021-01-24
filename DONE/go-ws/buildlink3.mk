# $NetBSD$

BUILDLINK_TREE+=	go-ws

.if !defined(GO_WS_BUILDLINK3_MK)
GO_WS_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-ws=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-ws?=		build

BUILDLINK_API_DEPENDS.go-ws+=	go-ws>=20201209
BUILDLINK_PKGSRCDIR.go-ws?=	../../wip/go-ws

.include "../../wip/go-httphead/buildlink3.mk"
.include "../../wip/go-pool/buildlink3.mk"
.endif	# GO_WS_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-ws
