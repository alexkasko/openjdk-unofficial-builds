@echo off

rem unset variables
set LD_LIBRARY_PATH=
set CLASSPATH=
set JAVA_HOME=

rem shortcuts
set PRQ=v:/openjdkbuild/prerequisites
set VC=c:/Program Files/Microsoft Visual Studio .NET 2003

rem utils in path
set MAKE_HOME=%PRQ%/utils/make/dist
set FIND_HOME=%PRQ%/utils/find
set CYGWIN_HOME=%PRQ%/utils/cygwin
set BOOTJDK_HOME=%PRQ%/utils/bootjdk
set ANT_HOME=%PRQ%/utils/ant

rem path 
set PATH=C:/WINDOWS/system32;C:/WINDOWS;C:/WINDOWS/System32/Wbem;%MAKE_HOME%;%FIND_HOME%;%CYGWIN_HOME%/bin;%BOOTJDK_HOME%/bin;%ANT_HOME%/bin

rem ALT_* varibles
set ALT_BOOTDIR=%BOOTJDK_HOME%
set ALT_COMPILER_PATH=%VC%/VC7/Bin
rem set ALT_COMPILER_PATH=C:/Program Files/Microsoft Visual Studio .NET 2003/Vc7/bin
set ALT_MSDEVTOOLS_PATH=%VC%/Common7/Tools/Bin
set ALT_FREETYPE_LIB_PATH=%PRQ%/libs/freetype/dist
set ALT_FREETYPE_HEADERS_PATH=%PRQ%/libs/freetype/include
set ALT_UNICOWS_LIB_PATH=%PRQ%/libs/unicows
set ALT_UNICOWS_DLL_PATH=%PRQ%/libs/unicows
set ALT_MSVCRT_DLL_PATH=%PRQ%/libs/msvcr
set ALT_MSVCR71_DLL_PATH=%PRQ%/libs/msvcr
set ALT_DXSDK_PATH=%PRQ%/libs/directx
set ALT_DROPS_DIR=%PRQ%/jdk6_drops
rem set ALT_PARALLEL_COMPILE_JOBS=1
rem set HOTSPOT_BUILD_JOBS=1
set ALT_CACERTS_FILE=%PRQ%/libs/cacerts/cacerts

rem other openjdk variables
set ALLOW_DOWNLOADS=false
set UNLIMITED_CRYPTO=true
rem set NO_DOCS=true

rem other variables
set CYGWIN=nodosfilewarning
set MILESTONE=unofficial
set BUILD_NUMBER=b27

rem set compiler environment
call "%VC%/Common7/Tools/vsvars32.bat"

echo OpenJDK build environment is ready
echo To start build type 'cd jdk6' (or 'jdk7'), then type 'make' 
bash

echo Press any key to close window ...
pause > nul
