#!/usr/bin/env bash
# chruby setup

BUILD_PATH=`mktemp -dq`

if [ ! -e `which wget` ]; then
  echo "missing wget"
  exit 1
fi

if [ ! -e `which make` ]; then
  echo "missing make"
  exit 1
fi

wget -qO "${BUILD_PATH}/chruby-master.tar.gz" "https://github.com/postmodern/chruby/archive/master.tar.gz"
tar xf "${BUILD_PATH}/chruby-master.tar.gz" -C "${BUILD_PATH}"
cd "${BUILD_PATH}/chruby-master" && make install