#!/bin/bash

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DPYTHON3_EXECUTABLE=/usr/bin/python3 -DPYTHON_INCLUDE_DIR=/usr/include/python3.5m -DPYTHON_INCLUDE_DIR2=/usr/include/x86_64-linux-gnu/python3.5m -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.5m.so -DPYTHON3_NUMPY_INCLUDE_DIRS=/usr/lib/python3/dist-packages/numpy/core/include/ -DCXX=/usr/local/bin/g++ -DCC=/usr/local/bin/gcc -DOPENCV_GENERATE_PKGCONFIG=ON -DOPENCV_EXTRA_MODULES_PATH=~/sources/opencv_contrib/modules -DOPENCV_ENABLE_NONFREE=ON -DBUILD_EXAMPLES=ON .. | tee cmake-config.log


