ARG BASE_IMG=btc_base
FROM ${BASE_IMG}

ARG CHECKOUT=v2.5.1

# Need root to install packages
USER root
WORKDIR /root

# Clone and build Ravencoin source
RUN git clone -v https://github.com/RavenProject/Ravencoin.git ; \
cd Ravencoin ; \
git checkout ${CHECKOUT} ; \
./autogen.sh ; \
./configure ; \
make -j $(grep -c ^processor /proc/cpuinfo) ; \
make install ; \
cd .. ; \
rm -rf Ravencoin

# Revert to user dev
USER dev
WORKDIR /home/dev