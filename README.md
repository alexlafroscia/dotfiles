.dotfiles
=========

My dotfile configutation

## Table of Contents
1. [Installing the dotfiles](#installing-the-dotfiles)
2. [Adding your own configuration](#adding-your-own-configuration)
3. [Tweaking my dotfiles](#tweaking-my-dotfiles)
4. [Resetting Vim Plugins](#resetting-vim-plugins)
5. [Todo list](#todo-list)

# Installing the doftiles

1. Pull the project into your home directory
   ```bash
   git clone https://github.com/alexlafroscia/.dotfiles.git ~/.dotfiles
   ```

2. Run the installation script
   ```bash
   ~/.dotfiles/install.sh
   ```

3. ???

4. Profit

# Adding your own configuration
If you want to add your own configuration without making changes without
modifying my dotfiles directly, add a configuration file for the given program
in the home directory that ends with `.local`.  For example, if you wanted to
add your own `vim` configuration, you would create a file called `.vimrc.local`,
which my dotfile will automatically detect and load after my configuration has
been loaded.

The systems that currently support this are:
- Vim
- Tmux

# Tweaking my dotfiles
Adding to my own dotfiles is totally welcome too, especially if you're forking
this repo to manage your own.  If that's the case, make sure to edit the files
within the `~/.dotfiles` repository, since the files in your home directory are
actually just symlinks anyway.

# Resetting Vim Plugins
Under some circumstances, like with limited disk space (I've encountered this
trying to use these dotfiles in a server that my school set up) you don't want
to install all of the plugins, or some of them will fail to install.  To correct
this, there's what I did, and what I'd recommend that you do, too

1. Delete all of your Vim plugins
   ```bash
   rm -rf ~/.vim/bundle
   ```

2. Re-install the Vim configuration from the .dotfiles
   ```bash
   ~/.dotfiles/install.sh
   ```

3. Comment out any plugins that you don't want to install from `vimrc.bundles`

4. Run `:PluginInstall` from within Vim

# Todo List
- [ ] Add a configuration set in the beginning of the script to optionally skip
      installing certain tools
- [ ] Automatically install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)
- [ ] Install NPM if needed, along with Bower and other global packages
