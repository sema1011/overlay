 
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from sema1011 overlay $

EAPI="5"
inherit l10n cmake-utils fdo-mime gnome2-utils

DESCRIPTION="Offline Grooveshark.com music"
HOMEPAGE="https://github.com/gcala/grooveoff"
SRC_URI="https://github.com/gcala/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/qjson
	media-libs/phonon
	dev-qt/qtxmlpatterns:4
	dev-qt/qtsvg:4
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	dev-qt/qtdbus:4
	media-libs/taglib
	"

DOCS=( README.md INSTALL LICENSE ChangeLog )

src_prepare() {
	cmake-utils_src_prepare

	l10n_find_plocales_changes "translations" "${PN}_" '.ts'
}

src_configure() {
	cmake-utils_src_configure INSTALL_PREFIX="${EPREFIX}"/usr
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}
