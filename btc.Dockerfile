FROM ubuntu

WORKDIR /root

COPY apt_installs.sh /root/apt_installs.sh

RUN ./apt_installs.sh

RUN git clone https://github.com/bitcoin/bitcoin.git ; \
cd bitcoin ; \
git checkout v0.18.1 ; \
./autogen.sh ; \
./configure ; \
make -j $(grep -c ^processor /proc/cpuinfo) ; \
make install ; \
cd .. ; \
rm -rf bitcoin
