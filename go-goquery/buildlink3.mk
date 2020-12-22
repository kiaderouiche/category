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
# XXX   BUILDLINK_DEPMETHOD.go-goquery?=        build

BUILDLINK_TREE+=        go-goquery

.if !defined(GO_GOQUERY_BUILDLINK3_MK)
GO_GOQUERY_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-goquery=   ${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-goquery?=                build

BUILDLINK_API_DEPENDS.go-goquery+=      go-goquery>=1.6.0
BUILDLINK_PKGSRCDIR.go-goquery?=        ../../category/go-goquery
.endif  # GO_GOQUERY_BUILDLINK3_MK

BUILDLINK_TREE+=        -go-goquery
