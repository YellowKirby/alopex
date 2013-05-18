# Maintainer: Jesse McClure AKA "Trilby" <jmcclure [at] cns [dot] umass [dot] edu>
_gitname="alopex"
pkgname="${_gitname}-git"
pkgver=2.229.e61ed7a
pkgrel=1
pkgdesc="A Tiny, Tabbed, Tiling Window Manager with Fur"
url="http://trilbywhite.github.io/alopex/"
arch=('any')
license=('GPLv3')
depends=('libx11' 'libxrandr')
makedepends=('git')
source=("${_gitname}::git://github.com/TrilbyWhite/alopex.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_gitname}";
	echo "2.$(git rev-list --count HEAD).$(git describe --always )"
}

prepare() {
	for config in {"$HOME/.${_gitname}_","$XDG_CONFIG_HOME/${_gitname}/"}{conf{,ig},icons,theme}.h; do
		if [[ -f "$config" ]]; then
			case "$config" in
				*conf.h | *config.h)
					cp "$config" "${srcdir}/${_gitname}/config.h"
					msg2 "Using configuration from $config"
					msg2 "Check the default config.h for changes"
					;;
				*icons.h)
					cp "$config" "${srcdir}/${_gitname}/icons.h"
					msg2 "Using icons from $config"
					;;
				*theme.h)
					cp "$config" "${srcdir}/${_gitname}/theme.h"
					msg2 "Using theme from $config"
					;;
			esac
		fi
	done
}

build() {
	cd "${_gitname}"
	make
}

package() {
	cd "${_gitname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
