#!/usr/bin/env bash

if ! [[ -d src ]]; then
	cp ../{src,assets} . -R
	cp ../main.lua .
	cp terrain.lua src
fi

love . $@
