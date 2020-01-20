cmake_minimum_required(VERSION 3.7)


set(CONFIGURE_PARAMS_LIST
    # `configure' configures zeromq 4.2.2 to adapt to many kinds of systems.
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
   --prefix=${EXTERNAL_INSTALL_DIR}

    #   --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX
    #                           [PREFIX]
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
    #   --libdir=DIR            object code libraries [EPREFIX/lib]
    #   --includedir=DIR        C header files [PREFIX/include]
    #   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
    #   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
    #   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
    #   --infodir=DIR           info documentation [DATAROOTDIR/info]
    #   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
    #   --mandir=DIR            man documentation [DATAROOTDIR/man]
    #   --docdir=DIR            documentation root [DATAROOTDIR/doc/zeromq]
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
    #
    "--host=arm-linux-androideabi"

    # Optional Features:
    #   --disable-option-checking  ignore unrecognized --enable/--with options
    #   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
    #   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
    #   --enable-silent-rules   less verbose build output (undo: "make V=1")
    #   --disable-silent-rules  verbose build output (undo: "make V=0")
    #   --enable-dependency-tracking
    #                           do not reject slow dependency extractors
    #   --disable-dependency-tracking
    #                           speeds up one-time build
    #   --enable-code-coverage  Whether to enable code coverage support
    #   --enable-static[=PKGS]  build static libraries [default=no]
    #   --enable-shared[=PKGS]  build shared libraries [default=yes]
    "--enable-shared=no"
    "--enable-static=yes"

    #   --enable-fast-install[=PKGS]
    #                           optimize for fast installation [default=yes]
    #   --disable-libtool-lock  avoid locking (might break parallel builds)
    #   --enable-valgrind       Whether to enable Valgrind on the unit tests
    #   --enable-debug          enable debugging information [default=disabled]
    #   --disable-pedantic      disable pedantic compiler checks [default=enabled]
    #   --disable-eventfd       disable eventfd [default=enabled]
    #   --disable-perf          don't build performance measurement tools
    #                           [default=build]
    "--disable-perf"

    #   --disable-curve-keygen  don't build curve-keygen tool [default=build]
    #   --disable-curve         disable CURVE security [default=no]
    #   --enable-drafts         Build and install draft classes and methods
    #                           [default=yes]
    #
    # Optional Packages:
    #   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
    #   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
    #   --with-gcov=GCOV        use given GCOV for coverage (GCOV=gcov).
    #   --with-pic[=PKGS]       try to use only PIC/non-PIC objects [default=use
    #                           both]
    #   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
    #   --with-sysroot=DIR Search for dependent libraries within DIR
    #                         (or the compiler's sysroot if not specified).
    #   --with-gcov=yes/no      with GCC Code Coverage reporting.
    #   --with-militant         enable militant API assertions
    #   --without-docs          Don't build and install man pages [default=build]
    #   --without-documentation Don't build and install man pages [default=build]
    #                           DEPRECATED: use --without-docs
    #   --with-poller           choose polling system manually. Valid values are
    #                           'kqueue', 'epoll', 'devpoll', 'pollset', 'poll',
    #                           'select', or 'auto'. [default=auto]
    #   --with-libgssapi_krb5   require libzmq build with libgssapi_krb5
    #                           [default=no]
    #   --with-libsodium        use libsodium instead of built-in tweetnacl
    #                           [default=no]
    #   --with-pgm              build libzmq with PGM extension. Requires pkg-config
    #                           [default=no]
    #   --with-norm             build libzmq with NORM protocol extension,
    #                           optionally specifying norm path [default=no]
    #   --with-vmci             build libzmq with VMCI transport [default=no]
    #   --with-pkgconfigdir=PATH
    #                           Path to the pkgconfig directory [[LIBDIR/pkgconfig]]
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
    #   PKG_CONFIG  path to pkg-config utility
    #   PKG_CONFIG_PATH
    #               directories to add to pkg-config's search path
    #   PKG_CONFIG_LIBDIR
    #               path overriding pkg-config's built-in search path
    #   XMLTO       path to xmlto command
    #   ASCIIDOC    path to asciidoc command
    #   CPP         C preprocessor
    #   CXXCPP      C++ preprocessor
    #   sodium_CFLAGS
    #               C compiler flags for sodium, overriding pkg-config
    #   sodium_LIBS linker flags for sodium, overriding pkg-config
    #   pgm_CFLAGS  C compiler flags for pgm, overriding pkg-config
    #   pgm_LIBS    linker flags for pgm, overriding pkg-config
    #   LIBUNWIND_CFLAGS
    #               C compiler flags for LIBUNWIND, overriding pkg-config
    #   LIBUNWIND_LIBS
    #               linker flags for LIBUNWIND, overriding pkg-config
    #
    # Use these variables to override the choices made by `configure' or to help
    # it to find libraries and programs with nonstandard names/locations.
    #
    # Report bugs to <zeromq-dev@lists.zeromq.org>.
)
