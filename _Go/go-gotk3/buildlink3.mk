# $NetBSD$

BUILDLINK_TREE+=	go-gotk3

.if !defined(GO_GOTK3_BUILDLINK3_MK)
GO_GOTK3_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-gotk3=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-gotk3?=		build

BUILDLINK_API_DEPENDS.go-gotk3+=	go-gotk3>=0.5.2
BUILDLINK_PKGSRCDIR.go-gotk3?=		../../wip/go-gotk3

.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/gdk-pixbuf2/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.endif	# GO_GOTK3_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-gotk3
