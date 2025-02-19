using System;
using System.Interop;
namespace GLFW;

typealias GlfwAllocateFun   = function void*(c_size size, void* user);
typealias GlfwReallocateFun = function void*(void* block, c_size size, void* user);
typealias GlfwDeallocateFun = function void(void* block, void* user);

[CRepr]
struct GlfwAllocator
{
	public GlfwAllocateFun Allocate;
	public GlfwReallocateFun Reallocate;
	public GlfwDeallocateFun Deallocate;
}