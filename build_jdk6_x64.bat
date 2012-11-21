@echo off

rem unset variables
set LD_LIBRARY_PATH=
set CLASSPATH=
set JAVA_HOME=

rem shortcuts from script directory
set BAD_SLASH_SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%BAD_SLASH_SCRIPT_DIR:\=/%
set PRQ=%SCRIPT_DIR%prerequisites
set PSDK=c:/Program Files/Microsoft Platform SDK

rem utils in path
set MAKE_HOME=%PRQ%/utils/make
set PATH_PREPEND=%PRQ%/utils/path_prepend
set CYGWIN_HOME=c:/cygwin
set BOOTJDK_HOME=%PRQ%/utils/bootjdk
set ANT_HOME=%PRQ%/utils/ant

rem path 
set PATH=%PATH_PREPEND%;C:/WINDOWS/system32;C:/WINDOWS;C:/WINDOWS/System32/Wbem;%MAKE_HOME%;%CYGWIN_HOME%/bin;%BOOTJDK_HOME%/bin;%ANT_HOME%/bin

rem ALT_* varibles
set ALT_BOOTDIR=%BOOTJDK_HOME%
set ALT_COMPILER_PATH=%PSDK%/Bin/win64/x86/AMD64
set ALT_MSDEVTOOLS_PATH=%PSDK%/Bin
set ALT_FREETYPE_LIB_PATH=%PRQ%/libs/freetype/dist/6_64
set ALT_FREETYPE_HEADERS_PATH=%PRQ%/libs/freetype/include
set ALT_UNICOWS_LIB_PATH=%PRQ%/libs/unicows
set ALT_UNICOWS_DLL_PATH=%PRQ%/libs/unicows
set ALT_MSVCRT_DLL_PATH=%PRQ%/libs/msvcr/6_64
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
set MILESTONE=b27
set BUILD_NUMBER=unofficial

rem set compiler environment
call "%PSDK%"/SetEnv.cmd /X64 /RETAIL

echo OpenJDK build environment is ready
echo To start build type 'cd jdk6' and 'make' 
bash

echo Press any key to close window ...
pause > nul
