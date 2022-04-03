# CMake system name must be something like "Linux".
# This is important for cross-compiling.
set( CMAKE_SYSTEM_NAME Linux )
set( CMAKE_SYSTEM_PROCESSOR arm )

set( TOOLCHAIN_PATH /usr/local/musl/arm-linux-musleabihf-cross )
set( CMAKE_C_COMPILER ${TOOLCHAIN_PATH}/bin/arm-linux-musleabihf-gcc )
set( CMAKE_CXX_COMPILER ${TOOLCHAIN_PATH}/bin/arm-linux-musleabihf-g++ )
set( CMAKE_ASM_COMPILER ${TOOLCHAIN_PATH}/bin/arm-linux-musleabihf-gcc )
set( CMAKE_AR ${TOOLCHAIN_PATH}/bin/arm-linux-musleabihf-ar CACHE FILEPATH "Archiver" )
set( CMAKE_RANLIB ${TOOLCHAIN_PATH}/bin/arm-linux-musleabihf-ranlib CACHE FILEPATH "Ranlib" )
set( CMAKE_C_FLAGS " -O2 -pipe -g -feliminate-unused-debug-types " CACHE STRING "CFLAGS" )
set( CMAKE_CXX_FLAGS " -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden" CACHE STRING "CXXFLAGS" )
set( CMAKE_ASM_FLAGS " -O2 -pipe -g -feliminate-unused-debug-types " CACHE STRING "ASM FLAGS" )
set( CMAKE_C_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional CFLAGS for release" )
set( CMAKE_CXX_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional CXXFLAGS for release" )
set( CMAKE_ASM_FLAGS_RELEASE "-DNDEBUG" CACHE STRING "Additional ASM FLAGS for release" )
set( CMAKE_C_LINK_FLAGS " -static -Wl,--as-needed" CACHE STRING "LDFLAGS" )
set( CMAKE_CXX_LINK_FLAGS " -static -Wl,--as-needed -O2 -pipe -g -feliminate-unused-debug-types -fvisibility-inlines-hidden -Wl,--as-needed" CACHE STRING "LDFLAGS" )

# only search in the paths provided so cmake doesnt pick
# up libraries and tools from the native build machine
set( CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_PATH})
set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )

# We need to set the rpath to the correct directory as cmake does not provide any
# directory as rpath by default
set( CMAKE_INSTALL_RPATH  )

# add for non /usr/lib libdir, e.g. /usr/lib64
set( CMAKE_LIBRARY_PATH /usr/lib /lib)
