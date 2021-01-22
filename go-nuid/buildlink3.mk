# $NetBSD$

BUILDLINK_TREE+=	go-nuid

.if !defined(GO_NUID_BUILDLINK3_MK)
GO_NUID_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-nuid=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-nuid?=		build

BUILDLINK_API_DEPENDS.go-nuid+=	go-nuid>=1.0.1
BUILDLINK_PKGSRCDIR.go-nuid?=	../../wip/go-nui
.endif	# GO_NUID_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-nuid
