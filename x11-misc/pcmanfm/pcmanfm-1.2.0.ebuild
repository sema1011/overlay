# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/pcmanfm/pcmanfm-1.1.2.ebuild,v 1.1 2013/08/17 11:52:43 hwoarang Exp $

EAPI="5"
inherit eutils fdo-mime readme.gentoo

MY_PV="${PV/_/}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="Fast lightweight tabbed filemanager"
HOMEPAGE="http://pcmanfm.sourceforge.net/"
SRC_URI="mirror://sourceforge/pcmanfm/${MY_P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ppc ~x86"
IUSE="debug"

RDEPEND=">=dev-libs/glib-2.18:2
	>=x11-libs/gtk+-2.16:2
	>=lxde-base/menu-cache-0.3.2
	x11-misc/shared-mime-info
	>=x11-libs/libfm-${PV}:=
	virtual/eject"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.40
	virtual/pkgconfig
	sys-devel/gettext"

S="${WORKDIR}"/${MY_P}

DOCS=( AUTHORS )

DOC_CONTENTS="PCmanFM can optionally support the menu://applications/
	location. You should install lxde-base/lxmenu-data for that functionality."
	
#src_prepare() {
#	epatch "${FILESDIR}"/upper-lim-fix.patch
#}

src_configure() {
	strip-linguas -i "${S}/po"
	econf --sysconfdir=/etc $(use_enable debug)
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	readme.gentoo_print_elog
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
}
