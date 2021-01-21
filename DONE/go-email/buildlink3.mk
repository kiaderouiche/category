# $NetBSD$

BUILDLINK_TREE+=	go-email

.if !defined(GO_EMAIL_BUILDLINK3_MK)
GO_EMAIL_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-email=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-email?=		build

BUILDLINK_API_DEPENDS.go-email+=	go-email>=4.0.0
BUILDLINK_PKGSRCDIR.go-email?=		../../wip/go-email
.endif	# GO_EMAIL_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-email
