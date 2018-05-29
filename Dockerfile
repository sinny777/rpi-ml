FROM resin/rpi-raspbian

MAINTAINER Gurvinder Singh <http://www.gurvinder.info>

ENV INITSYSTEM on \
  AUDIODEV hw:1,0 \
  AUDIODRIVER alsa \
  BUILD_VERSION="V1"

# Updates and adds system required packages
RUN apt-get update && apt-get install -qy wget git tar libraspberrypi-bin \
    && rm -rf /var/lib/apt/lists/*

USER root

# Create a directory where our app will be placed
RUN mkdir -p /usr/src/app

#Change directory so that our commands run inside this new directory
WORKDIR /root

# Copy dependency definitions
COPY build.sh /root

# Get all the code needed to run the app
COPY . /root

ENV TINI_SUBREAPER=true

RUN chmod 755 /root/build.sh
RUN chmod 755 /root/entrypoint.sh

RUN /root/build.sh

ENV TINI_SUBREAPER=true

ENTRYPOINT ["tini","-s", "--"]

CMD []
