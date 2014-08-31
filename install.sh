#!/bin/bash
# Install .dotfiles

# -- Internal Functions --------------------------------------------------------

exists() {
  if [ type "$1" >/dev/null 2>/dev/null ]; then
    return 1
  else
    return 0
  fi
}

# -- OSX- or Linux-Specific Setup ----------------------------------------------

if [ "$(uname)" == "Darwin" ]; then
  # Setup for OSX Systems

  # Install Homebrew if it's not installed
  if exists "brew"; then
    echo "Homebrew is already installed"
  else
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Setup for Linux systems

  # Install Git
  if exists "git"; then
    echo "Git is already installed"
  else
    sudo apt-get install git
  fi

fi

# -- RBENV ---------------------------------------------------------------------

# Install rbenv
if exists "rbenv"; then
  echo "rbenv is already installed"
 else
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
fi


# -- SHELL-SPECIFIC SETUP ------------------------------------------------------

if [ -n "$ZSH_VERSION" ]; then
  # -- ZSHRC
  ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
  echo 'Linked zshrc'

elif [ -n "$BASH_VERSION" ]; then
  # -- BASH PROFILE
  ln -sf $HOME/.dotfiles/bash_profile $HOME/.bash_profile
  echo 'Linked bash_profile'
fi


# -- TMUX ----------------------------------------------------------------------
ln -sf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
echo 'Linked tmux configutation'

# -- VIM -----------------------------------------------------------------------
# Link the dotfiles

# TODO: Ask if the user wants to copy the current configuration to a .local file
ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -sf $HOME/.dotfiles/vimrc.bundles $HOME/.vimrc.bundles
echo 'Linked vim configuration'

# Install Vundle
if [ -d $HOME/.vim/bundle/Vundle.vim ]; then
  echo 'Vundle plugin already installed'
 else
  echo 'Installing Vundle...'
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
