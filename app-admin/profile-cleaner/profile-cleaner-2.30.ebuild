# Copyright 2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit base

DESCRIPTION="Simple script to vacuum and reindex sqlite databases used by Firefox and by Chrome/Chromium."
HOMEPAGE="https://github.com/graysky2/profile-cleaner"
SRC_URI="http://repo-ck.com/source/profile-cleaner/${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash
sys-devel/bc
sys-apps/coreutils
sys-apps/findutils
sys-apps/grep
sys-apps/sed
sys-process/parallel
dev-db/sqlite:3"

DOCS=(INSTALL LICENSE)
