# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2 git-2

DESCRIPTION="Image Viewer and Organizer"
HOMEPAGE="https://gitorious.org/phototonic"
EGIT_REPO_URI="git://gitorious.org/phototonic/phototonic.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="svg tiff"

RDEPEND="
	>=dev-qt/qtsvg-5.3.1:5
	>=dev-qt/qtwidgets-5.3.1:5
	tiff? ( dev-qt/qtimageformats )
	svg? ( >=dev-qt/qtsvg-5.3.1:5 )
	>=dev-qt/qtcore-5.3.1:5
	>=dev-qt/qtdbus-5.3.1:5
	>=dev-qt/qtgui-5.3.1:5
	media-gfx/exiv2
	x11-libs/libxkbcommon
	"
DEPEND="${RDEPEND}"
