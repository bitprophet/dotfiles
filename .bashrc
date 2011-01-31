#
# Multiplatform bashrc for use on OS X and Linux (Debian or RedHat families)
#


# Set interactive flag; occasionally useful for turning stuff off, e.g.
# keychain
INTERACTIVE=`echo $- | grep i`

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS. (from Debian)
shopt -s checkwinsize


#
# Exports 
#

. ~/.bash_exports


#
# Tab completion
#

# Homebrew
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi

# Debian
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


#
# Aliases
#

. ~/.bash_aliases


#
# Python stuff (virtualenvwrapper, pip)
#

. ~/.bash_python


#
# Ruby stuff (RVM, gem paths)
#

. ~/.bash_ruby


#
# wk*()
#

. ~/.bash_wk


#
# Shell prompt
#

. ~/.bash_prompt


#
# System-specific stuff
#

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
