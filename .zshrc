#
# jforcier's zshrc, initially based on his bash dotfiles.
#
# Most interesting material is contained in sub-files included below;
# directives in here are typically basic "front matter" that needs to come
# before anything else.
#

# Abstract out where the zsh specific files live
export ZSH=~/.zsh

# General zsh settings

# Platform-specific aliases/exports
source $ZSH/platform

# Environment variables
source $ZSH/exports

# Aliases
source $ZSH/aliases

# Tab completion
source $ZSH/completion

# History settings
source $ZSH/history

# Prompt
source $ZSH/prompt

# Python

# Ruby

# Wk

# Local
