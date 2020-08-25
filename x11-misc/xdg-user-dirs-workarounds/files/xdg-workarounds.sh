# Custom script to set XDG directories
# See https://wiki.archlinux.org/index.php/XDG_Base_Directory

# Base XDG directories
[ -z "${XDG_CONFIG_HOME}" ] && export XDG_CONFIG_HOME="${HOME}/.config"
[ -z "${XDG_CACHE_HOME}" ] && export XDG_CACHE_HOME="${HOME}/.cache"
[ -z "${XDG_DATA_HOME}" ] && export XDG_DATA_HOME="${HOME}/.local/share"

# Program specific overrides
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME}/android"
export ADB_VENDOR_KEY="${XDG_CONFIG_HOME}/android"
export ATOM_HOME="${XDG_DATA_HOME}/atom"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export DVDCSS_CACHE="${XDG_DATA_HOME}/dvdcss"
export DOCKER_CONFIG="{$XDG_CONFIG_HOME}/docker"
export ELECTRUMDIR="${XDG_DATA_HOME}/electrum"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export GEM_HOME="${XDG_DATA_HOME}/gem"
export GEM_SPEC_CACHE="${XDG_CACHE_HOME}/gem"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export GOPATH="${XDG_DATA_HOME}/go"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export VAGRANT_HOME="${XDG_DATA_HOME}/vagrant"
export VAGRANT_ALIAS_FILE="${XDG_DATA_HOME}/vagrant/aliases"

export _JAVA_OPTIONS="${_JAVA_OPTIONS} -Djava.util.prefs.userRoot=\"${XDG_CONFIG_HOME}/java\""
