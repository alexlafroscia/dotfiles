#!/bin/bash
# OSX.sh

# -- Homebrew ------------------------------------------------------------------

if exists "brew"; then
  echo_item "Homebrew is already installed" green
else
  if get_boolean_response "Do you want to install Homebrew?"; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  else
    echo_item "Skipping Homebrew install" "red"
  fi
fi

echo ""

# -- rbenv ---------------------------------------------------------------------

if exists "rbenv"; then
  echo_item "rbenv is already installed" green
else
  if get_boolean_response "Do you want to install rbenv?"; then
    brew install rbenv ruby-install
  else
    echo_item "Skipping rbenv install" red
  fi
fi
