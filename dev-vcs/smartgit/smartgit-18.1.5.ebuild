# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils java-utils-2 versionator

MY_PV="$(replace_all_version_separators _)"
MY_P="${PN}-linux-${MY_PV}"

DESCRIPTION="Git client with support for GitHub Pull Requests+Comments, SVN and Mercurial"
HOMEPAGE="http://www.syntevo.com/smartgit"
SRC_URI="http://www.syntevo.com/download/?file=${PN}/${MY_P}.tar.gz"

SLOT="0"
LICENSE="smartgit"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="fetch"

DEPEND=">=virtual/jre-1.8:1.8"
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${PN}

pkg_nofetch(){
	einfo "Please download ${A} from:"
	einfo "http://www.syntevo.com/smartgit/download"
	einfo "and move/copy to /usr/portage/distfiles"
}

src_install() {
	local rdir="/opt/${PN}" X
	insinto ${rdir}
	doins -r *

	java-pkg_register-environment-variable SWT_GTK3 0

	java-pkg_regjar "${ED}"/${rdir}/lib/*.jar

	java-pkg_dolauncher ${PN} --java_args "-Dsun.io.useCanonCaches=false -Xmx768m -Xverify:none -XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:InitiatingHeapOccupancyPercent=25" --jar bootloader.jar

	for X in 32 64 128; do
		insinto /usr/share/icons/hicolor/${X}x${X}/apps
		newins "${S}"/bin/smartgit-${X}.png ${PN}.png
	done

	make_desktop_entry "${PN}" "SmartGIT" ${PN} "Development;RevisionControl"
}

pkg_postinst() {
	elog "${PN} relies on external git/hg executables to work."
	optfeature "Git support" dev-vcs/git
	optfeature "Mercurial support" dev-vcs/mercurial
}
