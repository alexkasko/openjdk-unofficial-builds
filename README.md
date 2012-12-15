OpenJDK unofficial installers for Windows, Linux and Mac OS X
=============================================================

###Windows downloads

 * **OpenJDK 6 build 27:**
  * [i586 installer](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.6.0-unofficial-b27-windows-i586.zip), sha1: `3333818dcdfb2ca352d16db0fdf0fee12fa3f1a9`
  * [i586 zip](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.6.0-unofficial-b27-windows-i586-image.zip), sha1: `9086e424bb2ab4e4dbdf0527b8b0426a9672dda5`
  * [amd64 installer](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.6.0-unofficial-b27-windows-amd64.zip), sha1: `e3d81f85282724b1239346922b9b60cf3fb24477`
  * [amd64 zip](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.6.0-unofficial-b27-windows-amd64-image.zip), sha1: `80ca8e04fe518c54fe7d20d412429621b31975ee`
 * **OpenJDK 7 update 6 build 24:**
  * [i586 installer](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-windows-i586.zip), sha1: `c6bfea90a555aa2379c462462439010886b623e0`
  * [i586 zip](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-windows-i586-image.zip), sha1: `c6d6610f1cb76d725a88194959e91134db1064d8`
  * [amd64 installer](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-windows-amd64.zip), sha1: `893bca878a5ae2e85f98e1db1207c546d50b2137`
  * [amd64 zip](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-windows-amd64-image.zip), sha1: `f2591ededff2d4133a1b4990837c32183cc8dc3e`

###Mac OS X downloads

 * **OpenJDK 7 update 6 build 24:**
  * [amd64 installer](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-macosx-x86_64.zip), sha1: `ca10f8d15e16b61185b28375ddbfb02ca1857757`
  * [amd64 zip](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-macosx-x86_64-image.zip), sha1: `d8935284bd9977ea558cc1ba18cfeb10f21b4ba9`

