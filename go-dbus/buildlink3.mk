# $NetBSD$

BUILDLINK_TREE+=	go-dbus

.if !defined(GO_DBUS_BUILDLINK3_MK)
GO_DBUS_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-dbus=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-dbus?=		build

BUILDLINK_API_DEPENDS.go-dbus+=	go-dbus>=5.0.3
BUILDLINK_PKGSRCDIR.go-dbus?=	../../wip/go-dbus
.endif	# GO_DBUS_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-dbus
