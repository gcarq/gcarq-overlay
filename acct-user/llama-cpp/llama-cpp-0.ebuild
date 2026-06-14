# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

ACCT_USER_ID=-1
ACCT_USER_HOME=/var/cache/llama.cpp
ACCT_USER_GROUPS=( llama-cpp )

IUSE="+rocm"

acct-user_add_deps

RDEPEND+="
	rocm? (
		acct-group/video
	)
"

pkg_setup() {
	if use rocm; then
		ACCT_USER_GROUPS+=( video )
	fi
}
