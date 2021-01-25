# $NetBSD$

BUILDLINK_TREE+=	go-zookeeper

.if !defined(GO_ZOOKEEPER_BUILDLINK3_MK)
GO_ZOOKEEPER_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-zookeeper=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-zookeeper?=	build

BUILDLINK_API_DEPENDS.go-zookeeper+=	go-zookeeper>=20201211
BUILDLINK_PKGSRCDIR.go-zookeeper?=	../../wip/go-zookeeper
.endif	# GO_ZOOKEEPER_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-zookeeper
