# $NetBSD$

BUILDLINK_TREE+=	go-nkeys

.if !defined(GO_NKEYS_BUILDLINK3_MK)
GO_NKEYS_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-nkeys=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-nkeys?=		build

BUILDLINK_API_DEPENDS.go-nkeys+=	go-nkeys>=0.2.0
BUILDLINK_PKGSRCDIR.go-nkeys?=		../../wip/go-nkeys

.include "../../security/go-crypto/buildlink3.mk"
.endif	# GO_NKEYS_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-nkeys
