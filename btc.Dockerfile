FROM btc_base

ARG CHECKOUT=v0.18.1

# Need root to install packages
USER root
WORKDIR /root

# Clone and build Bitcoin source
RUN git clone -v https://github.com/bitcoin/bitcoin.git ; \
cd bitcoin ; \
git checkout ${CHECKOUT} ; \
./autogen.sh ; \
./configure ; \
make -j $(grep -c ^processor /proc/cpuinfo) ; \
make install ; \
cd .. ; \
rm -rf bitcoin

# Revert to user dev
USER dev
WORKDIR /home/dev