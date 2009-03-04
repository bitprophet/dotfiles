# Multiplatform bashrc for use on OS X and Linux (Debian or RedHat families)


# Colorized prompt, with different username colors for different systems.

# Color codes
red='31'
green='32'
yellow='33'
blue='34'
purple='35'
cyan='36'
white='37'

# Hostname styles
full='\H'
short='\h'

# System => color/hostname map:
#   UC: username color
#   LC: location/cwd color
#   HD: hostname display (\h vs \H)
# Defaults:
UC=$green
LC=$blue
HD=$full
case $( hostname ) in
    sunner | jeff ) UC=$yellow LC=$green ;;
    bitprophet.org ) UC=$cyan ;;
    *-production ) UC=$red HD=$short ;;
esac

# Prompt itself
PS1="\[\033[01;${UC}m\]\u@$HD\[\033[00m\]:\[\033[01;${LC}m\]\w \$\[\033[00m\] "


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS. (from Debian)
shopt -s checkwinsize

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
alias yum='sudo yum'

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

