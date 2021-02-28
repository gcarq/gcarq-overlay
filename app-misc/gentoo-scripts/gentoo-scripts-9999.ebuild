# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Personal Gentoo scripts to automate certain things"
HOMEPAGE="https://github.com/gcarq/gentoo-scripts"
EGIT_REPO_URI="https://github.com/gcarq/${PN}.git"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~s390 ~sparc ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	app-portage/portage-utils
	app-portage/portpeek
	sys-boot/grub
	sys-devel/make
	sys-kernel/dracut"

DOCS=( README.md LICENSE.md )

src_install() {
	newbin build-kernel.sh build-kernel
	newbin resolve-rdeps.sh resolve-rdeps
	newbin update-system.sh update-system
}