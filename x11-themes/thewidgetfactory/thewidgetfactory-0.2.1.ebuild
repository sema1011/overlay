# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="A showcase for GTK+ widgets"
HOMEPAGE="http://www.stellingwerff.com/?page_id=10"
SRC_URI="http://www.stellingwerff.com/TheWidgetFactory/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="gtk-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/gtk+-2.4:2"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_install() {
	emake DESTDIR="${D}" install || die
	mv "${D}"/usr/bin/twf{,-${SLOT}} || die
	dodoc README NEWS AUTHORS ChangeLog || die
}
