cmake_minimum_required(VERSION 3.7)

project(utf8)


add_library(${PROJECT_NAME} INTERFACE)

target_include_directories(${PROJECT_NAME} 
	INTERFACE
		${CMAKE_CURRENT_SOURCE_DIR}
)

export(TARGETS ${PROJECT_NAME} FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)
