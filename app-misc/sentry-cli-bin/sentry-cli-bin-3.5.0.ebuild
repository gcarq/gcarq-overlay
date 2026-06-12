# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A command line utility to work with Sentry"
HOMEPAGE="https://github.com/getsentry/sentry-cli"

SRC_URI="
	amd64? ( https://github.com/getsentry/sentry-cli/releases/download/${PV}/sentry-cli-linux-x64-${PV}.tgz )
	arm64? ( https://github.com/getsentry/sentry-cli/releases/download/${PV}/sentry-cli-linux-arm64-${PV}.tgz )
"
S="${WORKDIR}/package"

LICENSE="FSL-1.1-MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

RESTRICT="strip test"

RDEPEND="sys-libs/glibc"

src_install() {
	exeinto /usr/bin
	newexe ./bin/sentry-cli sentry-cli
}
