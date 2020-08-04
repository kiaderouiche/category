# $NetBSD$

DISTNAME=	qtwebengine-everywhere-src-5.15.0
CATEGORIES=	www
MASTER_SITES=	https://download.qt.io/archive/qt/5.15/5.15.0/submodules/
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	INSERT_YOUR_MAIL_ADDRESS_HERE # or use pkgsrc-users@NetBSD.org
HOMEPAGE=	https://download.qt.io/archive/qt/5.15/5.15.0/submodules/
COMMENT=	TODO: Short description of the package
#LICENSE=	# TODO: (see mk/license.mk)

USE_TOOLS+=		pkg-config
USE_PKGLOCALEDIR=	yes
USE_LANGUAGES=		c c++

PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/SPIRV-Tools/src/cmake/SPIRV-Tools-shared.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/SPIRV-Tools/src/cmake/SPIRV-Tools.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/angle/third_party/rapidjson/src/RapidJSON.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/angle/third_party/vulkan-loader/src/loader/vulkan.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/boringssl/src/third_party/googletest/cmake/gtest.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/boringssl/src/third_party/googletest/cmake/gtest_main.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/breakpad/breakpad/breakpad-client.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/breakpad/breakpad/breakpad.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/expat/src/expat/expat.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/fontconfig/src/fontconfig.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/glfw/src/src/glfw3.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/googletest/src/googlemock/cmake/gmock.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/googletest/src/googlemock/cmake/gmock_main.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/googletest/src/googletest/cmake/gtest.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/googletest/src/googletest/cmake/gtest_main.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/harfbuzz-gobject.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/harfbuzz-icu.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/harfbuzz-subset.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/harfbuzz-ng/src/src/harfbuzz.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/icu/source/config/icu.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/jsoncpp/source/pkg-config/jsoncpp.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/amdgpu/libdrm_amdgpu.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/etnaviv/libdrm_etnaviv.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/exynos/libdrm_exynos.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/freedreno/libdrm_freedreno.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/intel/libdrm_intel.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/libdrm.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/libkms/libkms.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/nouveau/libdrm_nouveau.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/omap/libdrm_omap.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/radeon/libdrm_radeon.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/tegra/libdrm_tegra.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libdrm/src/vc4/libdrm_vc4.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libprotobuf-mutator/src/libprotobuf-mutator.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libxml/src/libxml-2.0.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libxslt/src/libexslt.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/libxslt/src/libxslt.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/openh264/src/openh264.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/opus/src/opus.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/protobuf/protobuf-lite.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/protobuf/protobuf.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/shaderc/src/cmake/shaderc.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/shaderc/src/cmake/shaderc_combined.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/shaderc/src/cmake/shaderc_static.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/spirv-cross/spirv-cross/pkg-config/spirv-cross-c-shared.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/sqlite/patched/sqlite.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/sqlite/patched/sqlite3.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/usrsctp/usrsctplib/usrsctp.pc.in
PKGCONFIG_OVERRIDE+=	src/3rdparty/chromium/third_party/wds/src/data/wds.pc.in

.include "../../mk/bsd.pkg.mk"
