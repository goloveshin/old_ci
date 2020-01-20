#
# Copyright(c) 2015 Ruslan Baratov.
# Distributed under the MIT License (http://opensource.org/licenses/MIT)
#

cmake_minimum_required(VERSION 3.1)
project(spdlog VERSION 1.0.0)

add_library(spdlog INTERFACE)

target_include_directories(${PROJECT_NAME}
    INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

export(TARGETS ${PROJECT_NAME} FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)
