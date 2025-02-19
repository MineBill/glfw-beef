cmake_minimum_required(VERSION 3.20)
project("GLFW-Native")

set(CMAKE_DEBUG_POSTFIX d)

macro(set_option option value)
  set(${option} ${value} CACHE "" INTERNAL FORCE)
endmacro()

set_option(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

include(FetchContent)
FetchContent_Declare(
    glfw
    GIT_REPOSITORY https://github.com/glfw/glfw
    GIT_TAG 3.4
)
FetchContent_MakeAvailable(glfw)

add_custom_target(build_libs
    DEPENDS glfw
    COMMENT "Building glfw"
)

add_custom_target(copy_libs ALL
    COMMENT "Copying library files"
)

function(copy_library target destination)
    if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
        set(PLATFORM_SUFFIX "Win64")
    elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(PLATFORM_SUFFIX "Linux64")
    else()
        message(FATAL_ERROR "Unsupported platform: ${CMAKE_SYSTEM_NAME}")
    endif()
    add_custom_command(TARGET copy_libs POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E make_directory "${CMAKE_SOURCE_DIR}/${destination}/$<CONFIG>-${PLATFORM_SUFFIX}"
    COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${target}> "${CMAKE_SOURCE_DIR}/${destination}/$<CONFIG>-${PLATFORM_SUFFIX}"
    COMMENT "Copying ${target} library to ${CMAKE_SOURCE_DIR}/${destination}/$<CONFIG>-${PLATFORM_SUFFIX}"
)
endfunction()

copy_library(glfw "dist")