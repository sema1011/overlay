# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2

DESCRIPTION="Johnny is a GUI for John the Ripper. It was proposed by Shinnok. You could look onto original version on John the Ripper GUI sketches page."
HOMEPAGE="http://openwall.info/wiki/john/johnny"
SRC_URI="http://openwall.info/wiki/_media/john/johnny1.1.3.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	app-crypt/johntheripper
	dev-qt/qtcore:4
	dev-qt/qtgui:4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/johnny1.1.3" \

DOCS="LICENSE README"

src_install() {
	dobin johnny
	dodoc LICENSE README
}
