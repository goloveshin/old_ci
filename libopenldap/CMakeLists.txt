cmake_minimum_required(VERSION 3.7)

project(libopenldap)


set(INSTALL_DIR ${PROJECT_INSTALL_DIR}/${PROJECT_NAME})
set(EXTERNAL_PROJECT_NAME "${PROJECT_NAME}_${EXTERNAL_PROJECT_EXT}")
set(PREFIX_DIR ${CMAKE_CURRENT_BINARY_DIR})
set(BINARY_DIR ${PREFIX_DIR}/src/${EXTERNAL_PROJECT_NAME})
set(EXTERNAL_INSTALL_DIR ${PREFIX_DIR}/install)

# параметры для configure: ${CONFIGURE_PARAMS_LIST}
set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
include(configure)

ExternalProject_Add(${EXTERNAL_PROJECT_NAME}
    DEPENDS
        libopenssl_1_0_x
        libsasl

    PREFIX
        ${PREFIX_DIR}

    #--Download step--------------
    URL
        ${CMAKE_CURRENT_SOURCE_DIR}/src/openldap-2.4.45.tgz

    #--Update/Patch step----------
    PATCH_COMMAND
        patch -p1 -t -N < ${CMAKE_CURRENT_SOURCE_DIR}/src/0001-fix_cross_strip.patch
        && patch -p1 -t -N < ${CMAKE_CURRENT_SOURCE_DIR}/src/0002-fix-bignum.patch
        && patch -p1 -t -N < ${CMAKE_CURRENT_SOURCE_DIR}/src/0003-disable-docs.patch
        && patch -p0 -t -N < ${CMAKE_CURRENT_SOURCE_DIR}/src/build.patch
        && autoconf

    #--Configure step-------------
    CONFIGURE_COMMAND
        export "APPEND_CFLAGS=-I${LIB__OPENSSL__INCLUDE_DIR} -I${LIB__SASL__INCLUDE_DIR}"
        && export "APPEND_CPPFLAGS=-I${LIB__OPENSSL__INCLUDE_DIR} -I${LIB__SASL__INCLUDE_DIR}"
        && export "APPEND_LDFLAGS=-L${LIB__OPENSSL__LIBRARY_DIR} -L${LIB__SASL__LIBRARY_DIR}"
        && . ${CMAKE_BINARY_DIR}/env_wrapper.sh
        && ./configure ${CONFIGURE_PARAMS_LIST}
        && sed -ie "s!^#define NEED_MEMCMP_REPLACEMENT!//#define NEED_MEMCMP_REPLACEMENT!" "./include/portable.h"

    #--Build step-----------------
    BINARY_DIR ${BINARY_DIR}
    BUILD_COMMAND
        . ${CMAKE_BINARY_DIR}/env_wrapper.sh
        && make depend -j${EXTERNAL_PROJECT_JOBS}
        && make -j${EXTERNAL_PROJECT_JOBS}

    #--Install step---------------
    INSTALL_COMMAND
        . ${CMAKE_BINARY_DIR}/env_wrapper.sh
        && make install -j${EXTERNAL_PROJECT_JOBS}
)

add_custom_target(${PROJECT_NAME} ALL)

add_dependencies(${PROJECT_NAME} ${EXTERNAL_PROJECT_NAME})

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND
        ${CMAKE_COMMAND} -E make_directory ${INSTALL_DIR}
        && rsync -r --checksum ${EXTERNAL_INSTALL_DIR}/include ${INSTALL_DIR}
        && rsync -r --checksum ${EXTERNAL_INSTALL_DIR}/lib ${INSTALL_DIR}
        && cd ${INSTALL_DIR} && find . -type f -name '*.la' -delete
    COMMENT "Make install for ${PROJECT_NAME}"
)

add_library(${PROJECT_NAME}_interface INTERFACE)

add_dependencies(${PROJECT_NAME}_interface ${PROJECT_NAME})

target_include_directories(${PROJECT_NAME}_interface
    INTERFACE
        ${INSTALL_DIR}/include
)

target_link_libraries(${PROJECT_NAME}_interface
    INTERFACE 
        ${INSTALL_DIR}/lib/libldap.a
        ${INSTALL_DIR}/lib/libldap_r.a
        ${INSTALL_DIR}/lib/liblber.a
)

# TODO маразм
set(LIB__OPENLDAP__INCLUDE_DIR ${INSTALL_DIR}/include PARENT_SCOPE)
set(LIB__OPENLDAP__LIBRARY_DIR ${INSTALL_DIR}/lib PARENT_SCOPE)

export(TARGETS ${PROJECT_NAME}_interface FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)
