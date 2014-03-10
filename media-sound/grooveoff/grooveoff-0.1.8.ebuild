
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PLOCALES="cs el_GR en es eu fr it sk"
inherit l10n qt4-r2 cmake-utils

DESCRIPTION="Offline Grooveshark.com music"
HOMEPAGE="https://github.com/gcala/grooveoff"
SRC_URI="http://qt-apps.org/CONTENT/content-files/158258-${P}.tar.gz"

KEYWORDS="~amd64 ~x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
  dev-libs/qjson
  media-libs/phonon
  dev-qt/qtcore
  dev-qt/qtgui"

DOCS=( README.md INSTALL ChangeLog )

src_prepare() {
	l10n_find_plocales_changes "translations" "${PN}_" '.ts'
	
	qt4-r2_src_prepare
}

src_configure() {
	mkdir -p ${S}/build
	cd ${S}/build
	
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

src_compile() {
	cd ${S}/build
	emake || die "emake failed"
}

src_install() {
	cd ${S}/build
	emake DESTDIR="${D}" install || die
}