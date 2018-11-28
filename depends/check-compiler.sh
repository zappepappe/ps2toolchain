#!/bin/sh
# check-gcc.sh by Naomi Peori (naomi@peori.ca)

## Check for compiler.
gcc --version 1> /dev/null || clang --version 1> /dev/null || { echo "ERROR: Install gcc or clang before continuing."; exit 1; }
