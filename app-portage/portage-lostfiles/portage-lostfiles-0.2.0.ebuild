# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

DESCRIPTION="A simple script to identify files not tracked by Portage package manager"
HOMEPAGE="https://github.com/gcarq/portage-lostfiles"
SRC_URI="https://github.com/gcarq/portage-lostfiles/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
