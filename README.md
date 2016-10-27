.dotfiles
=========

My dotfile configuration. Covers Neovim, TMUX, Git, ZSH, Ubersicht and some other things, too.

# Installing the doftiles

1. Pull the project into your home directory
   ```bash
   git clone https://github.com/alexlafroscia/dotfiles.git ~/.dotfiles
   git submodule update --init --recursive
   ```

2. Run the installation script
   ```bash
   ~/.dotfiles/install.sh
   ```

3. Unless you're me, change the Git configuration to your own name and email address

# Make `CAPSLOCK` Useful

I hate `CAPSLOCK` and don't find it useful at all. However, is _does_ occupy a really useful place on the keyboard.  I've found the best use for it to be mapping it such that tapping it sends `ESC` and holding it works as `CONTROL`.  This way, you can hold it down using your pinky finger as a modifier, or give it a quick tap to pop out of `insert` mode in Vim.

## Sierra

Karabiner no longer works on Sierra, so we need to devise another approach.

1. Download an install [Karabiner Elements][karabiner-elements]
2. Map `caps_lock` to `left_control`
3. Download [Hammerspoon][hammerspoon]
4. Add the contents of [this gist][hammerspoon-config] as your Hammerspoon config

The feel is a little different from the El Capitan one, but it works well enough until Karabiner works correctly entirely on it's own again.

## El Capitan

The instructions for doing this using Karabiner and Seil can be found [here][el-capitan-capslock-config].

[el-capitan-capslock-config]: https://gist.github.com/arbelt/b91e1f38a0880afb316dd5b5732759f1
[karabiner-elements]: https://github.com/tekezo/Karabiner-Elements
[hammerspoon]: https://github.com/Hammerspoon/hammerspoon
[hammerspoon-config]: https://gist.github.com/arbelt/b91e1f38a0880afb316dd5b5732759f1
