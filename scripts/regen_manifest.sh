#!/bin/sh

find /home/gentoo/Portage -iname '*.ebuild' | \
{ [[ $@ ]] && grep $@ || cat; } | \
xargs -I{} ebuild {} digest
