# Glfw-Beef
**glfw-beef** is a Beef wrapper library for **GLFW 3.4**. Functions that return cstring are converted to return void and take String as a buffer to what the actuall return value will be appended.

You can find an example in the [example](./example) folder.

**Note:** When passing delegates to callbacks you must allocate them on heap and not on stack.
**Note:** Native access is only partially implemented.

## Building
This library uses a [`Setup`](https://www.beeflang.org/docs/packman/#package-manager-overview) program to build the native library using CMake. 

The following dependencies are required for the `Setup` program to function correctly:
* CMake
* A C compiler