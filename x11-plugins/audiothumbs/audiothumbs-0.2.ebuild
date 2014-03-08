 
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit qt4-r2 eutils 

DESCRIPTION="KDE thumbnail-plugin that displays embedded cover arts in 
Audio (MP3, FLAC, M4A, OGG) file tags. Small images (thumbnails)
to be displayed, for example, on Konqueror and Dolphin file managers."
HOMEPAGE="https://github.com/mdemeyer/MovieThumbs"
SRC_URI="https://github.com/sema1011/Files/raw/master/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="media-libs/taglib
	dev-qt/qtcore
	media-libs/flac"
	
S="${WORKDIR}/"

src_configure() {
	mkdir -p ${S}/build
	cd ${S}/build
	cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release  ..
}

src_compile() {
	cd ${S}/build
	emake || die "emake failed"
}

src_install() {
	cd ${S}/build
	emake DESTDIR="${D}" install || die
	dodoc ${S}/README || die
	kbuildsycoca4
}