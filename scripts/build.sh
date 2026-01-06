#!/bin/bash

set -e

CUDA_VERSION=$(nvcc --version | grep release | sed -E 's/.*release ([0-9]+\.[0-9]+).*/\1/')
CUDA_MAJOR=${CUDA_VERSION%.*}
CUDA_MINOR=${CUDA_VERSION#*.}

CUDA_ARCH_LIST="8.0;8.6"

ARCH="$(uname -m)"

if [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
  CUDA_ARCH_LIST="8.7"
elif [[ "$CUDA_MAJOR" -gt 11 ]] || [[ "$CUDA_MAJOR" -eq 11 && "$CUDA_MINOR" -gt 4 ]]; then
  CUDA_ARCH_LIST="${CUDA_ARCH_LIST};8.9"
fi

export CUMM_CUDA_VERSION=${CUDA_VERSION}
export CUMM_DISABLE_JIT=1
export CUMM_CUDA_ARCH_LIST=${CUDA_ARCH_LIST}

pip3 install -e cumm

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PROJECT_DIR=$(dirname $SCRIPT_DIR)

cd $PROJECT_DIR/spconv
git apply $PROJECT_DIR/patches/spconv_v2.3.6.patch
pip3 install -e .

ln -s $PROJECT_DIR/cumm $PROJECT_DIR/spconv/example/libspconv/cumm

VERSION="$(git describe --tags --dirty --always)"

bash example/libspconv/run_build.sh ${CUDA_VERSION} ${CUDA_ARCH_LIST}

PKG_NAME=libspconv-${VERSION}-${ARCH}-cuda${CUDA_VERSION}
PKG_DIR=${PROJECT_DIR}/build/${PKG_NAME}

echo "[INFO] Packaging ${PKG_NAME}"

rm -rf ${PKG_DIR}
mkdir -p ${PKG_DIR}
mkdir -p ${PKG_DIR}/include
mkdir -p ${PKG_DIR}/lib

# headers
cp -r example/libspconv/spconv/include/* ${PKG_DIR}/include/
cp -r example/libspconv/cumm/include/*   ${PKG_DIR}/include/

# library
cp example/libspconv/build/spconv/src/libspconv.so ${PKG_DIR}/lib/

cd ${PROJECT_DIR}/build

tar -czvf ${PKG_NAME}.tar.gz -C ${PKG_DIR} .

rm -rf ${PKG_DIR}

echo "[DONE] ${PKG_NAME}.tar.gz generated"
