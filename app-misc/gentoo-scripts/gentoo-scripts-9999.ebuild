# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Personal Gentoo scripts to automate certain things"
HOMEPAGE="https://github.com/gcarq/gentoo-scripts"
EGIT_REPO_URI="https://github.com/gcarq/${PN}.git"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	sys-boot/grub
	sys-devel/make
	sys-kernel/dracut"

DOCS=( README.md LICENSE.md )

src_install() {
	newbin update-kernel.sh update-kernel
}