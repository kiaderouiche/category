# $NetBSD$

BUILDLINK_TREE+=	go-casbin

.if !defined(GO_CASBIN_BUILDLINK3_MK)
GO_CASBIN_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-casbin=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-casbin?=		build

BUILDLINK_API_DEPENDS.go-casbin+=	go-casbin>=2.21.0
BUILDLINK_PKGSRCDIR.go-casbin?=		../../category/go-casbin

.include "../../wip/go-govaluate/buildlink3.mk"
.include "../../wip/go-mock/buildlink3.mk"
.endif	# GO_CASBIN_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-casbin
