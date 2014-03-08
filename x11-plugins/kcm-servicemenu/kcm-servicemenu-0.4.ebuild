# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

KDE_LINGUAS="de ru"
inherit kde4-base

DESCRIPTION="System Settings module to manage service menus for KDE 4"
HOMEPAGE="http://www.kde-apps.org/content/show.php/Service+Menu+Manager?content=94996"
SRC_URI="http://linux.wuertz.org/dists/sid/main/source/${PN}s_${PV}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="debug"

RDEPEND="
	>=kde-base/kdelibs-${KDE_MINIMAL}
	kde-base/knewstuff
"

S="${WORKDIR}/${PN}"

src_prepare() {
	epatch "${FILESDIR}/fix-po_CMakeLists.diff"

	cp "${FILESDIR}/ru.po" "${S}/po"

	kde4-base_src_prepare
}
