# make install            → ~/.local (user)
# sudo make install PREFIX=/usr/local  → system-wide
# PKGBUILD uses: make install DESTDIR="$pkgdir" PREFIX=/usr
# make dev                → symlink bin/* into ~/.local/bin (live-edit installs)
PREFIX ?= $(HOME)/.local
BINDIR  = $(DESTDIR)$(PREFIX)/bin
DATADIR = $(DESTDIR)$(PREFIX)/share/jcz-scripts

SCRIPTS := $(wildcard bin/*)

install:
	install -d $(BINDIR) $(DATADIR)
	install -m755 $(SCRIPTS) $(BINDIR)
	install -m644 lib/*.sh $(DATADIR)

dev:
	install -d $(HOME)/.local/bin
	ln -sf $(abspath $(SCRIPTS)) $(HOME)/.local/bin/

uninstall:
	rm -f $(addprefix $(BINDIR)/,$(notdir $(SCRIPTS)))
	rm -rf $(DATADIR)

.PHONY: install dev uninstall
