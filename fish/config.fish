# Set editor based on shell
if test "$TERM_PROGRAM" = "vscode"
    set -gx EDITOR (which code)
else
    set brewPrefix (brew --prefix)
    set -gx EDITOR "$brewPrefix/bin/nvim"
end

# Bootstrap `fisher` installation if missing
if not functions -q fisher
    set -q XDG_CONFIG_HOME
    or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# -- Aliases -------------------------------------------------------------------
alias edit="$EDITOR"

if functions -q hub
    alias git=hub
end

if functions -q gittower
    set root (git rev-parse --show-toplevel)
    alias tower='gittower $roott'
end
thefuck --alias | source
