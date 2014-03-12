# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay $

EAPI="5"

MY_PN="${PN/f/F}"
DESCRIPTION="This is a video thumbnailer that searches imdb for covers based on the file names.
It works for movies in the specified paths (recursively).
For the rest of the cases or if no cover is found the default thumbnailer is used."
HOMEPAGE="http://yuzem.blogspot.ru/p/imdb-thumbnailer.html"

SRC_URI="https://github.com/sema1011/Files/raw/master/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"


LICENSE="GPL-3"
SLOT="0"
IUSE="gnome kde"

RDEPEND="
	gnome? ( media-video/ffmpegthumbnailer )
	kde? ( media-video/kffmpegthumbnailer )"

src_install() {
	dobin imdb-thumbnailer || die
	dosym imdb-thumbnailer /usr/bin/imdb-thumbnailer-0.8.8 || die
	
	insinto /usr/share/thumbnailers/ || die
	doins imdb.desktop || die
	dosym imdb.desktop /usr/bin/imdb.thumbnailer || die
	
	
	dodoc README || die
	dodoc INSTALL || die
	dodoc CHANGELOG || die
}
