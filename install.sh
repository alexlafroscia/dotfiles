#!/bin/bash
# Install .dotfiles

# -- Output Colors -------------------------------------------------------------

source 'tools/colors.sh'

# -- Internal Functions --------------------------------------------------------

exists() {
  type "$1" >/dev/null 2>/dev/null
}

echo_header() {
  echo "     === $1 ==="
}

echo_item() {
  if [ "$2" == "green" ]; then
    echogreen "---> $1"
  elif [ "$2" == "red" ]; then
    echored "---> $1"
  else
    echo "---> $1"
  fi
}

get_boolean_response() {
  while true; do
    read -p "$1 (Y/N) " yn
    case $yn in
      [Yy]* ) return 0;;
      [Nn]* ) return 1;;
      * ) echo "Please answer yes or no";;
    esac
  done
}

# -- OSX- or Linux-Specific Setup ----------------------------------------------

if [ "$(uname)" == "Darwin" ]; then
  # Setup for OSX Systems

  # Install Homebrew if it's not installed
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

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Setup for Linux systems

  # Install Git
  if exists "git"; then
    echo_item "Git is already installed" "green"
  else
    sudo apt-get install git
  fi

fi

# -- RBENV ---------------------------------------------------------------------


# Install rbenv
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

# -- ZSH Setup -----------------------------------------------------------------

if get_boolean_response "Do you want to install ZSH configuration files?"; then

  # -- ZSHRC
  ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
  echo_item "Linked zshrc" "green"

  # -- OH MY ZSH
  if [ -d $HOME/.oh-my-zsh/ ]; then
    echo_item "Oh my ZSH is already installed" "green"
  else
    if exists "curl"; then
      curl -L http://install.ohmyz.sh | sh
    elif exists "wget"; then
      wget --no-check-certificate http://install.ohmyz.sh -O - | sh
    else
      echo_item "You need either curl or wget installed to download Oh My ZSH"
    fi
  fi

else
  echo_item "Ignoring ZSH configuration" "red"
fi

echo ""

# -- BASH Setup ----------------------------------------------------------------

if get_boolean_response "Do you want to install Bash configuration files?"; then
  # -- BASH PROFILE
  ln -sf $HOME/.dotfiles/bash_profile $HOME/.bash_profile
  echo_item "Linked bash_profile" "green"
else
  echo_item "Ignoring Bash configuration" "red"
fi

echo ""

# -- TMUX ----------------------------------------------------------------------
if get_boolean_response "Do you want to install the Tmux configuration file?"
then
  ln -sf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
  echo_item "Linked tmux configutation" "green"
else
  echo_item "Ignoring Tmux configuration" "red"
fi

echo ""

# -- VIM -----------------------------------------------------------------------
# Link the dotfiles

# TODO: Ask if the user wants to copy the current configuration to a .local file
if get_boolean_response "Do you want to install the Vim configuration file?"
then
  ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc
  ln -sf $HOME/.dotfiles/vimrc.bundles $HOME/.vimrc.bundles
  echo_item "Linked vim configuration" "green"

  # Install Vundle
  if [ -d $HOME/.vim/bundle/Vundle.vim ]; then
    echo_item "Vundle plugin already installed" "green"
   else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo_item "Vundle installed" "green"
  fi

fi

