#
# Multiplatform bashrc for use on OS X and Linux (Debian or RedHat families)
#

# Set interactive flag; occasionally useful for turning stuff off, e.g. keychain
INTERACTIVE=`echo $- | grep i`


#
# Colorized prompt, with different username colors for different systems.
#

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
# Manually cut hostname; hostname -s bails out on some systems.
case $( hostname | cut -d '.' -f 1 ) in
    sunner | jeff ) UC=$yellow LC=$green ;;
    bitprophet ) UC=$cyan ;;
    *-production ) UC=$red HD=$short ;;
    mail | code | bacula | www* | monitor | bender | xen ) UC=$red ;;
esac

# Prompt itself
PS1="\[\033[01;${UC}m\]\u@$HD\[\033[00m\]:\[\033[01;${LC}m\]\w \$\[\033[00m\] "



#
# Miscellaneous shell builtin tweaks
#

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
        export LSCOLORS="ExfxcxdxbxEgEdabagacad"
        alias ls='ls -G'
        ;;
esac



#
# Exports 
#

# General
export TERM="xterm-color"
export DISPLAY=:0.0
export EDITOR=vim

# MANPATH
ports_manpath=/opt/local/share/man
export MANPATH=$ports_manpath:$MANPATH

# PATH
ports_path=/opt/local/bin:/opt/local/sbin:/opt/local/Library/Frameworks/Python.framework/Versions/2.5/bin/
vmware_path=/Library/Application\ Support/VMWare\ Fusion
redhat_path=/sbin:/usr/sbin
ruby_path=/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin
local=/usr/local/bin:/usr/local/sbin
export PATH=$ports_path:$vmware_path:$redhat_path:$ruby_path:$local:$PATH

# SSH Keychain
case $( uname -s ) in
    # OS X Keychain.app always uses the same value
    Darwin )
        export SSH_AUTH_SOCK=/tmp/503/SSHKeychain.socket
        ;;
    # But Ubuntu ssh-keychain doesn't seem to.
    Linux )
        keychain=`which keychain 2>/dev/null`
        if [ -n "$keychain" ] && [ -x $keychain ]; then
            ARGS="--nogui -q --eval id_rsa"
            # Don't want noninteractive shells to get hung up on the prompt.
            if [[ -z $INTERACTIVE ]]; then
                ARGS="--noask $ARGS"
            fi
            eval `keychain $ARGS`
        fi
        ;;
esac



#
# Aliases
#

alias svim='sudo vim'
alias stail="sudo tail"
alias port="sudo port"
alias apt-get='sudo apt-get'
alias apt-cache='sudo apt-cache'
alias aptitude='sudo aptitude'
alias yum='sudo yum'
alias gem='sudo gem'
alias tree='tree -Ca -I ".git|*.pyc|*.swp"'
alias screen='TERM=screen screen'

# Apache reload alias
if [ -f /etc/init.d/apache2 ]; then
    apache=apache2
elif [ -f /etc/init.d/httpd ]; then
    apache=httpd
fi
alias rap="sudo /etc/init.d/$apache reload"



#
# Tab completion
#

# MacPorts
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Debian
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi



#
# Virtualenvwrapper support
#

# virtualenvwrapper
case $( uname -s ) in
    Darwin )
        # Leopard
        if [ `uname -r` == '9.6.0' ]; then
            virtualenvwrapper=/usr/local/bin/virtualenvwrapper_bashrc
        # Tiger
        else
            virtualenvwrapper=/opt/local/Library/Frameworks/Python.framework/Versions/2.5/bin/virtualenvwrapper_bashrc
        fi
        workon_home= # just use default ~/.virtualenvs
        ;;
    Linux )
        virtualenvwrapper=/usr/bin/virtualenvwrapper_bashrc
        # Relatively arbitrarily chose /opt/envs. Could also have gone with
        # /opt/virtualenvs perhaps.
        workon_home=/opt/envs
        ;;
esac
if [ -f $virtualenvwrapper  ]; then
    export WORKON_HOME=$workon_home
    source $virtualenvwrapper
fi



#
# Functions
#

function wwwify() {
    if [[ ! -a $1 ]]
    then
        echo "Need a filename to operate on."
        return 1
    fi

    sudo chown -R www-data:www-data $1
    sudo chmod -R g+w $1
}


exclude="\.git|\.swp|\.coverage|\.pyc|_build"
function pgrep() {
    egrep -lir "$1" . | egrep -v "$exclude"  | xargs egrep -Hin --color "$1"
}

function pvim() {
    vim -p `grep -lir "$1" . | egrep -v "$exclude"`
}
    



#
# System-specific local aliases and such
#

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
