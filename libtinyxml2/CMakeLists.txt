cmake_minimum_required(VERSION 3.7)

project(libtinyxml2)


file(GLOB FILES_SRC *.cpp)

add_library(${PROJECT_NAME} STATIC ${FILES_SRC})

target_include_directories(${PROJECT_NAME} 
	PUBLIC
		${CMAKE_CURRENT_SOURCE_DIR}
)

export(TARGETS ${PROJECT_NAME} FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)
