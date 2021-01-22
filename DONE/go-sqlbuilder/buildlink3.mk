# $NetBSD$

BUILDLINK_TREE+=	go-sqlbuilder

.if !defined(GO_SQLBUILDER_BUILDLINK3_MK)
GO_SQLBUILDER_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-sqlbuilder=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-sqlbuilder?=		build

BUILDLINK_API_DEPENDS.go-sqlbuilder+=	go-sqlbuilder>=1.10.0
BUILDLINK_PKGSRCDIR.go-sqlbuilder?=	../../wip/go-sqlbuilder
.endif	# GO_SQLBUILDER_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-sqlbuilder
