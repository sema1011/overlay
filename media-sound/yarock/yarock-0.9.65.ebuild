# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

LANGS=" cs de es fr gl pt_BR ro ru tr_TR zh_CN"

inherit cmake-utils

MY_PN="Yarock"
MY_PP=""
MY_P="${MY_PN}_${PV}${MY_PP}_source"
DESCRIPTION="Yarock is Qt4 modern music player designed to provide an easy and pretty music collection browser based on cover art."
HOMEPAGE="http://qt-apps.org/content/show.php?content=129372"
SRC_URI="http://launchpad.net/yarock/trunk/${PV}/+download/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="phonon vlc"
IUSE+="${LANGS// / linguas_}"

DEPEND="
	>=dev-qt/qtgui-4.7.0
	>=dev-qt/qtdbus-4.7.0
	>=dev-qt/qtsql-4.7.0[sqlite]
	dev-libs/qjson
	media-libs/libechonest
	media-libs/taglib
	phonon? ( media-libs/phonon )
	vlc? ( media-video/vlc )
"

RDEPEND="${DEPEND}"

REQUIRED_USE="|| ( phonon vlc )"

DOCS="CHANGES README"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	# Fix install paths
	sed -i -e "/^install/s:share/icons:/usr/share/icons:" CMakeLists.txt || die "Failed to fix the icons path!"
	sed -i -e "/^install/s:/usr/local/bin/:/usr/bin/:" src/CMakeLists.txt || die "Failed to fix the binary path!"
	sed -i -e "/^install/s:/usr/share/locale/yarock/:/usr/share/yarock/translation/:" src/CMakeLists.txt || die "Failed to fix the translations path!"

	# Remove unneeded translations
	rm translation/yarock_en.ts
	for ln in ${LANGS}; do
		! use linguas_${ln} && rm translation/yarock_${ln}.ts
	done
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use phonon ENABLE_PHONON)
		$(cmake-utils_use vlc ENABLE_VLC)
	)
	
	cmake-utils_src_configure
}
