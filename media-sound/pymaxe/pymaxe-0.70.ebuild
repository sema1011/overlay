
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from sema1011 overlay $

EAPI="5"
inherit eutils

DESCRIPTION="Pymaxe is a free (open-source) application for downloading music and videoclips from Internet."
HOMEPAGE="http://pymaxe.com/"
SRC_URI="http://pymaxe.com/files/latest/pymaxe.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	"
S="${WORKDIR}"

src_install() {
	dodir /usr/bin
	dobin ${S}/usr/bin/${PN}
	
	exeinto /usr/share/${PN}/
    doexe ${S}/usr/share/${PN}/launcher.py || die
	
	dodir /usr/share/${PN}/
    cp -R "${S}/usr/share/${PN}/${PN}.png" "${D}/usr/share/${PN}/" || die "Install failed!"
    
    dodir /usr/share/applications/
    cp -R "${S}/usr/share/applications/${PN}.desktop" "${D}/usr/share/applications/" || die "Install failed!"
    
    dodir /usr/share/icons/
    cp -R "${S}/usr/share/icons/${PN}.png" "${D}/usr/share/icons/" || die "Install failed!"
}

