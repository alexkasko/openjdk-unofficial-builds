@echo off

rem unset variables
set LD_LIBRARY_PATH=
set CLASSPATH=
set JAVA_HOME=

rem shortcuts from script directory
set BAD_SLASH_SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%BAD_SLASH_SCRIPT_DIR:\=/%
set UTILS_DIR=%SCRIPT_DIR%utils
set LIBS_DIR=%SCRIPT_DIR%libs
set VC=c:/Program Files/Microsoft Visual Studio 10.0
set WINSDK=c:/Program Files/Microsoft SDKs/Windows/v7.0A

rem utils in path
set MAKE_HOME=%UTILS_DIR%/make
set PATH_PREPEND=%UTILS_DIR%/path_prepend
set CYGWIN_HOME=%UTILS_DIR%/cygwin
set BOOTJDK_HOME=%UTILS_DIR%/bootjdk
set ANT_HOME=%UTILS_DIR%/ant

rem path 
set PATH=%PATH_PREPEND%;C:/WINDOWS/system32;C:/WINDOWS;C:/WINDOWS/System32/Wbem;%MAKE_HOME%;%CYGWIN_HOME%/bin;%BOOTJDK_HOME%/bin;%ANT_HOME%/bin

rem ALT_* varibles
set ALT_BOOTDIR=%BOOTJDK_HOME%
set ALT_COMPILER_PATH=%VC%/VC/Bin
set ALT_WINDOWSSDKDIR=%WINSDK%
set ALT_FREETYPE_LIB_PATH=%LIBS_DIR%/freetype/dist/7_32
set ALT_FREETYPE_HEADERS_PATH=%LIBS_DIR%/freetype/include
set ALT_MSVCRNN_DLL_PATH=%LIBS_DIR%/msvcr/7_32
set ALT_DXSDK_PATH=%LIBS_DIR%/directx
set ALT_CACERTS_FILE=%LIBS_DIR%/cacerts/cacerts
rem set ALT_PARALLEL_COMPILE_JOBS=1
rem set HOTSPOT_BUILD_JOBS=1

rem other openjdk variables
rem set ALLOW_DOWNLOADS=true
rem set NO_DOCS=true

rem other variables
set CYGWIN=nodosfilewarning
set MILESTONE=u6-unofficial
set BUILD_NUMBER=b24

rem set compiler environment
call "%VC%/Common7/Tools/vsvars32.bat"

echo OpenJDK build environment is ready
echo To start build go to sources root and type "make" 
echo JDK binaries will be placed into "<sources_root>\build\windows-i585\j2sdk-image"
bash

echo Press any key to close window ...
pause > nul
