# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="16"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
HOMEPAGE="
	https://github.com/gcarq/gcarq-overlay
	https://github.com/sirlucjan/kernel-patches
	http://ck.kolivas.org/patches
"
IUSE="experimental"

K_BRANCH_ID="${KV_MAJOR}.${KV_MINOR}"

DESCRIPTION="Gentoo's genpatches for Linux ${K_BRANCH_ID}, including various other patches."

SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"

UNIPATCH_LIST="
	"${FILESDIR}/ck-patches/*.patch"
	"${FILESDIR}/clearlinux-patches/*.patch"
	"${FILESDIR}/cpu-patches/*.patch"
	"${FILESDIR}/fsgsbase-patches/*.patch"
	"${FILESDIR}/futex-patches/*.patch"
"
UNIPATCH_STRICTORDER="yes"

pkg_postrm() {
	kernel-2_pkg_postrm
}
