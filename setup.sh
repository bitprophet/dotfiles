# vim: set ft=zsh

# Exit on error.
set -e

# Minimum viable bootstrap to run Hemera. UV makes this a little easier now! as
# do my dotfiles, which set $PLATFORM based on whatever heuristics.
# Linux is noop on assumption system installed via custom ISO. Which leaves
# Mac.
case $PLATFORM in
    linux )
        echo "Why are you running setup.sh on Linux? Just use Hemera directly."
        return 1
        ;;
    mac )
        brew install uv
        # TODO: I /could/ set up hemera to be a truly /installable/ python
        # project with a CLI entrypoint, then aim uv at it like so:
        #
        #   uv tool run --from "git@ssh://git@github.com/bitprophet/hemera" \
        #       nameofclitoolhere --args
        #
        # which would use an ephemeral venv to execute.
        # TODO: however that got a bit messy fast and it's not like I /don't/
        # want to end up with a real project checkout eventually, so this just
        # duplicates a teensy bit of what Hemera does internally re: such
        # checkouts...probably fine for now? esp given how infrequently I set
        # up new macs?
        _CHECKOUT=~/Code/personal
        mkdir -p $_CHECKOUT
        git clone git@github.com:bitprophet/hemera ${_CHECKOUT}/hemera
        echo
        wk hemera
        inv mac
        ;;
esac

return


# TODO: move below into Hemera

if which brew &>/dev/null; then
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
        uv
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
        breaktimer
        daisydisk
        firefox
        istat-menus
        iterm2
        lunar
        rectangle
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


# Vim plugin setup, including CoC with its npm stuff.
# Let it be known that I hate this. But doing these kinds of things inside
# .vimrc files is flaky, multiple vim-plug plugins need a full relaunch to
# work.
typeset -a COC_EXTENSIONS
COC_EXTENSIONS=(
    coc-json@1.9.2
    coc-pyright@1.1.390
)
# Basic idempotency re: vim-plug and CoC. Assume I am not using this script for
# intermediate updates or additions, otherwise this needs more love.
echo "Checking/installing vim plugins..."
if [[ ! -d ~/.vim/plugged || ! -d ~/.config/coc/extensions/node_modules ]]; then 
    vim '+PlugUpdate | qa!'
    # CocInstall -sync doesn't seem to show output for w/e reason. For now I think
    # it's least-bad to let it run normally (async but w/ output visible) at cost
    # of having to manually quit vim after (the horror!)
    vim "+CocInstall ${COC_EXTENSIONS}"
fi
