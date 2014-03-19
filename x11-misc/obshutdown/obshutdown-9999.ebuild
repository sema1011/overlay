# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from sema1011 overlay $

EAPI="5"

inherit flag-o-matic eutils git-2 autotools

DESCRIPTION="GTK/Cairo based shutdown box styled for Openbox and others windows managers"
HOMEPAGE="https://github.com/panjandrum/obshutdown"
EGIT_REPO_URI="https://github.com/panjandrum/obshutdown.git"
KEYWORDS="~amd64 ~x86"
LICENSE="GPL"
SLOT="0"

# strace only uses the header from libaio to decode structs
DEPEND=">=x11-libs/gtk+-2.24.10-r1
	>=x11-libs/cairo-1.10.2
	sys-devel/automake:1.11
	"
RDEPEND=""
