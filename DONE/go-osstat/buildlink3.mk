# $NetBSD$

BUILDLINK_TREE+=	go-osstat

.if !defined(GO_OSSTAT_BUILDLINK3_MK)
GO_OSSTAT_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-osstat=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-osstat?=		build

BUILDLINK_API_DEPENDS.go-osstat+=	go-osstat>=20210118
BUILDLINK_PKGSRCDIR.go-osstat?=		../../wip/go-osstat


.include "../../devel/go-sys/buildlink3.mk"
.endif	# GO_OSSTAT_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-osstat
