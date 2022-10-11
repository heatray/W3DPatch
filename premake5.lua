workspace "W3DAnniversaryPatch"
   configurations { "Release", "Debug" }
   platforms { "Win32" }
   architecture "x32"
   location "build"
   -- objdir ("build/obj")
   -- buildlog ("build/log/%{prj.name}.log")
   buildoptions {"-std:c++latest"}

   kind "SharedLib"
   language "C++"
   targetextension ".asi"
   characterset ("UNICODE")
   staticruntime "On"

   files { "source/stdafx.h", "source/stdafx.cpp" }
   files { "source/resources/VersionInfo.rc" }

   includedirs { "source" }
   includedirs { "source/injector" }
   includedirs { "source/inireader" }

   defines {
      "rsc_MajorVersion=22",
      "rsc_MinorVersion=10",
      "rsc_RevisionID=11",
      "rsc_BuildID=1"
   }
   defines {
      "rsc_StringVersion=\"22.10.11.1\"",
      "rsc_InternalName=\"%{prj.name}\"",
      "rsc_ProductName=\"Community Patch\"",
      "rsc_OriginalFilename=\"%{prj.name}.dll\"",
      "rsc_CompanyName=\"heatray\"",
      "rsc_LegalCopyright=\"Copyright (C) heatray\"",
      "rsc_UpdateUrl=\"https://github.com/heatray/W3DPatch/releases\""
   }
   
   filter "configurations:Debug*"
      defines "DEBUG"
      symbols "On"

   filter "configurations:Release*"
      defines "NDEBUG"
      optimize "On"

project "W3D.Patch"
   files { "source/patch.cpp" }

   defines { "rsc_FileDescription=\"Patch for Worms 3D\"" }

project "W3D.Input"
   files { "source/input.cpp" }

   defines { "rsc_FileDescription=\"Input for Worms 3D\"" }

project "W3D.Unlimiter"
   files { "source/unlimiter.cpp" }

   defines { "rsc_FileDescription=\"Unlimiter for Worms 3D\"" }
