# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="9"

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
	"${FILESDIR}/0001-5.5-ck1.patch"
	"${FILESDIR}/clearlinux-patches/0005-ksm-wakeups.patch"
	"${FILESDIR}/clearlinux-patches/0008-smpboot-reuse-timer-calibration.patch"
	"${FILESDIR}/clearlinux-patches/0012-ipv4-tcp-allow-the-memory-tuning-for-tcp-to-go-a-lit.patch"
	"${FILESDIR}/clearlinux-patches/0013-kernel-time-reduce-ntp-wakeups.patch"
	"${FILESDIR}/clearlinux-patches/0020-use-lfence-instead-of-rep-and-nop.patch"
	"${FILESDIR}/clearlinux-patches/0021-do-accept-in-LIFO-order-for-cache-efficiency.patch"
	"${FILESDIR}/clearlinux-patches/0022-locking-rwsem-spin-faster.patch"
	"${FILESDIR}/cpu-patches/0002-init-Kconfig-enable-O3-for-all-arches.patch"
	"${FILESDIR}/futex-patches/0001-compat-provide-compat_ptr-on-all-architectures.patch"
	"${FILESDIR}/futex-patches/0002-futex-Implement-mechanism-to-wait-on-any-of-several-.patch"
	"${FILESDIR}/futex-patches/0006-futex-Add-Proton-compatibility-code.patch"
"
UNIPATCH_STRICTORDER="yes"

pkg_postrm() {
	kernel-2_pkg_postrm
}
