cmake_minimum_required(VERSION 2.6)

set(CMAKE_MODULE_PATH
    "${CMAKE_CURRENT_SOURCE_DIR}/core/modules/"
    "${CMAKE_CURRENT_SOURCE_DIR}/qt/modules/")

add_subdirectory(core)
add_subdirectory(qt)
add_subdirectory(sdl)
add_subdirectory(plugins)
add_subdirectory(plugins-nonfree)

if(BUILD_TESTS)
    enable_testing()
endif()
