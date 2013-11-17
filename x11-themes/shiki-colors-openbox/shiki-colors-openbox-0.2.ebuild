# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

DESCRIPTION="Shiki-Colors theme for Openbox"
HOMEPAGE="http://jmcknight.deviantart.com/art/Shiki-Colors-for-Openbox-149966599"
SRC_URI="http://fc00.deviantart.net/fs71/f/2010/011/1/5/Shiki_Colors_for_Openbox_by_jmcknight.gz
	-> Shiki_Colors_for_Openbox_by_jmcknight-1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_install() {
	insinto /usr/share/themes
	doins -r * || die "doins failed"
}
