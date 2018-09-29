# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit gnome2-utils fdo-mime

DESCRIPTION="A simple client for online RSS services like tt-rss and others"
HOMEPAGE="https://jangernert.github.io/FeedReader/"
SRC_URI="https://github.com/jangernert/FeedReader/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-util/meson-0.32.0
		dev-util/ninja"

RDEPEND="${DEPEND}
	>=dev-lang/vala-0.26
	>=x11-libs/gtk+-3.20
	net-libs/libsoup
	dev-libs/json-glib
	net-libs/webkit-gtk
	dev-db/sqlite
	app-crypt/libsecret
	x11-libs/libnotify
	dev-libs/libxml2
	net-libs/rest
	>=dev-libs/libgee-0.20.1
	media-libs/gstreamer
	media-libs/gst-plugins-base
	net-misc/curl
	dev-libs/libpeas"

src_compile() {

	params="--prefix=/usr"

	meson builddir ${params}

}

src_install() {
	
	ninja -C builddir install
	
}

pkg_preinst() {
	gnome2_icon_savelist
	gnome2_schemas_savelist
}

pkg_postinst() {
	gnome2_schemas_update
	fdo-mime_desktop_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	fdo-mime_desktop_database_update
	gnome2_schemas_update
}
