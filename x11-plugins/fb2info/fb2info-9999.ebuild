# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit git-2

DESCRIPTION="Simple fb2 thumbnauler for Nautilus and Caja."
HOMEPAGE="https://github.com/VitalD/fb2info"
EGIT_REPO_URI="git://github.com/VitalD/fb2info"

KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="
	dev-python/lxml
	x11-misc/pcmanfm"

src_install() {
	dobin fb2info.py || die
	dosym fb2info.py /usr/bin/fb2info || die
	
	insinto /usr/share/thumbnailers/
	doins fb2.thumbnailer || die
	
	dodoc README.md || die
	dodoc LICENSE || die
}
