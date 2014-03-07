# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-python/mysql-connector-python/mysql-connector-python-1.1.6.ebuild,v 1.13 2014/02/1 20:50:21 sema1011 Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3} )

inherit distutils-r1

DESCRIPTION="MySQL driver written in Python"
HOMEPAGE="http://dev.mysql.com/doc/connector-python/en/index.html"
SRC_URI="https://github.com/sema1011/Files/raw/master/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

