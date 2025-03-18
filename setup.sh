# vim: set ft=zsh

# Exit on error.
set -e

# Make a few dirs that I like to populate automatically, or from scratch, vs
# copying from $lastmachine.
mkdir -p ~/Code/{others,oss,personal}

# Fuckit, I guess we're just going back to the early 2000s, config management
# via shell script.
if which brew &>/dev/null; then
    typeset -a CLI_FORMULAE
    CLI_FORMULAE=(
        asciinema
        bat
        btop
        fswatch
        fzf
        gh
        # sometimes git, depending on what version macOS shipped
        httpie
        iperf3
        jq
        lazygit
        # Node mostly for CoC/LSP in vim.
        nodejs
        npm
        pyenv
        tmux
        tmuxp
        tree
        vim
        wget
        # sometimes zsh, ditto
    )
    brew install $CLI_FORMULAE

    typeset -a GUI_FORMULAE
    GUI_FORMULAE=(
        firefox
    )
    brew install $GUI_FORMULAE
fi

# Let it be known that I hate this. But doing these kinds of things inside
# .vimrc files is flaky, multiple vim-plug plugins need a full relaunch to
# work.
typeset -a COC_EXTENSIONS
COC_EXTENSIONS=(
    coc-json@1.9.2
    coc-pyright@1.1.390
)
vim '+PlugUpdate | qa!'
# CocInstall -sync doesn't seem to show output for w/e reason. For now I think
# it's least-bad to let it run normally (async but w/ output visible) at cost
# of having to manually quit vim after (the horror!)
vim "+CocInstall ${COC_EXTENSIONS}"
