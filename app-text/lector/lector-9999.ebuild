# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_6 )

inherit eutils distutils-r1 git-r3 gnome2-utils xdg-utils

DESCRIPTION="Qt based ebook reader"
HOMEPAGE="https://github.com/BasioMeusPuga/Lector"

EGIT_REPO_URI="https://github.com/BasioMeusPuga/Lector.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	>=dev-python/PyQt5-5.10.1[gui,multimedia,widgets,${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup-4.6.0[${PYTHON_USEDEP}]
	>=app-text/poppler-0.61.1[qt5]
	>=dev-python/python-poppler-qt5-0.24.2[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"

PATCHES=("${FILESDIR}/setup_py.patch")

python_prepare_all() {
	distutils-r1_python_prepare_all
}

python_compile() {
	distutils-r1_python_compile
}

python_install() {
	distutils-r1_python_install
	python_newscript lector/__main__.py lector
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}
