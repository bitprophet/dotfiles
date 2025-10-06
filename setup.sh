# vim: set ft=zsh

# Exit (return) on error.
set -o ERR_RETURN

# Minimum viable bootstrap to run Hemera. UV makes this a little easier now! as
# do my dotfiles, which set $PLATFORM based on whatever heuristics.
export UV_PROJECT_ENVIRONMENT="${WORKON_HOME}/hemera"
export CHECKOUT=~/Code/personal/hemera

case $PLATFORM in
    linux )
        # Noop for now; assumes this is inside a Hemera-installed system where
        # we already have the git checkout and just need to do the venv
        # creation (as those are poorly relocatable even in the 2020s, sigh).
        ;;

    mac )
        # TODO: I /could/ set up hemera to be a truly /installable/ python
        # project with a CLI entrypoint, then aim uv at it like so:
        #
        #   uv tool run --from "git@ssh://git@github.com/bitprophet/hemera" \
        #       nameofclitoolhere --args
        #
        # which would use an ephemeral venv to execute.
        # TODO: however that got a bit messy fast and it's not like I /don't/
        # want to end up with a real project checkout eventually, so below just
        # duplicates a teensy bit of what Hemera does internally re: such
        # checkouts...probably fine for now? esp given how infrequently I set
        # up new macs? ehhh we'll see, if it drifts too much or too fast I'll
        # reconsider!

        # Reuse some bits (as this is often run in a fresh shell)
        source ~/.zsh/python
        REPO="git@github.com:bitprophet/hemera"

        brew install uv
        echo
        mkdir -p $(dirname $CHECKOUT)
        git clone $REPO $CHECKOUT
        echo
        ;;
esac

cd $CHECKOUT
# --seed to inject pip etc
uv venv --seed
# Hemera has a pyproject.toml now
uv sync

echo
echo "All done! Please execute 'wk hemera && inv converge'."
