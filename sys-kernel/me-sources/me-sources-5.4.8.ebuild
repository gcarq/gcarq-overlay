# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
ETYPE="sources"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="9"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
HOMEPAGE="https://github.com/gcarq/gcarq-overlay"
IUSE="experimental"

K_BRANCH_ID="${KV_MAJOR}.${KV_MINOR}"

DESCRIPTION="Gentoo's genpatches for Linux ${K_BRANCH_ID}, including various other patches."

SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"

UNIPATCH_LIST="
    ${FILESDIR}/0000-futex-wait-multiple-5.2.1.patch
    ${FILESDIR}/0001-MultiQueue-Skiplist-Scheduler-v0.196.patch
    ${FILESDIR}/0005-ksm-wakeups.patch
    ${FILESDIR}/0008-smpboot-reuse-timer-calibration.patch
    ${FILESDIR}/0012-ipv4-tcp-allow-the-memory-tuning-for-tcp-to-go-a-lit.patch
    ${FILESDIR}/0013-kernel-time-reduce-ntp-wakeups.patch
"
UNIPATCH_STRICTORDER="yes"

pkg_postrm() {
	kernel-2_pkg_postrm
}
