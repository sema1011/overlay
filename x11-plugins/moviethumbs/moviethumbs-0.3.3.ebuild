# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay $

EAPI="5"
inherit qt4-r2 eutils 

DESCRIPTION="MovieThumbs generates thumbnails for movies and series."
HOMEPAGE="https://github.com/mdemeyer/MovieThumbs"
SRC_URI="https://github.com/sema1011/Files/raw/master/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/qjson
	=media-video/libmoviethumbs-0.3.3"
	
src_prepare() {
	epatch "${FILESDIR}"/${PV}-ves-fix.patch
}

src_configure() {
	mkdir -p ${S}/build
	cd ${S}/build
	cmake -DCMAKE_BUILD_TYPE=Release ${S}/tools/
}

src_compile() {
	cd ${S}/build
	emake || die "emake failed"
}

src_install() {
	cd ${S}/build
	emake DESTDIR="${D}" install || die
	dodoc ${S}/README || die
	dodoc ${S}/INSTALL || die
	dodoc ${S}/changelog || die
	dodoc ${S}/COPYING || die
	dodoc ${S}/TODO || die
}
