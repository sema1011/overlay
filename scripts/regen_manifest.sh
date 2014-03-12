#!/bin/sh

find /home/sema/Overlay -iname '*.ebuild' | \
{ [[ $@ ]] && grep $@ || cat; } | \
xargs -I{} ebuild {} digest
