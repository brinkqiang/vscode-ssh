#!/bin/bash

rm -rf build
mkdir -p build
pushd build
cmake -DCMAKE_BUILD_TYPE=debug ..
cmake --build . --config debug
popd

# echo continue && read -n 1

