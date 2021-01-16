# $NetBSD$

BUILDLINK_TREE+=	go-datadog-go

.if !defined(GO_DATADOG_GO_BUILDLINK3_MK)
GO_DATADOG_GO_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-datadog-go=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-datadog-go?=		build

BUILDLINK_API_DEPENDS.go-datadog-go+=	go-datadog-go>=20210107
BUILDLINK_PKGSRCDIR.go-datadog-go?=	../../wip/go-datadog-go
.endif	# GO_DATADOG_GO_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-datadog-go
