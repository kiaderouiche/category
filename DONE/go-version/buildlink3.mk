# $NetBSD$

BUILDLINK_TREE+=	go-version

.if !defined(GO_VERSION_BUILDLINK3_MK)
GO_VERSION_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-version=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-version?=	build

BUILDLINK_API_DEPENDS.go-version+=	go-version>=1.2.1
BUILDLINK_PKGSRCDIR.go-version?=	../../wip/go-version
.endif	# GO_VERSION_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-version
