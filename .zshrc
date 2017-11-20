# Zsh dotdir folder (not actually setting ZDOTDIR tho, no point?)
export ZSH=~/.zsh

# Data directory
[[ -d $ZSH/data ]] || mkdir $ZSH/data

# Source some third party stuff
fpath=($ZSH/contrib $fpath)

# Source my dotfiles (in explicit order)
typeset -a DOTFILES
DOTFILES=(
    pre-local
    options
    exports
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
