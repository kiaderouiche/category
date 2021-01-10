# $NetBSD$

BUILDLINK_TREE+=	go-pongo2

.if !defined(GO_PONGO2_BUILDLINK3_MK)
GO_PONGO2_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-pongo2=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-pongo2?=		build

BUILDLINK_API_DEPENDS.go-pongo2+=	go-pongo2>=0.0.1
BUILDLINK_PKGSRCDIR.go-pongo2?=	../../category/go-pongo2
.endif	# GO_PONGO2_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-pongo2
