# -- Zsh -----------------------------------------------------------------------
# Path to your oh-my-zsh configuration.
ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM="$HOME/.dotfiles/zsh-custom"

# -- Editor --------------------------------------------------------------------
EDITOR="vim"

# -- Theme ---------------------------------------------------------------------
# Set name of the theme to load.
# Look in /Users/alex/.dotfiles/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
DEFAULT_USER='alex'
ZSH_THEME="agnoster-custom"

# -- Plugins -------------------------------------------------------------------
# Plugins can be found in /Users/alex/.dotfiles/.oh-my-zsh/plugins/
# Custom plugins may be added to /Users/alex/.dotfiles/.oh-my-zsh/custom/plugins/
#
# Which plugins would you like to load?
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rbenv bower bundle git-flow)

# -- Oh My Zsh -----------------------------------------------------------------
source $ZSH/oh-my-zsh.sh

# -- Options -------------------------------------------------------------------
setopt   auto_name_dirs
unsetopt correct_all
unsetopt correct

# -- Variables -----------------------------------------------------------------
export EDITOR=/usr/local/bin/vim

# -- Aliases -------------------------------------------------------------------
if [[ -f "$HOME/.dotfiles/aliases" ]]; then
  source $HOME/.dotfiles/aliases
fi

if [[ -f "$HOME/.aliases" ]]; then
    source $HOME/.aliases
fi

# -- Rbenv ---------------------------------------------------------------------
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

# -- Solarized 256 Color Hack --------------------------------------------------
export TERM="screen-256color"
alias tmux="tmux -2"

# -- Functions -----------------------------------------------------------------

tmuxx() {
  tmux a || tmux new
}

function marked {
  open -a "Marked 2.app" $@
}

pyserve() {
  python -m SimpleHTTPServer
}

# Extract
# Extract archive based on file type
# Taken from http://justinlilly.com/dotfiles/zsh.html
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)        tar xjf $1        ;;
            *.tar.gz)         tar xzf $1        ;;
            *.bz2)            bunzip2 $1        ;;
            *.rar)            unrar x $1        ;;
            *.gz)             gunzip $1         ;;
            *.tar)            tar xf $1         ;;
            *.tbz2)           tar xjf $1        ;;
            *.tgz)            tar xzf $1        ;;
            *.zip)            unzip $1          ;;
            *.Z)              uncompress $1     ;;
            *)                echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# -- Tmux ----------------------------------------------------------------------

export DISABLE_AUTO_TITLE="true"

# -- Tmuxinator ----------------------------------------------------------------
if type "tmuxinator" >/dev/null 2>/dev/null; then
  source $HOME/.dotfiles/bin/tmuxinator.zsh
fi

# -- Local Configuration -------------------------------------------------------
if [[ -f "$HOME/.zshrc.local" ]]; then
  source $HOME/.zshrc.local
fi
