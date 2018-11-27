#!/usr/bin/env bash
# ps2client.sh by Naomi Peori (naomi@peori.ca)
# changed to use Git by Mathias Lafeldt <misfire@debugon.org>

## Download the source code.
if test ! -d "ps2client/.git"; then
	git clone https://github.com/ps2dev/ps2client && cd ps2client || exit 1
else
	cd ps2client &&
		git pull && git fetch origin &&
		git reset --hard origin/master || exit 1
fi

## Build and install.
$GNUMAKE --quiet clean && $GNUMAKE --quiet && $GNUMAKE --quiet install && $GNUMAKE --quiet clean || { exit 1; }
