# Zsh dotdir folder (not actually setting ZDOTDIR tho, no point?)
export ZSH=~/.zsh

# Data directory
[[ -d $ZSH/data ]] || mkdir $ZSH/data

# Helper for various 'is X on my path? then Y' tests in the below dotfiles
function have() {
    which $1 &>/dev/null
}

# Source my dotfiles (in explicit order)
typeset -a DOTFILES
DOTFILES=(
    # Non-source-controlled local early hooks.
    pre-local
    # Very early platform-specific things like loading homebrew and setting
    # $PLATFORM which other files might reference.
    platform
    # Completion system initialization/global config. Also wants to be early so
    # other files can use eg compdef, compctl.
    completion
    # Everything below here is in rough order of priority but should generally
    # be interchangeable?
    options
    exports
    path
    aliases
    mux
    history
    python
    ruby
    wk
    prompt
    zmv
    fzf
    direnv
    # Non-source-controlled local late hooks.
    local
)
for file in $DOTFILES; do
    file=$ZSH/$file
    [[ -f $file ]] && source $file
done
