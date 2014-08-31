# -- Zsh -----------------------------------------------------------------------
# Path to your oh-my-zsh configuration.
ZSH="/Users/alex/.dotfiles/.oh-my-zsh"

# -- Editor --------------------------------------------------------------------
EDITOR="vim"

# -- Theme ---------------------------------------------------------------------
# Set name of the theme to load.
# Look in /Users/alex/.dotfiles/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
DEFAULT_USER='alex'
ZSH_THEME="agnoster"

# -- Plugins -------------------------------------------------------------------
# Plugins can be found in /Users/alex/.dotfiles/.oh-my-zsh/plugins/
# Custom plugins may be added to /Users/alex/.dotfiles/.oh-my-zsh/custom/plugins/
#
# Which plugins would you like to load?
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rbenv bower bundle)

# -- Oh My Zsh -----------------------------------------------------------------
source $ZSH/oh-my-zsh.sh

# -- Options -------------------------------------------------------------------
unsetopt correct_all
unsetopt correct

# -- Aliases -------------------------------------------------------------------
source $HOME/.dotfiles/.aliases

if [[ -f "$HOME/.aliases" ]]; then
    source $HOME/.aliases
fi

# -- Rbenv ---------------------------------------------------------------------
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# -- Update --------------------------------------------------------------------
dotfiles

# -- Solarized 256 Color Hack --------------------------------------------------
export TERM="screen-256color"
alias tmux="tmux -2"
