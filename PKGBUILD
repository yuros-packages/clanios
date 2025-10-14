# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: null <null@yuros.org>
pkgname=clanios
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="yuros system installation and configuration"
arch=('x86_64')
url="https://package.yuros.org/clanios"
license=('MIT')
groups=('core')
depends=('bash' 'pacman')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=("src/")
sha256sums=()
validpgpkeys=()


build() {
	echo "cleaning obsolute $pkgname..."

}


package() {
	sudo rm -fr "$pkgdir/etc/profile" &&
	echo "clean profile" &&
	sudo rm -fr "$pkgdir/etc/bash.bashrc" &&
	echo "clean bashrc" &&
	sudo rm -fr "$pkgdir/usr/lib/os-release" &&
	echo "clean release" &&
	cp -fr "${srcdir}/etc" "$pkgdir/etc" &&
	cp -fr "${srcdir}/usr" "$pkgdir/usr"
}
