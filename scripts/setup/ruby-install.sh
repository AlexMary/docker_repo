#!/usr/bin/env bash
# ruby-install

BUILD_PATH=`mktemp -d`

wget -qO "${BUILD_PATH}/ruby-install-master.tar.gz" "https://github.com/postmodern/ruby-install/archive/master.tar.gz"
tar -xf "${BUILD_PATH}/ruby-install-master.tar.gz" -C "${BUILD_PATH}"
cd "${BUILD_PATH}/ruby-install-master/" && make install