using System;
using System.Interop;

namespace GLFW {
	static class Glfw {
		// Constants

		public const c_int DONT_CARE = -1;
		public const c_int TRUE = 1;
		public const c_int FALSE = 0;

		// Enums

		public enum Platform {
			Any     = 0x00060000,
			Win32   = 0x00060001,
			Cocoa   = 0x00060002,
			Wayland = 0x00060003,
			X11     = 0x00060004,
			Null    = 0x00060005
		}

		public enum AnglePlatformType {
			None     = 0x00037001,
			OpenGL   = 0x00037002,
			OpenGLES = 0x00037003,
			D3D9     = 0x00037004,
			D3D11    = 0x00037005,
			Vulkan   = 0x00037007,
			Metal    = 0x00037008
		}

		public enum Wayland {
			PreferLibdecor = 0x00038001,
			DisableLibdecor = 0x00038002,
		}

		public enum ClientApi {
			OpenGlApi = 0x00030001,
			OpenGlEsApi = 0x00030002,
			NoApi = 0
		}

		public enum ContextCreationApi {
			NativeApi = 0x00036001,
			EglApi = 0x00036002,
			OsmesaApi = 0x00036003
		}

		public enum OpenGlProfile {
			CoreProfile = 0x00032001,
			CompatProfile = 0x00032002,
			AnyProfile = 0
		}

		public enum ContextRobustness {
			NoResetNotification = 0x00031001,
			LoseContextOnReset = 0x00031002,
			NoRobustness = 0
		}

		public enum ContextReleaseBehavior {
			Any = 0,
			Flush = 0x00035001,
			None = 0x00035002
		}

		/// Error codes.
		public enum Error {
			/// No error has occurred.
			NoError = 0,
			/// GLFW has not been initialized.
			NotInitialized = 0x00010001,
			/// No context is current for this thread.
			NoCurrentContext = 0x00010002,
			/// One of the arguments to the function was an invalid enum value.
			InvalidEnum = 0x00010003,
			/// One of the arguments to the function was an invalid value.
			InvalidValue = 0x00010004,
			/// A memory allocation failed.
			OutOfMemory = 0x00010005,
			/// GLFW could not find support for the requested API on the system.
			ApiUnavailable = 0x00010006,
			/// The requested OpenGL or OpenGL ES version is not available.
			VersionUnavailable = 0x00010007,
			/// A platform-specific error occurred that does not match any of the more specific categories.
			PlatformError = 0x00010008,
			/// The requested format is not supported or available.
			FormatUnavailable = 0x00010009,
			/// The specified window does not have an OpenGL or OpenGL ES context.
			NoWindowContext = 0x0001000A,
			/// The requested feature is not provided by the platform.
			FeatureUnavailable = 0x0001000C,
			/// The requested feature is not implemented for the platform.
			FeatureUnimplemented = 0x0001000D,
			/// Platform unavailable or no matching platform was found.
			PlatformUnavailable = 0x0001000E
		}

		/// Initialization hints are set before Init and affect how the library behaves until termination.
		public enum InitHint {
			/// Specifies whether to also expose joystick hats as buttons, for compatibility with earlier versions of GLFW that did not have glfwGetJoystickHats. Possible values are true and false.
			JoystickHatButtons = 0x00050001,
			// ANGLE rendering backend init hint.
			AnglePlatformType = 0x00050002,
			/// Specifies whether to set the current directory to the application to the Contents/Resources subdirectory of the application's bundle, if present.
			CocoaChdirResources = 0x00051001,
			/// Specifies whether to create a basic menu bar, either from a nib or manually, when the first window is created, which is when AppKit is initialized.
			CocoaMenuBar = 0x00051002,
			/// Specifies the platform to use for windowing and input.
			/// The default value is Platform.Any, which will choose any platform the library includes support for except for the Null backend.
			Platform = 0x00050003,
			WaylandLibdecor = 0x00053001
		}
	}
}
