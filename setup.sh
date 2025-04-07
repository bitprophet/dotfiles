# vim: set ft=zsh

# Exit on error.
set -e

# Fuckit, I guess we're just going back to the early 2000s, config management
# via shell script.

# Weird how brew has no 'install only if not installed' command or flag? I read
# the whole damn manpage...
INSTALLED_FORMULAE=$(brew list -1)
function brew-install() {
    formula=$@[-1]
    if $(echo $INSTALLED_FORMULAE | grep -q "^${formula}$"); then
        return
    fi
    brew install $@
}

if which brew &>/dev/null; then
    echo "Checking/installing CLI brew formulae..."
    typeset -a CLI_FORMULAE
    CLI_FORMULAE=(
        asciinema
        age
        bat
        btop
        # For gls, and many etc's.
        coreutils
        fswatch
        fzf
        gh
        gnu-sed
        # sometimes git, depending on how old builtin is
        httpie
        iperf3
        jq
        lazygit
        # Node mostly for CoC/LSP in vim.
        # NOTE: 'nodejs' seems to be an alias somehow? but it shows up in `brew
        # list` as 'node', so for idempotency...
        # NOTE: as is 'npm' so having both was dumb lol
        node
        pyenv
        tmux
        tmuxp
        tree
        vim
        watch
        wget
        # sometimes zsh, depending on how old builtin is
    )
    for formula in $CLI_FORMULAE; do
        brew-install $formula
    done

    echo "Checking/installing GUI brew formulae..."
    typeset -a GUI_FORMULAE
    GUI_FORMULAE=(
        alfred
        arq
        daisydisk
        firefox
        istat-menus
        iterm2
        lunar
        # TODO: trying out Sequoia new built-in tiling
        # TODO: assuming that's meh, see what else is out there besides
        # rectangle? otherwise...rectangle.
        # rectangle
        rocket
        signal
        slack
        tailscale
        vlc
        zoom
    )
    for formula in $GUI_FORMULAE; do
        brew-install --cask $formula
    done
fi



return




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

# Make a few dirs that I like to populate automatically, or from scratch, vs
# copying from $lastmachine.
mkdir -p ~/Code/{others,oss,personal}
# And let's extend this to git clones, why the fuck not!
