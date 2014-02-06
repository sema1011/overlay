# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit qt4-r2

DESCRIPTION="UMPlayer is cross-platform and installer packages are available for
the Windows, Mac and GNU / Linux operating systems. It is completely free to use
and distribute so feel free to share UMPlayer with all your friends."
HOMEPAGE="http://www.kochkin.org/doku.php/screengen/010-index"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~86 "
IUSE=""

RDEPEND=""
	
DEPEND="${RDEPEND}"

src_configure() {
	eqmake4
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install || die
}
