cmake_minimum_required(VERSION 3.20)
project("GLFW-Native")

include(BeefLibSetupHelper/Helper.cmake)
include(FetchContent)

SetOption(GLFW_BUILD_DOCS OFF)
SetOption(GLFW_INSTALL OFF)
SetOption(GLFW_BUILD_EXAMPLES OFF)
SetOption(GLFW_BUILD_TESTS OFF)

FetchContent_Declare(
    glfw
    GIT_REPOSITORY https://github.com/glfw/glfw
    GIT_TAG 3.4
)
FetchContent_MakeAvailable(glfw)

add_custom_target(BuildLib
    DEPENDS glfw
    COMMENT "Building glfw"
)

CopyLibrary(glfw "../dist")