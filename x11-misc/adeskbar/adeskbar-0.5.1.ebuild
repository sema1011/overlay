# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="A Quick Application Launcher"
HOMEPAGE="http://madbox.tuxfamily.org/"
SRC_URI="http://download.tuxfamily.org/adeskbar/sources/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}"

#S=${WORKDIR}/${PN}

src_install() {
#	cd ${S}
	install -d ${D}/usr/{bin,share/${PN},share/pixmaps,share/applications}
	cp -a src/* ${D}/usr/share/${PN}
	install -m 644 src/images/${PN}.png ${D}/usr/share/pixmaps/
	install -m 644 ${PN}.desktop ${D}/usr/share/applications/
	install -m 755 ${PN}.sh ${D}/usr/bin/${PN}
}
