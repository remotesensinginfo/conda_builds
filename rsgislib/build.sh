#!/bin/bash

source activate "${CONDA_DEFAULT_ENV}"

mkdir builddir
cd builddir

if [ `uname` == Darwin ]; then
    
    export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
    cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
	-D BOOST_INCLUDE_DIR=$PREFIX/include \
	-D BOOST_LIB_PATH=$PREFIX/lib \
	-D GDAL_INCLUDE_DIR=$PREFIX/include \
	-D GDAL_LIB_PATH=$PREFIX/lib \
	-D HDF5_INCLUDE_DIR=$PREFIX/include \
	-D HDF5_LIB_PATH=$PREFIX/lib \
	-D GSL_INCLUDE_DIR=$PREFIX/include \
	-D GSL_LIB_PATH=$PREFIX/lib \
	-D MUPARSER_INCLUDE_DIR=$PREFIX/include \
	-D MUPARSER_LIB_PATH=$PREFIX/lib \
	-D KEA_INCLUDE_DIR=$PREFIX/include \
	-D KEA_LIB_PATH=$PREFIX/lib \
	-D Python_EXECUTABLE=$PREFIX/bin/python \
	-D Python_INCLUDE_DIR=$PREFIX/include/python3.9/ \
	-D Python_LIBRARY_RELEASE=$PREFIX/lib/libpython3.9.dylib \
        -D CMAKE_CXX_COMPILER=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ \
        -D CMAKE_C_COMPILER=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/cc \
	-D CMAKE_OSX_DEPLOYMENT_TARGET="" \
	-D CMAKE_VERBOSE_MAKEFILE=ON \
        -D CMAKE_BUILD_TYPE=Debug \
	-D CMAKE_SKIP_RPATH=ON \
	..
else
    export LD_LIBRARY_PATH=$PREFIX/lib
    cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
	-D BOOST_INCLUDE_DIR=$PREFIX/include \
	-D BOOST_LIB_PATH=$PREFIX/lib \
	-D GDAL_INCLUDE_DIR=$PREFIX/include \
	-D GDAL_LIB_PATH=$PREFIX/lib \
	-D HDF5_INCLUDE_DIR=$PREFIX/include \
	-D HDF5_LIB_PATH=$PREFIX/lib \
	-D GSL_INCLUDE_DIR=$PREFIX/include \
	-D GSL_LIB_PATH=$PREFIX/lib \
	-D MUPARSER_INCLUDE_DIR=$PREFIX/include \
	-D MUPARSER_LIB_PATH=$PREFIX/lib \
	-D KEA_INCLUDE_DIR=$PREFIX/include \
	-D KEA_LIB_PATH=$PREFIX/lib \
	-D CMAKE_VERBOSE_MAKEFILE=ON \
	-D CMAKE_SKIP_RPATH=ON \
	..
fi


make -j 4
make install


