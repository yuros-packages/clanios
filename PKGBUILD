# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: null <null@yuros.org>
pkgname=clanios
pkgver=1.0.0
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
replaces=('/etc/bash.bashrc' '/etc/profile' '/usr/lib/os-release' )
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
	sudo rm -fr /etc/bash.bashrc
	sudo rm -fr /etc/profile
	sudo rm -fr /usr/lib/os-release
}



package() {
	cp -fr "${srcdir}/etc" "$pkgdir/etc"
	cp -fr "${srcdir}/usr" "$pkgdir/usr"
}
