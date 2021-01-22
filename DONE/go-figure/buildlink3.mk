# $NetBSD$

BUILDLINK_TREE+=	go-figure

.if !defined(GO_FIGURE_BUILDLINK3_MK)
GO_FIGURE_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-figure=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-figure?=		build

BUILDLINK_API_DEPENDS.go-figure+=	go-figure>=20200609
BUILDLINK_PKGSRCDIR.go-figure?=		../../wip/go-figure
.endif	# GO_FIGURE_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-figure
