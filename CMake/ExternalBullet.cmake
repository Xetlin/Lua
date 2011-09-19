INCLUDE(ExternalProject)

SET(bullet_PREFIX ${PROJECT_BINARY_DIR}/bullet)

SET(bullet_CMAKE_ARGS 
    -DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
    -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    -DCMAKE_DEBUG_POSTFIX=_d
    -DINSTALL_LIBS=ON
    -DBUILD_DEMOS=OFF
    -DBUILD_EXTRAS=OFF
    -DBUILD_UNIT_TESTS=OFF
)

#IF(CMAKE_COMPILER_IS_GNUCXX)
#    # Needs fpic to link in shared lib on Linux with GCC
#    LIST(APPEND bullet_CMAKE_ARGS -DCMAKE_CXX_FLAGS=-fPIC)
#ENDIF(CMAKE_COMPILER_IS_GNUCXX)

ExternalProject_Add(bullet
    PREFIX ${bullet_PREFIX}
    
    DOWNLOAD_DIR ${POLYCODE_DEPS_DOWNLOAD_DIR}

    URL http://bullet.googlecode.com/files/bullet-2.78.zip
    URL_MD5 99d4070864c9f73521481ba9cda25038

    INSTALL_DIR ${POLYCODE_DEPS_MODULES_PREFIX} 
    CMAKE_ARGS ${bullet_CMAKE_ARGS}
)
