cmake_minimum_required(VERSION 2.8.10)


set(WITH_OPENSSL "--with-openssl=${LIB__OPENSSL__INCLUDE_DIR}")

set(CONFIGURE_PARAMS_LIST
    # `configure' configures this package to adapt to many kinds of systems.
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
    #   -q, --quiet, --silent   do not print `checking...' messages
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
    #   --libdir=DIR            object code libraries [EPREFIX/lib]
    #   --includedir=DIR        C header files [PREFIX/include]
    #   --oldincludedir=DIR     C header files for non-gcc [/usr/include]
    #   --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]
    #   --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]
    #   --infodir=DIR           info documentation [DATAROOTDIR/info]
    #   --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]
    #   --mandir=DIR            man documentation [DATAROOTDIR/man]
    #   --docdir=DIR            documentation root [DATAROOTDIR/doc/PACKAGE]
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

    #   --target=TARGET   configure for building compilers for TARGET [HOST]
    #
    # Optional Features:
    #   --disable-option-checking  ignore unrecognized --enable/--with options
    #   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
    #   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]

    #   --enable-cmulocal       enable local mods for CMU [[no]]
    "--disable-cmulocal"

    #   --enable-sample         compile sample code [[yes]]
    "--enable-sample=no"

    #   --enable-obsolete_cram_attr
    #                           enable support for cmusaslsecretCRAM-MD5 auxprop
    #                           property [[yes]]
    #   --disable-dependency-tracking  speeds up one-time build
    #   --enable-dependency-tracking   do not reject slow dependency extractors

    #   --enable-static=PKGS  build static libraries default=no
    "--enable-static=yes"

    #   --enable-shared=PKGS  build shared libraries default=yes
    "--enable-shared=no"

    #   --enable-fast-install=PKGS  optimize for fast installation default=yes
    #   --disable-libtool-lock  avoid locking (might break parallel builds)
    #   --enable-staticdlopen   try dynamic plugins when we are a static libsasl [no]

    #   --enable-java           compile Java support [no]
    "--disable-java"

    #   --enable-keep-db-open   keep handle to Berkeley DB open for improved performance [no]
    #   --enable-alwaystrue     enable the alwaystrue password verifier (discouraged)
    #   --enable-checkapop      enable use of sasl_checkapop [yes]

    #   --enable-cram           enable CRAM-MD5 authentication [yes]
    "--disable-cram"

    #   --enable-digest         enable DIGEST-MD5 authentication [yes]
    "--disable-digest"

    #   --enable-scram          enable SCRAM authentication [yes]
    "--disable-scram"

    #   --enable-otp            enable OTP authentication [yes]
    "--disable-otp"

    #   --enable-srp            enable SRP authentication [no]
    "--disable-srp"

    #   --enable-srp-setpass    enable setting SRP secrets with saslpasswd [no]
    "--disable-srp-setpass"

    #   --enable-krb4           enable KERBEROS_V4 authentication [no]
    "--disable-krb4"

    #   --enable-gssapi=<DIR>   enable GSSAPI authentication [yes]
    "--disable-gssapi"

    #   --enable-gss_mutexes     use mutexes around calls to the GSS library

    #   --enable-plain          enable PLAIN authentication yes
    "--disable-plain"

    #   --enable-anon           enable ANONYMOUS authentication [yes]
    "--disable-anon"

    #   --enable-login          enable unsupported LOGIN authentication [no]
    "--disable-login"

    #   --enable-ntlm           enable unsupported NTLM authentication [no]
    "--disable-ntlm"

    #   --enable-passdss        enable PASSDSS authentication (experimental) [no]
    "--disable-passdss"

    #   --enable-sql            enable SQL auxprop [no]
    "--disable-sql"

    #   --enable-ldapdb         enable LDAPDB plugin no
    "--disable-ldapdb"

    #   --disable-macos-framework       disable building and installing replacement SASL2 Framework for MacOS X-provided SASL Framework [no]
    "--disable-macos-framework"

    # 
    # Optional Packages:
    #   --with-PACKAGE[=ARG]    use PACKAGE [ARG=yes]
    #   --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=no)
    # 
    #   --with-gnu-ld           assume the C compiler uses GNU ld default=no
    #   --with-purecov          link with purecov
    #   --with-purify           link with purify
    #   --with-javabase=PATH    set path to find jni.h in /usr/java/include
    #   --with-dbpath=PATH      set the DB path to use /etc/sasldb2
    #   --with-dblib=DBLIB      set the DB library to use berkeley
    #   --with-bdb-libdir=DIR   Berkeley DB lib files are in DIR
    #   --with-bdb-incdir=DIR   Berkeley DB include files are in DIR
    #   --with-gdbm=PATH        use gdbm from PATH
    #   --with-devrandom=PATH   set the path to /dev/random [/dev/random]
    #   --with-pam=DIR          use PAM (rooted in DIR) [yes]

    #   --with-saslauthd=DIR    enable use of the saslauth daemon using state dir DIR
    "--with-saslauthd=no"

    #   --with-authdaemond=PATH enable use of authdaemon with default socket=PATH [yes]
    "--with-authdaemond=no"

    #   --with-pwcheck=DIR     enable deprecated pwcheck daemon using statedir DIR
    #   --with-ipctype={unix,doors}    use ipctype [unix]
    #   --with-lib-subdir=DIR   Find libraries in DIR instead of lib

    #   --with-openssl=PATH     use OpenSSL from PATH
    ${WITH_OPENSSL}

    #   --with-des=DIR          with DES (look in DIR) yes
    "--with-des=no"

    #   --with-opie=PATH        use OPIE (One Time Passwords in Everything) from PATH
    #   --with-gss_impl={heimdal|mit|cybersafe|seam|auto}
    #                           choose specific GSSAPI implementation [[auto]]
    "--with-gss_impl=heimdal"

    #   --with-ldap=DIR         use LDAP (in DIR) for saslauthd no
    "--with-ldap=no"

    #   --with-mysql=PATH       use MySQL from PATH
    "--with-mysql=no"

    #   --with-pgsql=PATH       use PostgreSQL from PATH
    "--with-pgsql=no"

    #   --with-sqlite=PATH       use SQLite from PATH
    "--with-sqlite=no"

    #   --with-sqlite3=PATH       use SQLite3 from PATH
    "--with-sqlite3=no"

    #   --with-plugindir=DIR    set the directory where plugins will
    #                           be found [/usr/lib/sasl2]
    "--with-plugindir=${LIB__SASL__LIBRARY_DIR}/sasl2"

    #    --with-configdir=DIR    set the directory where config files will
    #                           be found /usr/lib/sasl2
    "--with-configdir=${LIB__SASL__LIBRARY_DIR}/sasl2"

    #   --with-rc4              use internal rc4 routines [yes]
    "--with-rc4=yes"

    #   --with-dmalloc=DIR      with DMALLOC support (for test applications) [no]
    "--with-dmalloc=no"

    #   --with-sfio=DIR         with SFIO support (for smtptest/libsfsasl) [no]
    "--with-sfio=no"

    # 
    # Some influential environment variables:
    #   CC          C compiler command
    #   CFLAGS      C compiler flags
    #   LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a
    #               nonstandard directory <lib dir>
    #   LIBS        libraries to pass to the linker, e.g. -l<library>
    #   CPPFLAGS    C/C++/Objective C preprocessor flags, e.g. -I<include dir> if
    #               you have headers in a nonstandard directory <include dir>
    #   CPP         C preprocessor
    # 
    # Use these variables to override the choices made by `configure' or to help
    # it to find libraries and programs with nonstandard names/locations.
)
