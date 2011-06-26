# Zsh dotdir folder (not actually setting ZDOTDIR tho, no point?)
export ZSH=~/.zsh

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
    local
)
for file in $DOTFILES; do
    file=$ZSH/$file
    [[ -f $file ]] && source $file
done
