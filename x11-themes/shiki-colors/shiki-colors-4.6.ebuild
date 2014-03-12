# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from mva overlay $

EAPI="5"

DESCRIPTION="The elegance of a dark theme with the usability of a light theme"
HOMEPAGE="http://code.google.com/p/gnome-colors/"

SRC_URI="http://gnome-colors.googlecode.com/files/${P}.tar.gz
	http://dev.gentoo.org/~pacho/Shiki-Gentoo-${PV}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+openbox"

DEPEND=""
RDEPEND="openbox? ( x11-themes/shiki-colors-openbox )
	x11-themes/gtk-engines"
RESTRICT="binchecks strip"

src_install() {
	dodir /usr/share/themes
	insinto /usr/share/themes
	doins -r "${WORKDIR}"/Shiki* || die "Installing themes failed"
	dodoc AUTHORS ChangeLog README
}
