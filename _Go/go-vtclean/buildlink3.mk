# $NetBSD$

BUILDLINK_TREE+=	go-vtclean

.if !defined(GO_VTCLEAN_BUILDLINK3_MK)
GO_VTCLEAN_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-vtclean=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-vtclean?=		build

BUILDLINK_API_DEPENDS.go-vtclean+=	go-vtclean>=20201209
BUILDLINK_PKGSRCDIR.go-vtclean?=	../../wip/go-vtclean
.endif	# GO_VTCLEAN_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-vtclean
