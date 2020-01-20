
cmake_minimum_required(VERSION 3.7)

project(liblinenoise)


add_library(${PROJECT_NAME} STATIC linenoise.c)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}
)


#target_compile_options(${PROJECT_NAME}
#    PRIVATE
#        -std=gnu99
#)


set_target_properties(${PROJECT_NAME} PROPERTIES
    PREFIX ""
)

export(TARGETS ${PROJECT_NAME} FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)

