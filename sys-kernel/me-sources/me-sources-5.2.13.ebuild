# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="13"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
HOMEPAGE="https://dev.gentoo.org/~mpagano/genpatches/
	http://kernel.kolivas.org/"
IUSE="experimental"

K_BRANCH_ID="${KV_MAJOR}.${KV_MINOR}"

DESCRIPTION="Gentoo's genpatches for Linux ${K_BRANCH_ID}, including various other patches."

# MuQSS patchset
MUQSS_VERSION="193"
MUQSS_FILE="0001-MultiQueue-Skiplist-Scheduler-version-0.${MUQSS_VERSION}.patch"
MUQSS_BASE_URL="http://ck.kolivas.org/patches/muqss/${KV_MAJOR}.0"
MUQSS_DISTNAME="${PN}-${K_BRANCH_ID}-muqss.patch"
MUQSS_URI="${MUQSS_BASE_URL}/${K_BRANCH_ID}/${MUQSS_FILE} -> ${MUQSS_DISTNAME}"

# -O3 zen-kernel patch
O3_ZEN_DISTNAME="${PN}-${K_BRANCH_ID}-o3-zen.patch"

SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${MUQSS_URI}"

UNIPATCH_LIST="${DISTDIR}/${MUQSS_DISTNAME} ${FILESDIR}/${O3_ZEN_DISTNAME}"
UNIPATCH_STRICTORDER="yes"

pkg_postrm() {
	kernel-2_pkg_postrm
}
