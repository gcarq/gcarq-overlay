# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Papirus icon theme for Linux"
HOMEPAGE="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme"
SRC_URI="https://github.com/PapirusDevelopmentTeam/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk qt5"

RESTRICT="binchecks strip"

DEPEND="
	gtk? ( dev-util/gtk-update-icon-cache )
	qt5? ( dev-qt/qtsvg )
"
RDEPEND="${DEPEND}"
