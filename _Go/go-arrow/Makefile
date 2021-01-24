# $NetBSD$

DISTNAME=	arrow-3.0.0
PKGNAME=	go-${DISTNAME}
GITHUB_PROJECT=	arrow
GITHUB_TAG=	d613aa68789288d3503dfbd8376a41f2d28b6c9d
DISTNAME=	apache-arrow-3.0.0
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=apache/}

MAINTAINER=	kamelderouiche@yahoo.com
HOMEPAGE=	https://github.com/apache/arrow/
COMMENT=	TODO: Short description of the package
LICENSE=	apache-2.0

GO_DIST_BASE=	${GITHUB_PROJECT}-${GITHUB_TAG}
GO_SRCPATH=	github.com/apache/${GITHUB_PROJECT}

USE_TOOLS+=	pkg-config
USE_LANGUAGES=	c c++

PKGCONFIG_OVERRIDE+=	c_glib/arrow-cuda-glib/arrow-cuda-glib.pc.in
PKGCONFIG_OVERRIDE+=	c_glib/arrow-dataset-glib/arrow-dataset-glib.pc.in
PKGCONFIG_OVERRIDE+=	c_glib/arrow-glib/arrow-glib.pc.in
PKGCONFIG_OVERRIDE+=	c_glib/arrow-glib/arrow-orc-glib.pc.in
PKGCONFIG_OVERRIDE+=	c_glib/gandiva-glib/gandiva-glib.pc.in
PKGCONFIG_OVERRIDE+=	c_glib/parquet-glib/parquet-glib.pc.in
PKGCONFIG_OVERRIDE+=	c_glib/plasma-glib/plasma-glib.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/adapters/orc/arrow-orc.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/adapters/tensorflow/arrow-tensorflow.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/arrow-testing.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/arrow.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/compute/arrow-compute.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/csv/arrow-csv.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/dataset/arrow-dataset.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/filesystem/arrow-filesystem.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/flight/arrow-flight-testing.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/flight/arrow-flight.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/gpu/arrow-cuda.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/json/arrow-json.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/python/arrow-python-flight.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/arrow/python/arrow-python.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/gandiva/gandiva.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/parquet/parquet.pc.in
PKGCONFIG_OVERRIDE+=	cpp/src/plasma/plasma.pc.in

.include "../../lang/go/go-package.mk"
.include "../../mk/bsd.pkg.mk"
