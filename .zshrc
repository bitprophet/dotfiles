# Zsh dotdir folder (not actually setting ZDOTDIR tho, no point?)
export ZSH=~/.zsh

# Data directory
[[ -d $ZSH/data ]] || mkdir $ZSH/data

# Helper for various 'is X on my path? then Y' tests in the below dotfiles
function have() {
    which $1 &>/dev/null
}

# Load, initialize advanced completion
# (Do this early so any other rc files may use eg compdef, compctl. Used to
# live inside completion file but that needed to move late so it could 'see'
# other functions etc!)
autoload -U compinit && compinit

# Source my dotfiles (in explicit order)
typeset -a DOTFILES
DOTFILES=(
    platform
    pre-local
    options
    exports
    path
    aliases
    platform
    history
    python
    ruby
    wk
    prompt
    zmv
    fzf
    direnv
    completion
    local
)
for file in $DOTFILES; do
    file=$ZSH/$file
    [[ -f $file ]] && source $file
done
