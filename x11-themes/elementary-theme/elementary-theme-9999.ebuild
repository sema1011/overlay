# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay $

EAPI="5"

inherit base bzr

DESCRIPTION="The official elementary GTK theme designed to be smooth, attractive, fast, and usable"
HOMEPAGE="https://launchpad.net/egtk"
EBZR_REPO_URI="lp:egtk"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gtk +gtk3 +icons +wallpapers"

DEPEND="
	x11-themes/vanilla-dmz-aa-xcursors"
RDEPEND="${DEPEND}
	media-fonts/droid
	gtk? (
		x11-libs/gtk+:2
		x11-themes/gtk-engines-murrine
	)
	gtk3? (
		x11-libs/gtk+:3
		x11-themes/gtk-engines-unico
	)
	icons? (
		x11-themes/elementary-icon-theme
		x11-themes/hicolor-icon-theme
	)
	wallpapers? (
		x11-themes/elementary-wallpapers
	)"

RESTRICT="binchecks mirror strip"

pkg_setup() {
	DOCS=( AUTHORS CONTRIBUTORS COPYING )
	THEMES="index.theme metacity-1 gtk-2.0 gtk-3.0"
}

src_prepare() {
	# Correct cursor theme name
	sed -i 's/DMZ-Black/Vanilla-DMZ-AA/' index.theme
}

src_install() {
	insinto /usr/share/themes/elementary
	doins -r ${THEMES}

	base_src_install_docs
}
