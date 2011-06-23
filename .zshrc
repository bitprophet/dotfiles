# Zsh dotdir folder (not actually setting ZDOTDIR tho, no point?)
export ZSH=~/.zsh

# Source some third party stuff
fpath=($ZSH/contrib $fpath)

# Source my dotfiles
for file in $ZSH/*; do
    [[ -f $file ]] && source $file
done
