#!/bin/bash
# ubuntu.sh

# -- Git -----------------------------------------------------------------------

if exists "git"; then
  echo_item "Git is already installed" "green"
else
  sudo apt-get install git
fi

echo ""

# -- rbenv ---------------------------------------------------------------------

if exists "rbenv"; then
  echo_item "rbenv is already installed" "green"
else
  if get_boolean_response "Do you want to install rbenv?"; then
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    rbenv rehash
  else
    echo_item "Skipping rbenv install" "red"
  fi
fi

echo ""

# -- npm -----------------------------------------------------------------------

if exists "npm"; then
  echo_item "npm is already installed" green
else
  if get_boolean_response "Do you want to install npm?"; then
    curl -sL https://deb.nodesource.com/setup | sudo bash -
    sudo apt-get install -y nodejs
    source ./node.sh
  else
    echo_item "Skipping npm install" red
  fi
fi

echo ""

# -- htop ----------------------------------------------------------------------

if exists "htop"; then
  echo_item "htop is already installed" green
else
  if get_boolean_response "Do you want to install htop?"; then
    sudo apt-get install htop
  else
    echo_item "Skipping htop install" red
  fi
fi

echo ""
