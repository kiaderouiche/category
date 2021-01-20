# $NetBSD$

BUILDLINK_TREE+=	go-csrf

.if !defined(GO_CSRF_BUILDLINK3_MK)
GO_CSRF_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-csrf=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-csrf?=		build

BUILDLINK_API_DEPENDS.go-csrf+=	go-csrf>=1.7.0nb1
BUILDLINK_PKGSRCDIR.go-csrf?=	../../category/go-csrf

.include "../../devel/go-errors/buildlink3.mk"
.include "../../wip/go-gorilla-securecookie/buildlink3.mk"
.endif	# GO_CSRF_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-csrf
