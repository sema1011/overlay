# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PN="${PN/f/F}"
DESCRIPTION="Fb2 renamer"
HOMEPAGE="http://pybookreader.narod.ru/misc.html"

SRC_URI="https://github.com/sema1011/Files/raw/master/${P}.tgz"

KEYWORDS="~amd64 ~x86"


LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=""

src_install() {
	dobin fb2desc.py
	# also known as screenfetch
	dosym fb2desc.py /usr/bin/fb2desc
	dodoc README.ru
}
