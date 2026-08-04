# jcz-scripts shared library — source, don't execute.
# Keep this dependency-free POSIX sh so every script can use it.

log() { printf '%s\n' "$*" >&2; }

die() {
	log "ERROR: $*"
	exit 1
}

# require <cmd>... — die if any dependency is missing
require() {
	for cmd in "$@"; do
		command -v "$cmd" >/dev/null 2>&1 || die "missing dependency: $cmd (try: sudo pacman -S $cmd)"
	done
}

# state_dir <app> — print (and create) the XDG state dir for logs/reports
state_dir() {
	_d="${XDG_STATE_HOME:-$HOME/.local/state}/$1"
	mkdir -p "$_d" && printf '%s' "$_d"
}

# config_dir <app> — print (and create) the XDG config dir
config_dir() {
	_d="${XDG_CONFIG_HOME:-$HOME/.config}/$1"
	mkdir -p "$_d" && printf '%s' "$_d"
}
