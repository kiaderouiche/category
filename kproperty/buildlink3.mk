# $NetBSD$
# XXX
# XXX This file was created automatically using createbuildlink-3.18.
# XXX After this file has been verified as correct, the comment lines
# XXX beginning with "XXX" should be removed.  Please do not commit
# XXX unverified buildlink3.mk files.
# XXX
# XXX Packages that only install static libraries or headers should
# XXX include the following line:
# XXX
# XXX	BUILDLINK_DEPMETHOD.kproperty?=	build

BUILDLINK_TREE+=	kproperty

.if !defined(KPROPERTY_BUILDLINK3_MK)
KPROPERTY_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.kproperty+=	kproperty>=3.2.0
BUILDLINK_PKGSRCDIR.kproperty?=	../../category/kproperty

# XXX
# XXX Uncomment and keep only the buildlink3 lines below which are directly
# XXX needed for dependencies to compile, link, and run.  If this package
# XXX provides a wrappered API or otherwise does not expose the APIs of the
# XXX buildlink3 lines below to dependencies, remove them.
# XXX
#.include "../../devel/kconfig/buildlink3.mk"
#.include "../../x11/kguiaddons/buildlink3.mk"
#.include "../../x11/kwidgetsaddons/buildlink3.mk"
#.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# KPROPERTY_BUILDLINK3_MK

BUILDLINK_TREE+=	-kproperty
