cmake_minimum_required(VERSION 2.8.10)


set(CONFIGURE_PARAMS_LIST
    # `configure' configures libetpan 1.7.2 to adapt to many kinds of systems.
    # 
    # Usage: ./configure [OPTION]... [VAR=VALUE]...
    # 
    # To assign environment variables (e.g., CC, CFLAGS...), specify them as
    # VAR=VALUE.  See below for descriptions of some of the useful variables.
    # 
    # Defaults for the options are specified in brackets.
    # 
    # Configuration:
    #   -h, --help              display this help and exit
    #       --help=short        display options specific to this package
    #       --help=recursive    display the short help of all the included packages
    #   -V, --version           display version information and exit
    #   -q, --quiet, --silent   do not print `checking ...' messages
    #       --cache-file=FILE   cache test results in FILE [disabled]
    #   -C, --config-cache      alias for `--cache-file=config.cache'
    #   -n, --no-create         do not create output files
    #       --srcdir=DIR        find the sources in DIR [configure dir or `..']
    # 
    # Installation directories:
    #   --prefix=PREFIX         install architecture-independent files in PREFIX
    #                           [/usr/local]
    #   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
    #                           [PREFIX]
    "--prefix=${EXTERNAL_INSTALL_DIR}"

    # 
    # By default, `make install' will install all the files in
    # `/usr/local/bin', `/usr/local/lib' etc.  You can specify
    # an installation prefix other than `/usr/local' using `--prefix',
    # for instance `--prefix=$HOME'.
    # 
    # For better control, use the options below.
    # 
    # Fine tuning of the installation directories:
    #   --bindir=DIR            user executables [EPREFIX/bin]
    #   --sbindir=DIR           system admin executables [EPREFIX/sbin]
    #   --libexecdir=DIR        program executables [EPREFIX/libexec]
    #   --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]
    #   --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]
    #   --localstatedir=DIR     modifiable single-machine data [PREFIX/var]
    #   --runstatedir=DIR       modifiable per-process data [LOCALSTATEDIR/run]
    #   --libdir=DIR            object code libraries [EPREFIX/lib]
    #   --includedir=DIR        C header files [PREFIX/include]
    #   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
    #   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
    #   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
    #   --infodir=DIR           info documentation [DATAROOTDIR/info]
    #   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
    #   --mandir=DIR            man documentation [DATAROOTDIR/man]
    #   --docdir=DIR            documentation root [DATAROOTDIR/doc/libetpan]
    #   --htmldir=DIR           html documentation [DOCDIR]
    #   --dvidir=DIR            dvi documentation [DOCDIR]
    #   --pdfdir=DIR            pdf documentation [DOCDIR]
    #   --psdir=DIR             ps documentation [DOCDIR]
    # 
    # Program names:
    #   --program-prefix=PREFIX            prepend PREFIX to installed program names
    #   --program-suffix=SUFFIX            append SUFFIX to installed program names
    #   --program-transform-name=PROGRAM   run sed PROGRAM on installed program names
    # 
    # System types:
    #   --build=BUILD     configure for building on BUILD [guessed]
    #   --host=HOST       cross-compile to build programs to run on HOST [BUILD]
    "--host=arm-linux-androideabi"

    # 
    # Optional Features:
    #   --disable-option-checking  ignore unrecognized --enable/--with options
    #   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
    #   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
    #   --enable-silent-rules   less verbose build output (undo: "make V=1")
    #   --disable-silent-rules  verbose build output (undo: "make V=0")
    #   --enable-maintainer-mode
    #                           enable make rules and dependencies not useful (and
    #                           sometimes confusing) to the casual installer
    #   --enable-dependency-tracking
    #                           do not reject slow dependency extractors
    #   --disable-dependency-tracking
    #                           speeds up one-time build
    #   --enable-debug          setup flags (gcc) for debugging (default=no)
    #   --enable-optim          setup flags (gcc) for optimizations (default=no)
    #   --enable-unstrict-syntax
    #                           be lazy on syntax checking for protocols
    #                           (default=no)

    #   --enable-shared[=PKGS]  build shared libraries [default=yes]
    "--enable-shared=no"

    #   --enable-static[=PKGS]  build static libraries [default=yes]
    "--enable-static=yes"

    #   --enable-fast-install[=PKGS]
    #                           optimize for fast installation [default=yes]
    #   --disable-libtool-lock  avoid locking (might break parallel builds)

    #   --disable-iconv         make a version not using iconv
    "--enable-iconv=yes"

    #   --disable-db            disable Berkeley DB (default=try to detect DB)
    #   --disable-threads       do not include multithreading support using pthread
    #   --enable-windows-threads
    #                           include multithreading support using windows threads
    #   --disable-lockfile      do not use liblockfile for locking mailboxes
    #   --enable-ipv6           enable IPv6 support
    # 
    # Optional Packages:
    #   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
    #   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
    #   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
    #                           both]
    #   --with-aix-soname=aix|svr4|both
    #                           shared library versioning (aka "SONAME") variant to
    #                           provide on AIX, [default=aix].
    #   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
    #   --with-sysroot[=DIR]    Search for dependent libraries within DIR (or the
    #                           compiler's sysroot if not specified).
    # use poll intead of select
    #   --with-openssl=DIR      include OpenSSL support (default=auto)
    #   --with-gnutls=DIR       include GnuTLS support (default=auto)
    #   --with-sasl=DIR         include SASL support (default=auto)
    #   --with-curl=DIR         curl install directory (default=auto)
    #   --with-expat=DIR        expat install directory (default=auto)
    #   --with-zlib             include classes for streaming compressed data in and
    #                           out [default=check]
    # 
    # Some influential environment variables:
    #   CC          C compiler command
    #   CFLAGS      C compiler flags
    #   LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
    #               nonstandard directory <lib dir>
    #   LIBS        libraries to pass to the linker, e.g. -l<library>
    #   CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> if
    #               you have headers in a nonstandard directory <include dir>
    #   CXX         C++ compiler command
    #   CXXFLAGS    C++ compiler flags
    #   LT_SYS_LIBRARY_PATH
    #               User-defined run-time library search path.
    #   CPP         C preprocessor
    #   CXXCPP      C++ preprocessor
    "CFLAGS=$(CFLAGS) -Wno-unused-parameter"
    "CXXFLAGS=$(CXXFLAGS) -Wno-unused-parameter"

    # 
    # Use these variables to override the choices made by `configure' or to help
    # it to find libraries and programs with nonstandard names/locations.
    # 
    # Report bugs to <libetpan-devel@lists.sourceforge.net>.
)
