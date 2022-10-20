function imgui_include()
    local baseFolder = debug.getinfo(1,'S').source:match("^@(.+)/buildSystem/build.lua$")
    includedirs { baseFolder }
end

function imgui_project()
    local baseFolder = debug.getinfo(1,'S').source:match("^@(.+)/buildSystem/build.lua$")

    project "imgui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++14"
    targetdir "%{wks.location}/bin/%{cfg.buildcfg}/%{prj.name}"
    location "%{wks.location}/%{prj.name}"
    exceptionhandling "Off"
    rtti "Off"

    files
    {
        path.join(baseFolder, "imgui.h"),
        path.join(baseFolder, "*.cpp"),
        --path.join(baseFolder, "backends/imgui_impl_glfw.cpp"),
        --path.join(baseFolder, "backends/imgui_impl_opengl2.cpp"),
    }
    
    includedirs
    {
        baseFolder
    }
end