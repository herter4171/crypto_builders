#!/bin/bash

build_image()
{
    docker build -t $1 -f $1.Dockerfile .
}

# Ensure base image for BTC forks is present
if [ $(docker images | grep -c btc_base) -eq 0 ]; then
    echo "Building base image..."
    build_image btc_base
fi

# Build crypto images with RVN layered on BTC
build_image btc
docker build --build-arg BASE_IMG=btc -t btc_rvn -f rvn.Dockerfile
