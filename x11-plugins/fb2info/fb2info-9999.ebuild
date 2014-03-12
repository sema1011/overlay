# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay $

EAPI="5"

inherit git-2

DESCRIPTION="Simple fb2 thumbnauler for Nautilus and Caja."
HOMEPAGE="https://github.com/VitalD/fb2info"
EGIT_REPO_URI="git://github.com/VitalD/fb2info"

KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"
IUSE="pcmanfm thunar kde"

RDEPEND="
	dev-python/lxml
	dev-python/elementtree
	pcmanfm? ( x11-misc/pcmanfm )
	thunar? ( xfce-base/thunar )
	kde? ( kde-base/dolphin )
	dev-python/imaging"
		
src_install() {
	dobin fb2info.py || die
	dosym fb2info.py /usr/bin/fb2info || die
	
	insinto /usr/share/thumbnailers/
	doins fb2.thumbnailer || die
	
	dodoc README.md || die
	dodoc LICENSE || die
}
