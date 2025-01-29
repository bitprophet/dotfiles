# vim: set ft=zsh

# Let it be known that I hate this. But doing these kinds of things inside
# .vimrc files is flaky, multiple vim-plug plugins need a full relaunch to
# work.
typeset -a COC_EXTENSIONS
COC_EXTENSIONS=(
    coc-basedpyright@1.19.0
)
vim '+PlugUpdate | qa!'
# CocInstall -sync doesn't seem to show output for w/e reason. For now I think
# it's least-bad to let it run normally (async but w/ output visible) at cost
# of having to manually quit vim after (the horror!)
vim "+CocInstall ${COC_EXTENSIONS}"
