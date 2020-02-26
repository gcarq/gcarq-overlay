# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="chkboot is a tool to help detect changes to an unencrypted /boot partition"
HOMEPAGE="https://github.com/grazzolini/chkboot"
SRC_URI="https://github.com/grazzolini/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="test"

DEPEND="app-shells/bash
	sys-apps/util-linux"

src_install() {
	dobin chkboot
	dobin chkboot-check
	dobin notification/chkboot-desktopalert

	exeinto /etc/profile.d
	doexe notification/chkboot-profilealert.sh

	insinto /etc/default
	doins chkboot.conf

	exeinto /usr/lib/systemd/scripts
	doexe chkboot-bootcheck

	systemd_dounit chkboot.service
}
