# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit xdg-utils gnome2-utils autotools git-r3

MY_PN=Viewnior
DESCRIPTION="Viewnior - Fast and elegant image viewer"
HOMEPAGE="https://siyanpanayotov.com/project/viewnior/ https://github.com/hellosiyan/Viewnior"
EGIT_REPO_URI="https://github.com/hellosiyan/${PN}.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/glib:2
	media-gfx/exiv2
	>=x11-libs/gtk+-2.20:2
	x11-misc/shared-mime-info"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${MY_PN}-${P}

src_prepare() {
	default

	# fix for bug #454230
	sed -r -i "s:(PKG_CHECK_MODULES):AC_CHECK_LIB([m],[cos])\n\n\1:" configure.ac

	eautoreconf
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	gnome2_icon_cache_update
}
