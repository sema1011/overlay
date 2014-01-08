# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_DEPEND="2:2.6"

inherit eutils python

DESCRIPTION="A gui theme editor for openbox"
HOMEPAGE="http://xyne.archlinux.ca/projects/obtheme/"
SRC_URI="http://xyne.archlinux.ca/projects/obtheme/src/obtheme-${PV}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="
	dev-python/pygobject:2
	dev-python/pygtk:2
	dev-python/fuse-python
	x11-libs/gtk+:2"

S=${WORKDIR}/obtheme-${PV}

src_install() {
	dobin ${PN}
	make_desktop_entry ${PN} "${PN} editor" "" Utility
}
