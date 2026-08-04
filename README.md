# scripts

Personal CLI tooling. Each executable lives in `bin/` (no extensions), shared
shell code in `lib/common.sh`.

## Install

| Tier            | Command                               | Lands in                                      |
| --------------- | ------------------------------------- | --------------------------------------------- |
| Dev (live-edit) | `make dev`                            | symlinks in `~/.local/bin`                    |
| User            | `make install`                        | `~/.local/bin` + `~/.local/share/jcz-scripts` |
| System          | `sudo make install PREFIX=/usr/local` | `/usr/local/*`                                |
| Pacman          | `makepkg -si`                         | `/usr/*`, tracked by pacman                   |

New machine: `ghq get jczacharia/scripts && make -C ~/src/github.com/jczacharia/scripts install`

## Adding a script

1. Create `bin/<name>` (no `.sh`), start from the lib-adapter preamble in `bin/hwinfox`.
2. `chmod +x bin/<name>` — `make dev` picks it up automatically.
3. Reports/logs go to `$(state_dir <name>)`, config to `$(config_dir <name>)`.
