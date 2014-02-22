# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/pcmanfm-qt/pcmanfm-qt-0.1.0.ebuild,v 1.2 2013/04/29 18:59:04 hwoarang Exp $

EAPI="5"

inherit cmake-utils qt4-r2

DESCRIPTION="A fast and light-weight file manager based on Qt4"
HOMEPAGE="http://qt-apps.org/content/show.php?content=154427"
SRC_URI="https://github.com/sema1011/Files/raw/master/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
LICENSE="GPL-3"
SLOT="0"
IUSE="debug"

COMMON_DEPEND=">=dev-libs/glib-2.18:2
	dev-qt/qtgui:4
	dev-qt/qtdbus:4
	sys-libs/zlib
	app-arch/lzma
	dev-libs/libtar
	dev-libs/libzip
	app-arch/bzip2
	dev-python/python-magic"

S="${WORKDIR}"/NewBreeze-2.3.0

src_configure() {
    eqmake4
    emake
}
src_install() {
	emake DESTDIR="${D}" install
}
