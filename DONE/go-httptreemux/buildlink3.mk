# $NetBSD$

BUILDLINK_TREE+=	go-httptreemux

.if !defined(GO_HTTPTREEMUX_BUILDLINK3_MK)
GO_HTTPTREEMUX_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-httptreemux=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-httptreemux?=		build

BUILDLINK_API_DEPENDS.go-httptreemux+=	go-httptreemux>=5.2.2
BUILDLINK_PKGSRCDIR.go-httptreemux?=	../../wip/go-httptreemux
.endif	# GO_HTTPTREEMUX_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-httptreemux
