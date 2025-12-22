#!/bin/bash

set -e

apt-get update && \
apt-get install python3.8-dev python3-pip wget curl -y
update-alternatives --install /usr/bin/python python /usr/bin/python3 1

wget https://github.com/Kitware/CMake/releases/download/v3.27.9/cmake-3.27.9-linux-x86_64.tar.gz
tar -xzf cmake-3.27.9-linux-x86_64.tar.gz
mv cmake-3.27.9-linux-x86_64 /opt/cmake
ln -sf /opt/cmake/bin/cmake /usr/local/bin/cmake