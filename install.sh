#!/bin/bash
# Install .dotfiles

# -- Import from other scripts -------------------------------------------------

source 'tools/colors.sh'
source 'tools/functions.sh'

# -- OSX- or Linux-Specific Setup ----------------------------------------------

if system_is_OSX; then

  source 'scripts/osx.sh'

elif system_is_linux; then

  source 'scripts/ubuntu.sh'

fi

# -- GIT -----------------------------------------------------------------------

if get_boolean_response "Do you want to install the Git configuration files?"
then
  ln -sf $HOME/.dotfiles/gitignore_global $HOME/.gitignore_global
  echo_item "Linked global .gitignore" "green"

  ln -sf $HOME/.dotfiles/gitconfig $HOME/.gitconfig
  echo_item "Linked gitconfig" "green"
else
  echo_item "Ignoring Git configuration" red
fi

echo ""

# -- ZSH Setup -----------------------------------------------------------------

if exists "zsh"; then
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
else
  echo_item "ZSH is not installed"
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
    vim +PluginInstall
    echo_item "Vundle installed" "green"
  fi
else
  echo_item "Ignoring Vim configuration" red
fi

echo ""
