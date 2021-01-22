# $NetBSD$

BUILDLINK_TREE+=	go-tebata

.if !defined(GO_TEBATA_BUILDLINK3_MK)
GO_TEBATA_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-tebata=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-tebata?=		build

BUILDLINK_API_DEPENDS.go-tebata+=	go-tebata>=20180602
BUILDLINK_PKGSRCDIR.go-tebata?=	../../wip/go-tebata
.endif	# GO_TEBATA_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-tebata
