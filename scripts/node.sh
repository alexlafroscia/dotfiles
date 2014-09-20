#!/bin/bash
# Install Node and NPM Modules

source 'tools/colors.sh'
source 'tools/functions.sh'

if get_boolean_response "Do you want to install some global npm packages?"; then
  sudo npm install -g grunt-cli
  echo_item "Installed grunt-cli" green
  
  sudo npm install -g bower
  echo_item "Installed bower" green
else
  echo_item "Skipping npm global packages" red
fi
