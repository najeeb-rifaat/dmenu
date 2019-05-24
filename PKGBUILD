# Maintainer: Najeeb Rifaat <mohamme89d@gmail.com>

pkgname=dmenu-najeeb
basepkgname=dmenu
pkgver=4.9
pkgrel=1
pkgdesc="A generic menu for X"
url="http://suckless.org/dmenu"
arch=('x86_64')
license=('MIT')
options=(zipman)
depends=('sh' 'libxinerama' 'libxft')
provides=("${pkgname}")
conflicts=("${pkgname}")

_patches=(
  "https://tools.suckless.org/dmenu/patches/center/dmenu-center-4.8.diff"
  "https://tools.suckless.org/dmenu/patches/border/dmenu-border-4.9.diff"
  "https://tools.suckless.org/dmenu/patches/scroll/dmenu-scroll-20180607-a314412.diff"
  "https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-4.9.diff"
)

source=(
  "http://dl.suckless.org/tools/$basepkgname-$pkgver.tar.gz"
  "${_patches[@]}"
)

md5sums=('SKIP')

prepare() {
  cd $srcdir/$basepkgname-$pkgver
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dmenu-center-4.8.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dmenu-border-4.9.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dmenu-scroll-20180607-a314412.diff"
}

build() {
  cd $srcdir/$basepkgname-$pkgver
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  cd $srcdir/$basepkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$basepkgname/LICENSE
  install -m644 -D README $pkgdir/usr/share/doc/$basepkgname/README
  #install -m644 -D $srcdir/dwm.desktop $pkgdir/usr/share/xsessions/dwm.desktop
}
