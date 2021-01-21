# $NetBSD$

BUILDLINK_TREE+=	go-sockaddr

.if !defined(GO_SOCKADDR_BUILDLINK3_MK)
GO_SOCKADDR_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-sockaddr=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-sockaddr?=		build

BUILDLINK_API_DEPENDS.go-sockaddr+=	go-sockaddr>=1.0.2
BUILDLINK_PKGSRCDIR.go-sockaddr?=	../../wip/go-sockaddr


.include "../../wip/go-errwrap/buildlink3.mk"
.endif	# GO_SOCKADDR_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-sockaddr
