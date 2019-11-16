#!/bin/bash

# Run headless and update
export DEBIAN_FRONTEND=noninteractive
apt-get update -y

# Install core dependencies
apt-get install -y \
  build-essential \
  libtool \
  autotools-dev \
  automake \
  pkg-config \
  libssl-dev \
  libevent-dev \
  bsdmainutils \
  python3 \
  libboost-all-dev \
  software-properties-common

# Get BerkeleyDB
add-apt-repository ppa:bitcoin/bitcoin -y
apt-get update -y
apt-get install -y \
  libdb4.8-dev \
  libdb4.8++-dev

# Install optional packages to be safe
apt-get install -y \
  libminiupnpc-dev
  libzmq3-dev

# Install GUI packages
apt-get install -y \
  libqt5gui5 \
  libqt5core5a \
  libqt5dbus5 \
  qttools5-dev \
  qttools5-dev-tools \
  libprotobuf-dev \
  protobuf-compiler

# Install optional package to be safe
apt-get install -y \
  libqrencode-dev

# Install convenience packages
apt-get install -y \
  vim \
  tmux \
  git

# Clean apt cache
apt-get clean