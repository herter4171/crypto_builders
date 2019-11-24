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

# Build crypto images
SFX=.Dockerfile
for PFX in $(ls *$SFX | sed "s/$SFX//g" | grep -v btc_base); do 
    build_image $PFX 
done
