cmake_minimum_required(VERSION 3.7)

project(libsqlite)


add_library(${PROJECT_NAME} STATIC sqlite3.c)

target_include_directories(${PROJECT_NAME} 
    PUBLIC
    	${CMAKE_CURRENT_SOURCE_DIR}
)

set_target_properties(${PROJECT_NAME} PROPERTIES
	PREFIX ""
)

export(TARGETS ${PROJECT_NAME} FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)
