
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
# XXX   BUILDLINK_DEPMETHOD.go-resty?=  build

BUILDLINK_TREE+=        go-resty

.if !defined(GO_RESTY_BUILDLINK3_MK)
GO_RESTY_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-resty=     ${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-resty?=          build

BUILDLINK_API_DEPENDS.go-resty+=        go-resty>=2.3.0
BUILDLINK_PKGSRCDIR.go-resty?=  ../../category/go-resty

# XXX
# XXX Uncomment and keep only the buildlink3 lines below which are directly
# XXX needed for dependencies to compile, link, and run.  If this package
# XXX provides a wrappered API or otherwise does not expose the APIs of the
# XXX buildlink3 lines below to dependencies, remove them.
# XXX
#.include "../../net/go-net/buildlink3.mk"
.endif  # GO_RESTY_BUILDLINK3_MK

BUILDLINK_TREE+=        -go-resty
