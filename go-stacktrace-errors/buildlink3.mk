# $NetBSD$

BUILDLINK_TREE+=	go-stacktrace-errors

.if !defined(GO_STACKTRACE_ERRORS_BUILDLINK3_MK)
GO_STACKTRACE_ERRORS_BUILDLINK3_MK:=

BUILDLINK_CONTENTS_FILTER.go-stacktrace-errors=	${EGREP} gopkg/
BUILDLINK_DEPMETHOD.go-stacktrace-errors?=	build

BUILDLINK_API_DEPENDS.go-stacktrace-errors+=	go-stacktrace-errors>=1.1.1
BUILDLINK_PKGSRCDIR.go-stacktrace-errors?=	../../wip/go-stacktrace-errors
.endif	# GO_STACKTRACE_ERRORS_BUILDLINK3_MK

BUILDLINK_TREE+=	-go-stacktrace-errors
