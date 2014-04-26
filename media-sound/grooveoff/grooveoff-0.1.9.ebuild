
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from sema1011 overlay $

EAPI="5"
inherit l10n cmake-utils

DESCRIPTION="Offline Grooveshark.com music"
HOMEPAGE="https://github.com/gcala/grooveoff"
SRC_URI="https://github.com/gcala/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	dev-libs/qjson
	media-libs/phonon
	dev-qt/qtxmlpatterns:4
	dev-qt/qtsvg:4
	dev-qt/qtdbus:4
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	"

DOCS=( README.md INSTALL ChangeLog )

PATCHES=(
	"${FILESDIR}/${P}-fix-rus.patch"
)

src_prepare() {
	cmake-utils_src_prepare
	l10n_find_plocales_changes "translations" "${PN}_" '.ts'
}

src_configure() {
	cmake-utils_src_configure INSTALL_PREFIX="${EPREFIX}"/usr
}
