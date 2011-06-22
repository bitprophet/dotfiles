export ZSH=~/.zsh
for file in $ZSH/*; do
    [[ -f $file ]] && source $file
done
