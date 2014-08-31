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

echo_header() {
  echo "     === $1 ==="
}

echo_item() {
  echo "---> $1"
}

echo_sub_item() {
  echo "     ---> $1"
}

# -- OSX- or Linux-Specific Setup ----------------------------------------------

if [ "$(uname)" == "Darwin" ]; then
  # Setup for OSX Systems

  echo_header "Homebrew"

  # Install Homebrew if it's not installed
  if exists "brew"; then
    echo_item "Homebrew is already installed"
  else
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  fi

  echo ""

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Setup for Linux systems

  # Install Git
  if exists "git"; then
    echo_item "Git is already installed"
  else
    sudo apt-get install git
  fi

fi

# -- RBENV ---------------------------------------------------------------------

echo_header "RBENV Setup"

# Install rbenv
if exists "rbenv"; then
  echo_item "rbenv is already installed"
 else
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

echo ""

# -- SHELL-SPECIFIC SETUP ------------------------------------------------------

echo_header "Config Files"

if [ -n "$ZSH_VERSION" ]; then
  # -- ZSHRC
  ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
  echo_item 'Linked zshrc'

  # -- OH MY ZSH
  if [ -d $HOME/.oh-my-zsh/ ]; then
    echo_item 'Oh my ZSH is already installed'
  else
    if exists "curl"; then
      curl -L http://install.ohmyz.sh | sh
    elif exists "wget"; then
      wget --no-check-certificate http://install.ohmyz.sh -O - | sh
    else
      echo_item "You need either curl or wget installed to download Oh My ZSH"
    fi
  fi

elif [ -n "$BASH_VERSION" ]; then
  # -- BASH PROFILE
  ln -sf $HOME/.dotfiles/bash_profile $HOME/.bash_profile
  echo_item 'Linked bash_profile'
else
  echo_item "I can't tell which shell you're using"
fi


# -- TMUX ----------------------------------------------------------------------
ln -sf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
echo_item 'Linked tmux configutation'

# -- VIM -----------------------------------------------------------------------
# Link the dotfiles

# TODO: Ask if the user wants to copy the current configuration to a .local file
ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -sf $HOME/.dotfiles/vimrc.bundles $HOME/.vimrc.bundles
echo_item 'Linked vim configuration'

# Install Vundle
if [ -d $HOME/.vim/bundle/Vundle.vim ]; then
  echo_sub_item 'Vundle plugin already installed'
 else
  echo_sub_item 'Installing Vundle...'
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
