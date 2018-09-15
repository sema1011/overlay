# Copyright 2013-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit base

DESCRIPTION="Vacuum and reindex browser sqlite databases"
HOMEPAGE="https://bbs.archlinux.org/viewtopic.php?id=148062
https://github.com/graysky2/profile-cleaner"
SRC_URI="https://github.com/graysky2/profile-cleaner/archive/v$PV.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash
sys-devel/bc
sys-apps/findutils
sys-process/parallel
dev-db/sqlite:3"

DOCS=(INSTALL LICENSE)
