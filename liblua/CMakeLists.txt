cmake_minimum_required(VERSION 3.7)

project(liblua)


add_library(${PROJECT_NAME} SHARED
    lapi.c lcode.c lctype.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c 
    lmem.c lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c 
    ltm.c lundump.c lvm.c lzio.c
    lauxlib.c lbaselib.c lbitlib.c lcorolib.c ldblib.c liolib.c
    lmathlib.c loslib.c lstrlib.c ltablib.c lutf8lib.c loadlib.c linit.c
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_definitions(${PROJECT_NAME}
    PRIVATE
        -DLUA_USE_POSIX 
        -DLUA_USE_DLOPEN
)

target_compile_options(${PROJECT_NAME}
    PRIVATE
        -std=gnu99
)


set_target_properties(${PROJECT_NAME} PROPERTIES
    PREFIX ""
)

export(TARGETS ${PROJECT_NAME} FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)

