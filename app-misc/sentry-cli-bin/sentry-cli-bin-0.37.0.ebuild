# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A command line utility to work with Sentry"
HOMEPAGE="https://github.com/getsentry/cli https://cli.sentry.dev/"

SRC_URI="
	amd64? ( https://github.com/getsentry/cli/releases/download/${PV}/sentry-linux-x64.gz )
	arm64? ( https://github.com/getsentry/cli/releases/download/${PV}/sentry-linux-arm64.gz )
"
S="${WORKDIR}"

LICENSE="FSL-1.1-Apache-2.0"
SLOT="0"
KEYWORDS="-* ~amd64 ~arm64"

RESTRICT="strip test"

RDEPEND="sys-libs/glibc"

src_install() {
	exeinto /usr/bin
	if use arm64; then
		newexe ./sentry-linux-arm64 sentry
	elif use amd64; then
		newexe ./sentry-linux-x64 sentry
	fi
}
