
# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit l10n cmake-utils

DESCRIPTION="Offline Grooveshark.com music"
HOMEPAGE="https://github.com/gcala/grooveoff"
SRC_URI="http://qt-apps.org/CONTENT/content-files/158258-${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-libs/qjson
	media-libs/phonon-vlc
	dev-qt/qtcore:4
	dev-qt/qtgui:4
	"

DOCS=( README.md INSTALL ChangeLog )

PATCHES=(
	"${FILESDIR}/${P}-add-ru.patch"
)

src_prepare() {
	cmake-utils_src_prepare
	l10n_find_plocales_changes "translations" "${PN}_" '.ts'
}

src_configure() {
	cmake-utils_src_configure INSTALL_PREFIX="${EPREFIX}"/usr
}
