#!/bin/sh
# check-make.sh by Naomi Peori (naomi@peori.ca)

## Check for GNU Make.
$GNUMAKE -v 1> /dev/null || { echo "ERROR: Install GNU Make before continuing."; exit 1; }
