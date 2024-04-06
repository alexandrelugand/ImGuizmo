local _files =
{
	"ImCurveEdit.cpp",
	"ImCurveEdit.h",
	"ImGradient.cpp",
	"ImGradient.h",
	"ImGuizmo.cpp",
	"ImGuizmo.h",
	"ImSequencer.cpp",
	"ImSequencer.h"
}

local _includedirs =
{
	".",
	"../ImGui"
}

group "Dependencies"
	project "ImGuizmo"
		kind "StaticLib"
		language "C++"
		cppdialect "C++20"
		staticruntime "off"
		architecture "x64"
		targetdir ("%{wks.location}/bin/" .. outputdir)
		objdir ("%{wks.location}/bin-int/" .. tmpdir)

		files(_files)
		includedirs(_includedirs)

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			runtime "Debug"
			symbols "on"
			optimize "Off"

		filter "configurations:Release"
			runtime "Release"
			optimize "full"

group "Browser/Dependencies"
	project "ImGuizmo.Web"
		kind "StaticLib"
		targetname "ImGuizmo"
		targetextension ".a"
		language "C++"
		cppdialect "C++20"
		staticruntime "off"
		architecture "x64"
		targetdir ("%{wks.location}/bin/" .. outputdirweb)
		objdir ("%{wks.location}/bin-int/" .. tmpdirweb)

		files(_files)
		includedirs(_includedirs)

		filter "system:windows"
			systemversion "latest"

		filter "configurations:Debug"
			runtime "Debug"
			symbols "on"
			optimize "Off"

		filter "configurations:Release"
			runtime "Release"
			optimize "full"

group ""
