# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=( {22..23} )
RUST_MIN_VER="1.98.1"
RUST_NEEDS_LLVM=1

inherit cargo git-r3 check-reqs desktop flag-o-matic toolchain-funcs xdg llvm-r2

DESCRIPTION="The fast, collaborative code editor"
HOMEPAGE="https://zed.dev https://github.com/zed-industries/zed"
EGIT_REPO_URI="https://github.com/zed-industries/zed.git"
EGIT_COMMIT="v$(ver_cut 1-3)-pre"

WEBRTC_COMMIT="0001d84-4"
SRC_URI="
	amd64? (
		https://github.com/zed-industries/livekit-rust-sdks/releases/download/webrtc-${WEBRTC_COMMIT}/webrtc-linux-x64-release.zip
			-> webrtc-${WEBRTC_COMMIT}-linux-x64-release.zip
	)
	arm64? (
		https://github.com/zed-industries/livekit-rust-sdks/releases/download/webrtc-${WEBRTC_COMMIT}/webrtc-linux-arm64-release.zip
			-> webrtc-${WEBRTC_COMMIT}-linux-arm64-release.zip
	)
"

LICENSE="GPL-3+ BSD"
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD CC0-1.0 ISC
	LGPL-3 MIT MIT-0 MPL-2.0 UoI-NCSA Unicode-3.0 ZLIB BZIP2 Boost-1.0
	CDLA-Permissive-2.0
"
SLOT="0"
CHECKREQS_DISK_BUILD="20G"
CHECKREQS_MEMORY="8G"

DEPEND="
	dev-libs/glib:2
	dev-libs/wayland
	|| (
		media-fonts/dejavu
		media-fonts/cantarell
		media-fonts/noto
		media-fonts/ubuntu-font-family
	)
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libpulse
	media-libs/vulkan-loader[X]
	media-video/pipewire
	sys-apps/xdg-desktop-portal
	virtual/zlib:=
	x11-libs/libX11
	x11-libs/libxcb:=
	x11-libs/libxkbcommon[X]
"
RDEPEND="${DEPEND}"
BDEPEND="
	app-arch/unzip
	dev-build/cmake
	dev-libs/wayland-protocols
	dev-util/wayland-scanner
	dev-util/vulkan-headers
	dev-util/pkgconf
	sys-devel/gettext
	$(llvm_gen_dep '
		llvm-core/clang:${LLVM_SLOT}=
		llvm-core/llvm:${LLVM_SLOT}=
		arm64? ( llvm-core/lld:${LLVM_SLOT}= )
	')
"

QA_FLAGS_IGNORED="usr/bin/zedit"

APP_CLI="zedit"
APP_ICON="zed"
APP_ID="dev.zed.Zed-Preview"

pkg_setup() {
	check-reqs_pkg_setup

	if tc-is-lto; then
		if tc-is-gcc; then
			export CARGO_PROFILE_RELEASE_LTO="true"
		elif tc-is-clang; then
			export CARGO_PROFILE_RELEASE_LTO="thin"
		fi
	else
		export CARGO_PROFILE_RELEASE_LTO="false"
	fi

	strip-unsupported-flags
	export RUSTFLAGS="${RUSTFLAGS} -C symbol-mangling-version=v0 --cfg tokio_unstable -C link-args=-Wl,--disable-new-dtags,-rpath,\$ORIGIN/../lib"
	llvm-r2_pkg_setup
	rust_pkg_setup
}

src_unpack() {
	default
	git-r3_src_unpack

	cd "${S}" || die
	[[ -f Cargo.toml ]] || die "Missing Cargo.toml in ${S}"
	cargo_live_src_unpack
}

src_prepare() {
	default

	export APP_CLI APP_ICON APP_ID
	export APP_NAME="Zed"
	export APP_ARGS="%U"
	export DO_STARTUP_NOTIFY="true"
	envsubst < crates/zed/resources/zed.desktop.in > "${APP_ID}.desktop" || die
}

src_configure() {
	# Upstream uses the actual Zed crate version, not the Gentoo live suffix.
	export RELEASE_VERSION="$(ver_cut 1-3)"
	export ZED_UPDATE_EXPLANATION="Updates are handled by Portage"

	if use arm64; then
		export LK_CUSTOM_WEBRTC="${WORKDIR}/linux-arm64-release"
	elif use amd64; then
		export LK_CUSTOM_WEBRTC="${WORKDIR}/linux-x64-release"
	fi

	cargo_src_configure --frozen
}

src_compile() {
	cargo_src_compile --package zed --package cli
}

src_install() {
	newbin "$(cargo_target_dir)/cli" "${APP_CLI}"
	exeinto /usr/libexec
	newexe "$(cargo_target_dir)/zed" zed-editor

	newicon -s 512 crates/zed/resources/app-icon.png zed.png
	newicon -s 1024 crates/zed/resources/app-icon@2x.png zed.png
	domenu "${APP_ID}.desktop"
}

src_test() {
	mkdir -p "${HOME}/.config/zed" "${HOME}/.local/share/zed/logs" || die
	local CARGO_SKIP_TESTS=( zed::tests::test_window_edit_state_restoring_enabled )

	SHELL=/usr/bin/sh RUST_BACKTRACE=full cargo_src_test -vv \
		--package zed --package cli
}