###Linux downloads
 * **OpenJDK 6 build 27:**
  * [i586 installer](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.6.0-unofficial-b27-linux-i586.zip), sha1: `8c9a03767c7a46cc7eb076939b62e060b9be46b7`
  * [i586 zip](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.6.0-unofficial-b27-linux-i586-image.zip), sha1: `552d4fe523d972992a431fe74c0362b21e3b84df`
  * [amd64 installer](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.6.0-unofficial-b27-linux-amd64.zip), sha1: `5585aeb36e890e99cf1acf999b737455144bb3b0`
  * [amd64 zip](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.6.0-unofficial-b27-linux-amd64-image.zip), sha1: `4617e7c3252492f110c90f85a332452a537dfbeb`
 * **OpenJDK 7 update 6 build 24:**
  * [i586 installer](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-linux-i586.zip), sha1: `2e1bf4f2bd2081caa420f491f159637ebea53a70`
  * [i586 zip](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-linux-i586-image.zip), sha1: `28e5cdf1aebcb8ce86f19a2760be45150bc93482`
  * [amd64 installer](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-linux-amd64.zip), sha1: `17309c97774182e160124af733b623384dafd161`
  * [amd64 zip](https://github.com/downloads/alexkasko/openjdk-unofficial-builds/openjdk-1.7.0-u6-unofficial-b24-linux-amd64-image.zip), sha1: `8f2dafad7ee4202df70b2a3d357ac213ecdc2616`

###Maven artifacts

Binaries without installers are also available in [maven central](http://repo1.maven.org/maven2/com/alexkasko/openjdk/). 

###Other OpenJDK builds

 * [OpenSCG installers](http://openscg.com/se/openjdk/archive.jsp) (windows build [is used in this project](https://github.com/alexkasko/openjdk-unofficial-builds/tree/master/utils/bootjdk) as a bootstrap JDK)
 * [obuildfactory github project](https://github.com/hgomez/obuildfactory/wiki)
 * [tidalwave build for Mac OS X](http://repo1.maven.org/maven2/it/tidalwave/blueargyle/it-tidalwave-openjdk7/b222-20111220-1/)

Downloads description
---------------------

###Source code

All builds were created from official [OpenJDK project](http://openjdk.java.net/) source bundles without any changes in source code or makefiles (direct links):
 * [openjdk-6-src-b27-26_oct_2012.tar.gz](http://download.java.net/openjdk/jdk6/promoted/b27/openjdk-6-src-b27-26_oct_2012.tar.gz)
 * [openjdk-7u6-fcs-src-b24-28_aug_2012.zip](http://www.java.net/download/openjdk/jdk7u6/promoted/b24/openjdk-7u6-fcs-src-b24-28_aug_2012.zip)

###Build platforms 

OpenJDK project has "minimum build environments" (MBE) that should generate most-compatible binaries - [OpenJDK6 MBE](http://hg.openjdk.java.net/jdk6/jdk6/raw-file/tip/README-builds.html#MBE), [OpenJDK7 MBE](http://hg.openjdk.java.net/jdk7/build/raw-file/tip/README-builds.html#MBE), [Mac OS X MBE](https://wikis.oracle.com/display/OpenJDK/Mac+OS+X+Port#MacOSXPort-Minimumrequirementstorun).

Build environments used for these binaries:
 * *openjdk6-windows-i586*: Windows 2000 and Microsoft Visual Studio .NET 2003 Professional (MBE)
 * *openjdk6-windows-amd64*: Windows Server 2003 - Enterprise x64 Edition and Microsoft Platform SDK - April 2005 (MBE)
 * *openjdk7-windows-i586*: Windows XP SP3 and Windows 7.1 SDK (MBE - 7.1 SDK has the same compilers as VS2010)
 * *openjdk7-windows-amd64*: Windows Server 2003 - Enterprise x64 Edition and Windows 7.1 SDK (MBE)
 * *all linux builds*: Debian 6.0 Squeeze (not MBE)
 * *macosx build*: Mac OS X 10.7.3 Lion (MBE)

###FreeType

On Linux and Mac OS X system prebuilt freetype libraries are used. On windows, [libraries](https://github.com/alexkasko/openjdk-unofficial-builds/tree/master/libs/freetype/dist) (`.dll` and `.lib`) were built from version `2.4.10` as release-multithreaded using the same compilers as openjdk itself.

Simple [header patch](https://github.com/alexkasko/openjdk-unofficial-builds/commit/b468582cceecaadb77d4070660474d1d408b2fbf#L2R91) was applied for all builds.

###CA certificates

OpenJDK source code ships with empty `cacerts` file, that may create troubles working with HTTPS ([trustAnchors error](http://stackoverflow.com/questions/6784463/error-trustanchors-parameter-must-be-non-empty)). These builds contain [cacerts](https://github.com/alexkasko/openjdk-unofficial-builds/tree/master/libs/cacerts) file generated with [script from obuildfactory project](https://github.com/hgomez/obuildfactory/blob/master/openjdk7/macosx/build.sh#L31).

###Unlimited cryptography

OpenJDK build supports unlimited cryptography; it's enabled using `UNLIMITED_CRYPTO=true` environment variable, see [this patch](http://mail.openjdk.java.net/pipermail/build-dev/2012-September/006798.html). But those changes weren't backported to OpenJDK6 and were added to OpenJDK7 after current stable source bundle (update6) was released. Unlimited cryptography will be enabled in this project builds for subsequent OpenJDK7 releases.

###Installers

Installers were built using [IzPack](http://izpack.org/) installer. Installers contain JDK files (JRE may be installed separately) and uninstallers. Installers only copy files and don't need administrator's priviliges.

Installers for all platforms contain exactly the same content: `jre` directory, izpack's `install.jar` and `install` executable launcher. That non-native for OS format may cause problems, see issues [1](https://github.com/alexkasko/openjdk-unofficial-builds/issues/1) and [2](https://github.com/alexkasko/openjdk-unofficial-builds/issues/2).

###Native launchers

`install` and `uninstall` native launchers (with `.exe` on windows) were built using [jar-launcher](https://github.com/alexkasko/jar-launcher). They run `install.jar` and `uninstall.jar` using bundled JRE.

###Zip bundles

ZIP downloads (`*-image.zip` files) contain zipped JDK files (contents of `j2sdk-image`) without any changes.

Build process on Mac OS X and Linux
-----------------------------------

This git repository (besides downloads) contains only files to support Windows builds. That was done so, because Linux and Mac OS X builds are trivial for supported versions. Environment example for linux/mac:

    export LD_LIBRARY_PATH=
    export CLASSPATH=
    export JAVA_HOME=
    export LANG=C
    export ANT_HOME=path/to/ant
    export PATH=$ANT_HOME/bin:$PATH
    export ALT_CACERTS_FILE=path/to/cacerts
    export ALT_BOOTDIR=path/to/jdk6
    export MILESTONE=u6-unofficial
    export BUILD_NUMBER=b24

See also official instructions for [debian](http://hg.openjdk.java.net/jdk7/build/raw-file/tip/README-builds.html#debian) and [macosx](https://wikis.oracle.com/display/OpenJDK/Mac+OS+X+Port) builds.

Build process on Windows
------------------------

Windows build is more comlicated than linux and mac ones. It is described in [official build doc](http://hg.openjdk.java.net/jdk7/build/raw-file/tip/README-builds.html#windows).

This git repository contains [tools](https://github.com/alexkasko/openjdk-unofficial-builds/tree/master/utils), [libraries](https://github.com/alexkasko/openjdk-unofficial-builds/tree/master/libs) and build environment `.bat` scripts.

Microsoft compiler toolchains and DirectX SDK cannot be distributed on Github because of legal reasons, so some prerequisites installation required.

###Common prerequisite

Microsoft DirectX 9.0 SDK (Summer 2004) is used in all windows builds. It was available on [microsoft.com](http://www.microsoft.com/en-us/download/details.aspx?id=21416) (I've dowload it there in November 2012), but it may be not available now. It may be found online on other sites. File details:

 * name: `dxsdk_sum2004.exe`
 * size: `239008008`
 * sha1: `73d875b97591f48707c38ec0dbc63982ff45c661`
  
After installation DirectX files should be put into `libs/directx` directory, [files list](https://github.com/alexkasko/openjdk-unofficial-builds/blob/master/libs/directx/files.txt).

###OpenJDK6 preprequisites

`i586` build was tested using Windows 2000 (newer OS may work) and Visual Studio .NET 2003 (other compilers won't work). After Visual Studio installation check the `VC` path in [build_jdk6_x32.bat](https://github.com/alexkasko/openjdk-unofficial-builds/blob/master/build_jdk6_x32.bat) file.

`amd64` build was tested using Windows 2003 x64 (newer OS's may work) and Microsoft Platform SDK - April 2005, available at [microsoft.com](http://www.microsoft.com/en-us/download/details.aspx?id=15656), sha1: `ee43b337d9739a4da3417b8eaca36cfafaa41de7`. After SDK installation check `PSDK` path in [build_jdk6_x64.bat](https://github.com/alexkasko/openjdk-unofficial-builds/blob/master/build_jdk6_x64.bat) file.

###OpenJDK7 prerequisites

OpenJDK7 `i586` builds should work on 32-bit Windows XP and later, `amd64` builds - on 64-bit Windows 2003 and later.

Both `i586` and `amd64` versions of OpenJDK7 may be built using the same Windows 7.1 SDK (you'll need some additional files for `amd64`). SDK files should be copied into `utils/winsdk71` and may be used as standalone toolchain on completely clean windows box:

 * install Windows SDK 7.1 for x86_32, available at [microsoft.com](http://www.microsoft.com/en-us/download/details.aspx?id=8442), `GRMSDK_EN_DVD.iso` file, sha1: `cde254e83677c34c8fd509d6b733c32002fe3572`
 * install Windows SDK 7.1 for x86_64, the same link as above, `GRMSDKX_EN_DVD.iso` file, sha1: `9203529f5f70d556a60c37f118a95214e6d10b5a` on another x64 windows box
 * copy Visual Studio files (shipped with SDK) to `utils/winsdk71/vs2010e`, [files list](https://github.com/alexkasko/openjdk-unofficial-builds/blob/master/utils/winsdk71/files.txt#L2874)
 * copy SDK x86_32 files to `utils/winsdk71/sdk`, [files list](https://github.com/alexkasko/openjdk-unofficial-builds/blob/master/utils/winsdk71/files.txt)
 * copy `Bin/x64` directory from SDK x64 installation to `utils/utils/winsdk71/sdk/Bin/x64` 

###Run build

 * launch `build_jdk7_xNN.bat`
 * cd to openjdk7 sources root
 * run `make`
 
###Create installer  

To create IzPack installer for newly built `j2sdk-image` run this command from the same Cygwin console:

    openjdk-unofficial-builds/installer/build-installer.sh path/to/openjdk_sources_root
    
You may edit IzPack installer descriptor and attendant files for corresponding platform in `installer/<platform>` directory.

[izpack-launcher](https://github.com/alexkasko/izpack-launcher) wrapper is used to launch Izpack installer build. IzPack standalone compiler also may be used without this wrapper.

License information
-------------------

OpenJDK binaries are released under the [GNU GPL v. 2 with classpath exception](http://hg.openjdk.java.net/jdk7u/jdk7u/raw-file/da55264ff2fb/LICENSE).

Build scipts `build_jdkXXX.bat` were written by me and released under the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

Other sources and binaries in this repository (cygwin, freetype etc.) are released under their corresponding licenses.

Changelog
---------

*2012-12-08*

 * initial public version
