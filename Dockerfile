# How to use this Dockerfile
# Build with: docker build --rm -t triblerx11 .
# 
#
# docker run -ti  --net=host \
#                 --env="DISPLAY" \
#                 -v $HOME/Tribler/Downloads:/root/Downloads \
#                 -v $HOME/.Tribler:/root/.Tribler \
#                 --volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
#                 --name "triblerx11" \
#                 ubuntu:15.10 /bin/bash

# 
# After quitting the container, it can be re-attached with: docker restart triblerx11
# 							    docker attach triblerx11
#

# Start with Ubuntu base image
FROM ubuntu:15.10
MAINTAINER Hans de Jong <xxx@xxx.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
  wget \
  gdebi
  
RUN wget https://github.com/Tribler/tribler/releases/download/v6.5.2/tribler_6.5.2_all.deb
RUN gdebi --n tribler_6.5.2_all.deb

CMD ["/usr/bin/tribler"]
