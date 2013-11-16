# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit base bzr gnome2-utils

DESCRIPTION="Elementary icon theme is designed to be smooth, sexy, clear, and efficient"
HOMEPAGE="https://launchpad.net/elementaryicons"
EBZR_REPO_URI="lp:elementaryicons"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+gtk +icons"

RDEPEND="${DEPEND}
	gtk? (
		x11-libs/gtk+:2
	)
	icons? (
		x11-themes/hicolor-icon-theme
	)"
DEPEND=""

RESTRICT="binchecks mirror strip"

S="${WORKDIR}/elementary-icon-theme-9999"
DOCS=( AUTHORS COPYING CONTRIBUTORS )

src_install() {
	dodoc ${DOCS}
	rm -r ${DOCS}

	insinto /usr/share/icons/elementary
	doins -r *
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
