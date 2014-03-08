# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils eutils git-2

DESCRIPTION="Thumbnailer to show fb2 cover previews in KDE file managers (Dolphin and Konqueror)"
HOMEPAGE="file:///home/sema/Overlay/x11-plugins/kde-thumbnailer-epub/kde-thumbnailer-epub-1.0.ebuild"
SRC_URI="http://kde-apps.org/CONTENT/content-files/160180-${P}.tar.gz"

LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="app-text/ebook-tools
	kde-base/plasma-workspace"

RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}

src_unpack() {
	unpack ${A}
}	

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
