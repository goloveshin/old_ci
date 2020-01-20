#!/bin/bash

# Warnings about unused DT entries

# Starting from 5.1 the Android linker warns about VERNEED (0x6FFFFFFE) and VERNEEDNUM (0x6FFFFFFF) ELF dynamic sections:

# WARNING: linker: $BINARY: unused DT entry: type 0x6ffffffe arg ...
# WARNING: linker: $BINARY: unused DT entry: type 0x6fffffff arg ...

# These may come from version scripts in a Makefile such as:

# -Wl,--version-script=$(top_srcdir)/proc/libprocps.sym

# The termux-elf-cleaner utilty is run from build-package.sh and should normally take care of that problem.

gcc -std=c++11 -Wall -Wextra -pedantic -Werror termux-elf-cleaner.cpp -o $1
