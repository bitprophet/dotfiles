# Zsh dotdir folder (not actually setting ZDOTDIR tho, no point?)
export ZSH=~/.zsh

# Data directory
[[ -d $ZSH/data ]] || mkdir $ZSH/data

# Source some third party stuff
fpath=($ZSH/contrib $fpath)

# Source my dotfiles (in explicit order)
typeset -a DOTFILES
DOTFILES=(
    options
    exports
    completion
    aliases
    platform
    history
    python
    ruby
    wk
    prompt
    zmv
    local
)
for file in $DOTFILES; do
    file=$ZSH/$file
    [[ -f $file ]] && source $file
done
