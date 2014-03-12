# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from sema1011 overlay $

EAPI="5"

inherit qt4-r2 eutils

DESCRIPTION="ScreenGen - Console screenlist generator"
HOMEPAGE="http://www.kochkin.org/doku.php/screengen/010-index"
SRC_URI="https://github.com/sema1011/Files/raw/master/screengen-1.7.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86 "
IUSE=""

RDEPEND=""

src_configure() {
	eqmake4
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake install INSTALL_ROOT="${D}" || die
}
