# Local package: makepkg -si  (only needed for the pacman-owned tier)
pkgname=jcz-scripts
pkgver=0.1.0
pkgrel=1
pkgdesc="Personal CLI tooling (hwinfox, ...)"
arch=('any')
depends=('hwinfo')
options=('!debug')

pkgver() {
	cd "$startdir"
	git describe --tags --always 2>/dev/null | sed 's/^v//;s/-/./g' || echo 0.1.0
}

package() {
	make -C "$startdir" install DESTDIR="$pkgdir" PREFIX=/usr
}
