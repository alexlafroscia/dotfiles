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
  else
    echo_item "Skipping rbenv install" "red"
  fi
fi

echo ""
