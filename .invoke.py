from pathlib import Path

# TODO: make sure having stuff in your local dev env (but not in
# setup.py/dev-reqs.txt) doesn't accidentally pollute, or get ripped out all
# the time by pip-sync or whatever.
# (basically: how to 'carry your own patchset' but for python deps?)
try:
    from icecream import install
    install()
except ImportError:
    pass

run = dict(
  shell=Path.home() / ".nix-profile" / "bin" / "zsh"
)
