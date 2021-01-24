# $NetBSD$

BUILDLINK_TREE+=	go-interceptor

.if !defined(GO_INTERCEPTOR_BUILDLINK3_MK)
GO_INTERCEPTOR_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-interceptor=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-interceptor?=		build

BUILDLINK_API_DEPENDS.go-interceptor+=	go-interceptor>=0.0.9
BUILDLINK_PKGSRCDIR.go-interceptor?=	../../wip/go-interceptor


.include "../../wip/go-logging/buildlink3.mk"
.include "../../wip/go-rtp/buildlink3.mk"
.include "../../wip/go-rtcp/buildlink3.mk"
.endif	# GO_INTERCEPTOR_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-interceptor
