# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit gnome2-utils

DESCRIPTION="Elementary icon theme is designed to be smooth, sexy, clear, and efficient"
HOMEPAGE="https://launchpad.net/elementaryicons"
SRC_URI="http://launchpad.net/elementaryicons/3.x/${PV}/+download/elementaryicons${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND=""
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	x11-libs/gtk+:2"

RESTRICT="binchecks strip"

S="${WORKDIR}/elementaryicons${PV}"
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
