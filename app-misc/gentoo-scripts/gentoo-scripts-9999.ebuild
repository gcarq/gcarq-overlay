# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Personal Gentoo scripts to automate certain things"
HOMEPAGE="https://github.com/gcarq/gentoo-scripts"
EGIT_REPO_URI="https://github.com/gcarq/${PN}.git"
LICENSE="GPL-3"

SLOT="0"

RDEPEND="
	app-portage/portage-utils
	sys-kernel/installkernel"

DOCS=( README.md LICENSE.md )

src_install() {
	newbin build-kernel.sh build-kernel
	newbin resolve-rdeps.sh resolve-rdeps
	newbin update-system.sh update-system
}
