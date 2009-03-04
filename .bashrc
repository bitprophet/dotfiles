# Multiplatform bashrc for use on OS X and Linux (Debian or RedHat families)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS. (from Debian)
shopt -s checkwinsize

# Green username for normal users, red for root.
PROMPT_COLOR='32'
if [[ `whoami` == 'root' ]]; then PROMPT_COLOR='31'; fi
PS1='\[\033[01;${PROMPT_COLOR}m\]\u@\H\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '

# Colors and color ls
export CLICOLOR="true"
export LSCOLORS="exfxcxdxbxegedabagacad"

# Global or semi-global exports 
export TERM="xterm-color"
export MANPATH=/opt/local/share/man:$MANPATH
export PATH=/opt/local/bin:/opt/local/sbin:/Library/Application\ Support/VMWare\ Fusion:$PATH
export DISPLAY=:0.0
export EDITOR=vim

# Global or semi-global aliases
alias svim='sudo vim'
alias stail="sudo tail"
alias port="sudo port"
alias apt-get='sudo apt-get'
alias apt-cache='sudo apt-cache'
alias aptitude='sudo aptitude'

# MacPorts bash completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Debian bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Single-system specific stuff
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

