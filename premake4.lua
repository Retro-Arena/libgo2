#!lua
local output = "./build/" .. _ACTION

solution "go2_solution"
   configurations { "Debug", "Release" }

project "go2"
   location (output)
   kind "SharedLib"
   language "C"
   files { "src/**.h", "src/**.c" }
   buildoptions { "-Wall" }
   linkoptions { "-lEGL -lGLESv2 -levdev -lgbm -lpthread -ldrm -lm" }
   includedirs { "/usr/include/libdrm" }

   configuration "Debug"
      flags { "Symbols" }
      defines { "DEBUG" }

   configuration "Release"
      flags { "Optimize" }
      defines { "NDEBUG" }
