# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Collection of XDG Base Directory workarounds"
HOMEPAGE="https://github.com/gcarq/gcarq-overlay"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}"

src_install() {
	insinto /etc/profile.d
	doins "${FILESDIR}/xdg-workarounds.sh"
}
