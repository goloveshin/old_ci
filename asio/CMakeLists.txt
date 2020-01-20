cmake_minimum_required(VERSION 3.7)

project(asio)


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

    PREFIX
        ${PREFIX_DIR}

    #--Download step--------------
    URL
        # 1.10.8
        ${CMAKE_CURRENT_SOURCE_DIR}/src/asio-asio-1-10-8.tar.gz
        # 1.12.0 - падает в шедулере
#        ${CMAKE_CURRENT_SOURCE_DIR}/src/asio-asio-1-12-0.tar.gz

    #--Update/Patch step----------
    PATCH_COMMAND
        # 1.10.8
        patch -p1 -t -N < ${CMAKE_CURRENT_SOURCE_DIR}/src/ambiguous.patch
        # 1.12.0 - падает в шедулере
#        # убрали -lrt
#        ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/src/configure.ac ${BINARY_DIR}/asio

    #--Configure step-------------
    CONFIGURE_COMMAND
        . ${CMAKE_BINARY_DIR}/env_wrapper.sh
        && cd asio/
        && aclocal
        && automake --add-missing
        && automake
        && autoconf
        && ./configure ${CONFIGURE_PARAMS_LIST}

    #--Build step-----------------
    BINARY_DIR ${BINARY_DIR}
    BUILD_COMMAND
        . ${CMAKE_BINARY_DIR}/env_wrapper.sh
        && cd asio/
        && make -j${EXTERNAL_PROJECT_JOBS}

    #--Install step---------------
    INSTALL_COMMAND
        . ${CMAKE_BINARY_DIR}/env_wrapper.sh
        && cd asio/
        && make install -j${EXTERNAL_PROJECT_JOBS}
)

add_custom_target(${PROJECT_NAME} ALL)

add_dependencies(${PROJECT_NAME} ${EXTERNAL_PROJECT_NAME})

add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
    COMMAND
        ${CMAKE_COMMAND} -E make_directory ${INSTALL_DIR}
        && rsync -r --checksum ${EXTERNAL_INSTALL_DIR}/include ${INSTALL_DIR}
    COMMENT "Make install for ${PROJECT_NAME}"
)

add_library(${PROJECT_NAME}_interface INTERFACE)

add_dependencies(${PROJECT_NAME}_interface ${PROJECT_NAME})

target_include_directories(${PROJECT_NAME}_interface
    INTERFACE
        ${INSTALL_DIR}/include
)

# должны совпадать с CPPFLAGS в configure.cmake
target_compile_definitions(${PROJECT_NAME}_interface
    INTERFACE
        -DASIO_STANDALONE
        -DASIO_DISABLE_THREADS
        -DASIO_DISABLE_SMALL_BLOCK_RECYCLING
)

export(TARGETS ${PROJECT_NAME}_interface FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)

