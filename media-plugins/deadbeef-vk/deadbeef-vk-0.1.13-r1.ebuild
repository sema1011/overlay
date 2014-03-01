# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: media-sound/deadbeef-infobar/deadbeef-vk-9999.ebuild,v 1 2013/01/08 21:49:35 megabaks Exp $

EAPI=5

inherit cmake-utils versionator

MY_PV="$(replace_version_separator 2 '-')"
MY_PN="db-vk"

DESCRIPTION="DeadBeef plugin for listening music from vkontakte.com"
HOMEPAGE="https://github.com/scorpp/db-vk"
SRC_URI="https://github.com/scorpp/${MY_PN}/archive/${MY_PN}_${MY_PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gtk2 gtk3"
REQUIRED_USE="|| ( ${IUSE} )"

DEPEND_COMMON="dev-libs/json-glib
	gtk2? ( <media-sound/deadbeef-0.6[gtk2,curl] )
	gtk3? ( <media-sound/deadbeef-0.6[gtk3,curl] )"

RDEPEND="${DEPEND_COMMON}"
DEPEND="${DEPEND_COMMON}"
S="${WORKDIR}/${MY_PN}-${MY_PN}_${MY_PV}"

src_configure() {
	mycmakeargs="
	$(cmake-utils_use_with gtk2 GTK2)
	$(cmake-utils_use_with gtk3 GTK3)"
	cmake-utils_src_configure
}
