cmake_minimum_required(VERSION 3.7)

project(libopenssl_1_0_x)


if(ARM64_V8A)
    set(ARCH_STRING "android")
else()
    set(ARCH_STRING "android-armv7")
endif()

set(INSTALL_DIR ${PROJECT_INSTALL_DIR}/${PROJECT_NAME})
set(EXTERNAL_PROJECT_NAME "${PROJECT_NAME}_${EXTERNAL_PROJECT_EXT}")
set(PREFIX_DIR ${CMAKE_CURRENT_BINARY_DIR})
set(BINARY_DIR ${PREFIX_DIR}/src/${EXTERNAL_PROJECT_NAME})
set(EXTERNAL_INSTALL_DIR ${PREFIX_DIR}/install)

ExternalProject_Add(${EXTERNAL_PROJECT_NAME}
    PREFIX
        ${PREFIX_DIR}

    #--Download step--------------
    URL
        ${CMAKE_CURRENT_SOURCE_DIR}/src/openssl-1.0.2j.tar.gz

    #--Update/Patch step----------
    PATCH_COMMAND
        patch -p1 -t -N < ${CMAKE_CURRENT_SOURCE_DIR}/src/no_doc.patch
        && patch -p1 -t -N < ${CMAKE_CURRENT_SOURCE_DIR}/src/Configure.patch

    #--Configure step-------------
    CONFIGURE_COMMAND
        . ${CMAKE_BINARY_DIR}/env_wrapper.sh
        && export ANDROID_DEV=${SYSROOT}/usr
        && export ANDROID_LLVM_TRIPLE=${ANDROID_LLVM_TRIPLE}
        && ./Configure ${ARCH_STRING} no-asm no-shared -Wl,-pie --sysroot=${SYSROOT} --gcc-toolchain=${ANDROID_TOOLCHAIN_ROOT} --prefix=${EXTERNAL_INSTALL_DIR}
        # в OpenSSL все через жопу: окружения env_wrapper.sh ей мало - извольте выставить sysroot и другое прямо сюда

    #--Build step-----------------
    BINARY_DIR ${BINARY_DIR}
    BUILD_COMMAND
        . ${CMAKE_BINARY_DIR}/env_wrapper.sh
        && export ANDROID_DEV=${SYSROOT}/usr
        && export ANDROID_LLVM_TRIPLE=${ANDROID_LLVM_TRIPLE}
        && make depend -j${EXTERNAL_PROJECT_JOBS}
        && make all -j${EXTERNAL_PROJECT_JOBS}

    #--Install step---------------
    INSTALL_COMMAND
        . ${CMAKE_BINARY_DIR}/env_wrapper.sh
        && export ANDROID_DEV=${SYSROOT}/usr
        && export ANDROID_LLVM_TRIPLE=${ANDROID_LLVM_TRIPLE}
        && make install -j${EXTERNAL_PROJECT_JOBS}
)

add_custom_target(${PROJECT_NAME} ALL)

add_dependencies(${PROJECT_NAME} ${EXTERNAL_PROJECT_NAME})

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND
        ${CMAKE_COMMAND} -E make_directory ${INSTALL_DIR}
        && rsync -r --checksum ${EXTERNAL_INSTALL_DIR}/bin ${INSTALL_DIR}
        && rsync -r --checksum ${EXTERNAL_INSTALL_DIR}/include ${INSTALL_DIR}
        && rsync -r --checksum ${EXTERNAL_INSTALL_DIR}/lib ${INSTALL_DIR}
        && cd ${INSTALL_DIR} && find . -type f -name '*.la' -delete
        && cd ${INSTALL_DIR} && find . -type f -name 'c_rehash' -delete
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
        ${INSTALL_DIR}/lib/libssl.a
        ${INSTALL_DIR}/lib/libcrypto.a
)

# TODO маразм
set(LIB__OPENSSL__INCLUDE_DIR ${INSTALL_DIR}/include PARENT_SCOPE)
set(LIB__OPENSSL__LIBRARY_DIR ${INSTALL_DIR}/lib PARENT_SCOPE)

export(TARGETS ${PROJECT_NAME}_interface FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)
