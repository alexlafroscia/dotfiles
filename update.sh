#!/bin/bash
# Install .dotfiles

# -- Import from other scripts -------------------------------------------------

source 'scripts/helpers/colors.sh'
source 'scripts/helpers/functions.sh'

# -- OSX- or Linux-Specific Setup ----------------------------------------------

#if system_is_OSX; then

  #source 'scripts/osx.sh'

#elif system_is_linux; then

  #source 'scripts/ubuntu.sh'

#fi

# -- GIT -----------------------------------------------------------------------

if get_boolean_response "Running this command assumes that you have already \
installed the files once, and that you only want to update to the latest \
version.
Is this correct?";
then
  # Global gitignore config
  rm $HOME/.gitignore_global
  ln -sf $HOME/.dotfiles/git/gitignore_global $HOME/.gitignore_global
  echo_item "Updated global .gitignore" "green"

  # Global git config
  rm $HOME/.gitconfig
  ln -sf $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig
  echo_item "Updated gitconfig" "green"

  # ZSH config
  rm $HOME/.zshrc
  ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
  echo_item "Updated zshrc" "green"

  # Bash config
  rm $HOME/.bash_profile
  ln -sf $HOME/.dotfiles/bash_profile $HOME/.bash_profile
  echo_item "Updated bash_profile" "green"

  # Tmux config
  rm $HOME/.tmux.conf
  ln -sf $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf
  echo_item "Updated tmux configutation" "green"

  # Vim config
  rm $HOME/.vimrc
  ln -sf $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
  vim +PluginInstall
  echo_item "Updated vim configuration" "green"
else
  echo_item "Update failed" red
  exit 1
fi
