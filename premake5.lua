project "GLFW"
	kind "StaticLib"
	language "C"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",

		"src/internal.h",
		"src/platform.h",
		"src/mappings.h",

		"src/context.c",
		"src/init.c",
		"src/input.c",
		"src/monitor.c",
		"src/platform.c",
		"src/vulkan.c",
		"src/window.c",

		"src/null_platform.h",
		"src/null_joystick.h",
		"src/null_init.c",
		"src/null_monitor.c",
		"src/null_window.c",
		"src/null_joystick.c",

		"src/glfw_config.h",
	}

	filter "system:linux"
		pic "On"

		systemversion "latest"
		
		files
		{
			"src/x11_platform.h",
			"src/xkb_unicode.h",
			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/xkb_unicode.c",

			"src/glx_context.c",

			"src/posix_time.h",
			"src/posix_thread.h",
			"src/posix_module.c",
			"src/posix_time.c",
			"src/posix_thread.c",
			
			
			"src/egl_context.c",
			"src/osmesa_context.c",
			"src/linux_joystick.c"
		}

		defines
		{
			"_GLFW_X11"
		}

	filter "system:macosx"
		files {
			"src/cocoa_time.h",
			"src/cocoa_time.c",
			"src/posix_thread.h",
			"src/posix_module.c",
			"src/posix_thread.c",

			"src/cocoa_platform.h",
			"src/cocoa_joystick.h",
			"src/cocoa_window.m",
			"src/cocoa_init.m",
			"src/cocoa_joystick.m",
			"src/cocoa_monitor.m",
			"src/nsgl_context.m",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}

        systemversion "11.6.5"

		links {
			"Cocoa.framework",
			"IOKit.framework",
			"CoreFoundation.framework"
		}

		defines
		{
			"_GLFW_COCOA"
		}

	filter "system:windows"
		systemversion "latest"

		files
		{
			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_module.c",
			"src/win32_monitor.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c",
			"src/egl_context.c",
			"src/osmesa_context.c"
		}

		defines 
		{ 
			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

		links
		{
			"Dwmapi.lib"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
