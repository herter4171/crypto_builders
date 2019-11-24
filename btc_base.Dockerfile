FROM herter4171/ubuntu-vnc:latest

# Need root to install packages
USER root
WORKDIR /root

# Run package installs
COPY apt_installs.sh .
RUN ./apt_installs.sh

# Revert to user dev
USER dev
WORKDIR /home/dev