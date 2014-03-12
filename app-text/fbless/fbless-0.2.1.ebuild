# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: This ebuild is from sema1011 overlay $

EAPI="5"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="A console reader for .fb2 books"
HOMEPAGE="http://pybookreader.narod.ru/misc.html"
SRC_URI="http://pybookreader.narod.ru/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/ncurses"
RDEPEND="${DEPEND}"
RESTRICT_PYTHON_ABIS="3.*"
PYTHON_MODNAME="ornamentbook pybookreader"
#S="${WORKDIR}/${MY_P}"
