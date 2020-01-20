cmake_minimum_required(VERSION 3.7)

project(jsoncpp)


file(GLOB FILES_SRC *.cpp)

add_library(${PROJECT_NAME} STATIC ${FILES_SRC})

target_include_directories(${PROJECT_NAME} 
	PRIVATE
		${CMAKE_CURRENT_SOURCE_DIR}
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# для API=17 и т.п. - проблемы с float_t в <cmath>
target_include_directories(${PROJECT_NAME} BEFORE
	PRIVATE
		${ANDROID_NDK}/sources/android/support/include
)

target_compile_definitions(${PROJECT_NAME}
    PUBLIC
        -DJSONCPP_NO_LOCALE_SUPPORT=1
)

export(TARGETS ${PROJECT_NAME} FILE ${PROJECT_INSTALL_DIR}/${PROJECT_NAME}.cmake)
