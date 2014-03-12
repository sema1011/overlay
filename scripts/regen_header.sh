#!/bin/sh
find /home/sema/Overlay -type f -name '*.ebuild' -print0 | xargs -0 sed -r -e "s/# Copyright [0-9]*.*/# Copyright 1999-$(date +%Y) Gentoo Foundation/" -e 's/.*Header: .*/# $Header: This ebuild is from mva overlay $/' -e 's/EAPI=.*/EAPI="5"/' -i
