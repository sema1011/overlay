# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from sema1011 overlay $

EAPI="5"

DESCRIPTION="Collection of Openbox themes"
HOMEPAGE="http://wiki.archlinux.org/index.php/Openbox#Openbox_Themes"
SRC_URI="ftp://ftp.uni-bayreuth.de/pub/linux/archlinux/community/os/i686/${P}-2-any.pkg.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="x11-wm/openbox"
RDEPEND="${DEPEND}"
S="${WORKDIR}"

src_install() {
	insinto /usr/share/themes
	doins -r usr/share/themes/*
}
