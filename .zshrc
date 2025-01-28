# Zsh dotdir folder (not actually setting ZDOTDIR tho, no point?)
export ZSH=~/.zsh

# Data directory
[[ -d $ZSH/data ]] || mkdir $ZSH/data

# Source some third party stuff
fpath=($ZSH/contrib $fpath)

# Helper for various 'is X on my path? then Y' tests in the below dotfiles
function have() {
    which $1 &>/dev/null
}

# Source my dotfiles (in explicit order)
typeset -a DOTFILES
DOTFILES=(
    platform
    pre-local
    options
    exports
    mid-local
    completion
    aliases
    platform
    history
    python
    ruby
    perl
    wk
    prompt
    zmv
    fzf
    local
)
for file in $DOTFILES; do
    file=$ZSH/$file
    [[ -f $file ]] && source $file
done

# Sanity cleanup of PATH, which otherwise can grow duplicate entries (making
# troubleshooting harder than it needs to be)
typeset -U PATH
