# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils games

DESCRIPTION="Minecraft is a game about breaking and placing blocks. At first, people built structures to protect against nocturnal monsters, but as the game grew players worked together to create wonderful, imaginative things."
HOMEPAGE="http://www.minecraft.net"
SRC_URI=""
LICENSE=""

SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="sound"

DEPEND="net-misc/wget"
RDEPEND="
	sound? ( media-libs/openal )
	virtual/opengl
	virtual/jre
	x11-apps/xrandr
	x11-libs/libX11
	x11-libs/libXau
	x11-libs/libxcb
	x11-libs/libXcursor
	x11-libs/libXdmcp
	x11-libs/libXext
	x11-libs/libXrandr"
	 
src_prepare() {
	local uri="${HOMEPAGE}/download/minecraft.jar"
	wget "${uri}" -O "${PN}.jar" || die "wget \"${uri}\" failed"
	local uri="${HOMEPAGE}/favicon.png"
	wget "${uri}" -O "${PN}.png" || die "wget \"${uri}\" failed"
}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/${PN}"
	insinto "${dir}" || die "insinto \"${dir}\" failed"
	doins "${PN}.jar" || die "doins \"${PN}.jar\" failed"
	newicon "${PN}.png" "${PNG}.png" || die "newicon \"${PN}.png\" failed"
	make_desktop_entry "java -jar \"${dir}/${PN}.jar\"" "${PN}" "/usr/share/pixmaps/${PN}.png" || die "make_desktop_entry \"${PN}\" failed"

	prepgamesdirs
}
