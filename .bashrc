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
case $( hostname -s ) in
    sunner | jeff ) UC=$yellow LC=$green ;;
    bitprophet ) UC=$cyan ;;
    *-production ) UC=$red HD=$short ;;
esac

# Prompt itself
PS1="\[\033[01;${UC}m\]\u@$HD\[\033[00m\]:\[\033[01;${LC}m\]\w \$\[\033[00m\] "


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS. (from Debian)
shopt -s checkwinsize

# Expand aliases; needed to use below alises via Vim :sh / :!
shopt -s expand_aliases

# Colors and color ls
case $( uname -s ) in
    Linux )
        eval `dircolors -b` # sets and exports LS_COLORS for bash terminals
        alias ls='ls --color=always'
        ;;
    Darwin )
        export LSCOLORS="exfxcxdxbxegedabagacad"
        alias ls='ls -G'
        ;;
esac

#
# Global or semi-global exports 
#
export TERM="xterm-color"
export DISPLAY=:0.0
export EDITOR=vim

# MANPATH
ports_manpath=/opt/local/share/man
export MANPATH=$ports_manpath:$MANPATH

# PATH
ports_path=/opt/local/bin:/opt/local/sbin
vmware_path=/Library/Application\ Support/VMWare\ Fusion
redhat_sucks_path=/sbin:/usr/sbin
export PATH=$ports_path:$vmware_path:$redhat_sucks_path:$PATH

# SSH Keychain stuff
case $( uname -s ) in
    # OS X Keychain.app always uses the same value
    Darwin )
        export SSH_AUTH_SOCK=/tmp/503/SSHKeychain.socket
        ;;
    # But Ubuntu ssh-keychain doesn't seem to.
    Linux )
        if [ -x `which keychain` ]; then
            eval `keychain -q --eval id_rsa`
        fi
        ;;
esac

#
# Global or semi-global aliases
#
alias svim='sudo vim'
alias stail="sudo tail"
alias port="sudo port"
alias apt-get='sudo apt-get'
alias apt-cache='sudo apt-cache'
alias aptitude='sudo aptitude'
alias yum='sudo yum'

# Apache reload alias
if [ -f /etc/init.d/apache2 ]; then
    apache=apache2
elif [ -f /etc/init.d/httpd ]; then
    apache=httpd
fi
alias rap="sudo /etc/init.d/$apache reload"

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

