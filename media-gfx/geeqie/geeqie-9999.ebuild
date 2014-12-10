# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

ESVN_REPO_URI="https://geeqie.svn.sourceforge.net/svnroot/geeqie/trunk"
ESVN_PROJECT="geeqie"
ESVN_BOOTSTRAP="NOCONFIGURE=1 ./autogen.sh"

DESCRIPTION="Lightweight GTK-based image browser (fork of gqview)."
HOMEPAGE="http://geeqie.sourceforge.net/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="lcms exif"

RDEPEND=">=x11-libs/gtk+-2.4.0
	lcms? ( media-libs/lcms )
	exif? ( media-gfx/exiv2 )
	virtual/libintl"

DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-devel/gettext"

src_unpack() {
	subversion_src_unpack
}

src_compile() {
	econf \
		--disable-dependency-tracking \
		--disable-lirc \
		$(use_with lcms) \
		$(use_with exif exiv2) \
		|| die "econf faild"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	# leave README uncompressed because the program reads it
	dodoc AUTHORS ChangeLog TODO
	rm -f "${D}/usr/share/doc/${PF}/COPYING"
}
