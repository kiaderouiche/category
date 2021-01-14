# $NetBSD$

BUILDLINK_TREE+=	go-snappy

.if !defined(GO_SNAPPY_BUILDLINK3_MK)
GO_SNAPPY_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-snappy=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-snappy?=		build

BUILDLINK_API_DEPENDS.go-snappy+=	go-snappy>=0.0.2
BUILDLINK_PKGSRCDIR.go-snappy?=		../../wip/go-snappy
.endif	# GO_SNAPPY_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-snappy
