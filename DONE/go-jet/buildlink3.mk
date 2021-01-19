# $NetBSD$

BUILDLINK_TREE+=	go-jet

.if !defined(GO_JET_BUILDLINK3_MK)
GO_JET_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-jet=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-jet?=		build

BUILDLINK_API_DEPENDS.go-jet+=	go-jet>=6.0.2
BUILDLINK_PKGSRCDIR.go-jet?=	../../wip/go-jet


.include "../../wip/go-fastprinter/buildlink3.mk"
.endif	# GO_JET_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-jet
