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
groups=()
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
source=("src/clanios.sh")
noextract=()
sha256sums=()
validpgpkeys=()

build() {
	echo "Building $pkgname..."
}

package() {
	install -Dm755 src/clanios.sh "$pkgdir/etc/profile.d/clanios.sh"
}
