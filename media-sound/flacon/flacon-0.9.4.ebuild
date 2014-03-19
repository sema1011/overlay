# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

#PLOCALES="cs_CZ es_MX fr gl it pl_PL pt_BR ro_RO ru si_LK uk zh_CN zh_TW"

inherit cmake-utils

DESCRIPTION="Extracts audio tracks from audio CD image to separate tracks"
HOMEPAGE="http://flacon.github.io/"
SRC_URI="https://github.com/flacon/flacon/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="flac mac mp3 mp4 ogg replaygain tta wavpack"

RDEPEND="
	media-sound/shntool[mac?]
	flac? ( media-libs/flac )
	mac? ( media-sound/mac )
	mp3? ( media-sound/lame )
	mp4? ( media-libs/faac )
	ogg? ( media-sound/vorbis-tools )
	tta? ( media-sound/ttaenc )
	wavpack? ( media-sound/wavpack )
	replaygain? (
		mp3? ( media-sound/mp3gain )
		ogg? ( media-sound/vorbisgain )
	)
	dev-libs/uchardet
"
DEPEND="${RDEPEND}"

DOCS=( README.md LICENSE )

src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	cmake-utils_src_configure INSTALL_PREFIX="${EPREFIX}"/usr
}
