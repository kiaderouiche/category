# $NetBSD$

BUILDLINK_TREE+=	go-ledisdb

.if !defined(GO_LEDISDB_BUILDLINK3_MK)
GO_LEDISDB_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-ledisdb=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-ledisdb?=		build

BUILDLINK_API_DEPENDS.go-ledisdb+=	go-ledisdb>=20200510
BUILDLINK_PKGSRCDIR.go-ledisdb?=	../../wip/go-ledisdb
.endif	# GO_LEDISDB_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-ledisdb
