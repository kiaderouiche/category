# $NetBSD$

BUILDLINK_TREE+=	go-dst

.if !defined(GO_DST_BUILDLINK3_MK)
GO_DST_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-dst=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-dst?=		build

BUILDLINK_API_DEPENDS.go-dst+=	go-dst>=0.26.2
BUILDLINK_PKGSRCDIR.go-dst?=	../../category/go-dst


.include "../../devel/go-mod/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.include "../../wip/go-jennifer/buildlink3.mk"
.endif	# GO_DST_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-dst
