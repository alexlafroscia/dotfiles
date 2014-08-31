.dotfiles
=========

My dotfile configutation

## Table of Contents
1. [Installing the dotfiles](#installing-the-dotfiles)
2. [Adding your own configuration](#adding-your-own-configuration)

# Installing the doftiles

#### 1. Pull the project into your home directory
```bash
git clone git@github.com:alexlafroscia/.dotfiles.git ~/.dotfiles
```

#### 2. Run the installation script
```bash
~/.dotfiles/install.sh
```

#### 3. ???

### 4. Profit

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
