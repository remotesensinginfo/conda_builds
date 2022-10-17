#!/bin/bash

source activate "${CONDA_DEFAULT_ENV}"

mkdir builddir
cd builddir

if [ `uname` == Darwin ]; then
    
    export DYLD_FALLBACK_LIBRARY_PATH=$PREFIX/lib
    cmake -D CMAKE_INSTALL_PREFIX=$PREFIX \
	    -D BOOST_INCLUDE_DIR=$CONDA_ENV_PATH/include \
-D BOOST_LIB_PATH=$CONDA_ENV_PATH/lib \
-D GDAL_INCLUDE_DIR=$CONDA_ENV_PATH/include \
-D GDAL_LIB_PATH=$CONDA_ENV_PATH/lib \
-D HDF5_INCLUDE_DIR=$CONDA_ENV_PATH/include \
-D HDF5_LIB_PATH=$CONDA_ENV_PATH/lib \
-D SPDLIB_IO_INCLUDE_DIR=$CONDA_ENV_PATH/include \
-D SPDLIB_IO_LIB_PATH=$CONDA_ENV_PATH/lib \
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
	    -D BOOST_INCLUDE_DIR=$CONDA_ENV_PATH/include \
-D BOOST_LIB_PATH=$CONDA_ENV_PATH/lib \
-D GDAL_INCLUDE_DIR=$CONDA_ENV_PATH/include \
-D GDAL_LIB_PATH=$CONDA_ENV_PATH/lib \
-D HDF5_INCLUDE_DIR=$CONDA_ENV_PATH/include \
-D HDF5_LIB_PATH=$CONDA_ENV_PATH/lib \
-D SPDLIB_IO_INCLUDE_DIR=$CONDA_ENV_PATH/include \
-D SPDLIB_IO_LIB_PATH=$CONDA_ENV_PATH/lib \
	-D CMAKE_VERBOSE_MAKEFILE=ON \
	-D CMAKE_SKIP_RPATH=ON \
	..
fi


make 
make install


