#!/bin/bash

function install_build_tools {
  echo "<<<<<<<<<<< INSTALLING BUILD TOOLS LIKE PYTHON3, PIP3 etc >>>>>>>>>>>>> "
  apt-get update
  apt-get dist-upgrade
  apt-get install build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev
  apt-get install python3
  apt-get install python3-pip

  update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
  update-alternatives --install /usr/bin/python python /usr/bin/python3.4 2

}

function install_node {
  echo "<<<<<<<<<<< INSTALLING NODE JS >>>>>>>>>>>>> "
  # wget https://nodejs.org/dist/v8.9.0/node-v8.9.0-linux-armv6l.tar.gz
  # tar -xzf node-v8.9.0-linux-armv6l.tar.gz
  wget https://dal.objectstorage.open.softlayer.com/v1/AUTH_152c01ff330647bd81131826c8743add/tools/node-v8.9.0-linux-armv6l.zip
  unzip -qq node-v8.9.0-linux-armv6l.zip
  rm -rf node-v8.9.0-linux-armv6l.zip __MACOSX
  cd node-v8.9.0-linux-armv6l/
  sudo cp -R * /usr/local/

  npm install -g node-gyp
  npm install -g node-pre-gyp
  npm install -g serialport

}

function install_ml_dependencies {
  echo "<<<<<<<<<<< INSTALLING MACHINE LEARNING DEPENDENCIES >>>>>>>>>>>>> "
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
