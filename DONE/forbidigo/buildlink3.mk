# $NetBSD$

BUILDLINK_TREE+=	forbidigo

.if !defined(FORBIDIGO_BUILDLINK3_MK)
FORBIDIGO_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.forbidigo=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.forbidigo?=		build

BUILDLINK_API_DEPENDS.forbidigo+=	forbidigo>=20210103
BUILDLINK_PKGSRCDIR.forbidigo?=		../../category/forbidigo

.include "../../devel/go-mod/buildlink3.mk"
.include "../../devel/go-tools/buildlink3.mk"
.endif	# FORBIDIGO_BUILDLINK3_MK

BUILDLINK_TREE+=	-forbidigo
