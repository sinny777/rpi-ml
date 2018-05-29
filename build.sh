#!/bin/bash

function install_build_tools {
  apt-get update
  apt-get dist-upgrade
  apt-get install build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev
  apt-get install python3
  apt-get install python3-pip
}

function install_node {
  wget https://nodejs.org/dist/v8.9.0/node-v8.9.0-linux-armv6l.tar.gz
  tar -xzf node-v8.9.0-linux-armv6l.tar.gz
  cd node-v8.9.0-linux-armv6l/
  sudo cp -R * /usr/local/
}

function install_ml_dependencies {
  npm install -g opencv4nodejs
  npm install -g face-recognition
  # npm install -g @angular/cli@1.6.8
  # ng build --dev --env=dev
}

install_build_tools
install_node
# install_ml_dependencies
# install_app_dependencies
# configure_ldconfig
# build_psips
