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
set PSDK=c:/Program Files/Microsoft Platform SDK

rem utils in path
set MAKE_HOME=%UTILS_DIR%/make
set PATH_PREPEND=%UTILS_DIR%/path_prepend
set CYGWIN_HOME=%UTILS_DIR%/cygwin
set BOOTJDK_HOME=%SCRIPT_DIR%/../jdk6
set ANT_HOME=%UTILS_DIR%/ant

rem path 
set PATH=%PATH_PREPEND%;C:/WINDOWS/system32;C:/WINDOWS;C:/WINDOWS/System32/Wbem;%MAKE_HOME%;%CYGWIN_HOME%/bin;%BOOTJDK_HOME%/bin;%ANT_HOME%/bin

rem ALT_* varibles
set ALT_BOOTDIR=%BOOTJDK_HOME%
set ALT_COMPILER_PATH=%PSDK%/Bin/win64/x86/AMD64
set ALT_MSDEVTOOLS_PATH=%PSDK%/Bin
set ALT_FREETYPE_LIB_PATH=%LIBS_DIR%/freetype/dist/6_64
set ALT_FREETYPE_HEADERS_PATH=%LIBS_DIR%/freetype/include
set ALT_UNICOWS_LIB_PATH=%LIBS_DIR%/unicows
set ALT_UNICOWS_DLL_PATH=%LIBS_DIR%/unicows
set ALT_MSVCRT_DLL_PATH=%LIBS_DIR%/msvcr/6_64
set ALT_DXSDK_PATH=%LIBS_DIR%/directx
set ALT_CACERTS_FILE=%LIBS_DIR%/cacerts/cacerts

rem other openjdk variables
rem set NO_DOCS=true

rem other variables
set CYGWIN=nodosfilewarning
set MILESTONE=unofficial
set BUILD_NUMBER=b31
set STATIC_CXX=true

rem set compiler environment
call "%PSDK%"/SetEnv.cmd /X64 /RETAIL 

rem uncomment next lines for manual builds
rem echo OpenJDK build environment is ready
rem echo To start build go to sources root and type "make" 
rem echo JDK binaries will be placed into "<sources_root>\build\windows-amd64\j2sdk-image"
rem bash
rem echo Press any key to close window ...
rem pause > nul

set BUILD_FLAVOR=product
set FULL_DEBUG_SYMBOLS=0

rem start obf build
bash %SCRIPT_DIR%/make-and-bundle.sh

rem debug build settings
set BUILD_FLAVOR=debug
set FULL_DEBUG_SYMBOLS=1
set DEBUG_CLASSFILES=true
set ALT_OUTPUTDIR=%SCRIPT_DIR%/../openjdk/build.debug/windows-amd64/

bash %SCRIPT_DIR%/make-and-bundle.sh -d -f
