# $NetBSD$

BUILDLINK_TREE+=	go-sdp

.if !defined(GO_SDP_BUILDLINK3_MK)
GO_SDP_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-sdp=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-sdp?=		build

BUILDLINK_API_DEPENDS.go-sdp+=	go-sdp>=2.4.0
BUILDLINK_PKGSRCDIR.go-sdp?=	../../wip/go-sdp

.include "../../wip/go-randutil/buildlink3.mk"
.endif	# GO_SDP_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-sdp
