# Copyright 2015-2018 Jan Chren (rindeal)
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit versionator desktop xdg

DESCRIPTION="Git client with support for GitHub Pull Requests+Comments, SVN and Mercurial"
HOMEPAGE="https://www.syntevo.com/smartgit/"
KEYWORDS="~amd64 ~x86"
IUSE=""

SLOT="0"

SRC_URI_A=(
	"https://www.syntevo.com/downloads/${PN}/${PN}-linux-${PV//./_}.tar.gz"
	"https://www.syntevo.com/downloads/${PN}/archive/${PN}-linux-${PV//./_}.tar.gz"
)


RDEPEND_A=(
	# SmartGit can be started with Java 9 if smartgit.startup.allowJava9=true is set
	"virtual/jre:1.8"
)

RESTRICT="fetch"

#inherit arrays

S="${WORKDIR}/${PN}"

src_prepare() {
	eapply_user

	use system-jre && NO_V=1 rrm -r jre
}

src_install() {
	local -r VENDOR="syntevo"
	local -r install_dir="/opt/${VENDOR}/${PN_SLOTTED}"

	## copy files to the install image
	rmkdir "${ED}/${install_dir}"
	NO_V=1 rcp -r . "${ED}/${install_dir}"

	## install icons
	local s
	for s in 32 48 64 128 256 ; do
		newicon -s ${s} "bin/${PN}-${s}.png" "${PN_SLOTTED}.png"
	done

	## make scripts executable
	rchmod a+x "${ED%/}${install_dir}/"{bin,lib}/*.sh

	## install symlink to /usr/bin
	dosym "${install_dir}/bin/${PN}.sh" "/usr/bin/${PN_SLOTTED}"

	## generate .desktop entry
	local make_desktop_entry_args=(
		"${PN_SLOTTED} %U"  # exec
		"SmartGit ${SLOT}"  # name
		"${PN_SLOTTED}"     # icon
		"Development"       # categories
	)
	local make_desktop_entry_extras=(
	)
	make_desktop_entry "${make_desktop_entry_args[@]}" \
		"$( printf '%s\n' "${make_desktop_entry_extras[@]}" )"
}

pkg_postinst() {
	xdg_pkg_postinst

	elog "${PN} relies on external git/hg executables to work."
	optfeature "Git support" dev-vcs/git
	optfeature "Mercurial support" dev-vcs/mercurial
}
