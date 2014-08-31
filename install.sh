#!/bin/bash
# Install .dotfiles



# -- TMUX ----------------------------------------------------------------------
ln -sf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf

# -- VIM -----------------------------------------------------------------------
# Link the dotfiles

# TODO: Ask if the user wants to copy the current configuration to a .local file
ln -sf $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -sf $HOME/.dotfiles/vimrc.bundles $HOME/.vimrc.bundles

# Install Vundle
if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
