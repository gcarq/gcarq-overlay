# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Collection of XDG Base Directory workarounds"
HOMEPAGE="https://github.com/gcarq/gcarq-overlay"
KEYWORDS="~amd64 ~x86"

SRC_URI=""

LICENSE="GPL-3"
SLOT="0"

pkg_preinst() {
	insinto /etc/profile.d
	doins "${FILESDIR}/xdg-workarounds.sh"
}
