# vim: set filetype=sh :

# Expand aliases; needed to use below alises via Vim :sh / :!
shopt -s expand_aliases


# Colors and color ls
case $( uname -s ) in
    Linux )
        eval `dircolors -b` # sets and exports LS_COLORS for bash terminals
        alias ls='ls --color=auto'
        ;;
    Darwin )
        export LSCOLORS="ExfxcxdxbxEgEdabagacad"
        alias ls='ls -G'
        ;;
esac


#
# Basic, always-on aliases
#

# Sudo
alias svim='sudo vim'
alias stail="sudo tail"

# Package managers
alias apt-get='sudo apt-get'
alias apt-cache='sudo apt-cache'
alias aptitude='sudo aptitude'
alias yum='sudo yum'

# Git
if [[ -e `which hub 2>/dev/null` ]]; then
    alias git=hub
fi
alias gd='git diff'
alias gb='git branch -a'
alias gs='git status'
alias gps='git push'
alias gpl='git pull'
alias gc='git ci -m'
alias gsd='git svn dcommit'
alias gsr='git svn rebase'

# RubyGems
alias gems='gem search -b'
alias geml='gem list -l'
alias gemi='gem install -b'
alias gemu='gem uninstall'

# Misc
alias tree='tree -Ca -I ".git|*.pyc|*.swp"'
alias screen='TERM=screen screen'
alias ai='aptitude install'


#
# More complicated stuff
#

# Apache
if [ -f /etc/init.d/apache2 ]; then
    apache=apache2
elif [ -f /etc/init.d/httpd ]; then
    apache=httpd
fi
alias rap="sudo /etc/init.d/$apache reload"
alias rsap="sudo /etc/init.d/$apache restart"

# Platform specific 'ps' alias
case $(uname -s) in
    Darwin )
        alias ps='ps -T'
        ;;
esac

# Multiplatform sed tomfoolery
case $(uname -s) in
    # -E flag, and override macports sed=>gsed alias
    Darwin ) alias esed='/usr/bin/sed -E' ;;
    # -r flag with GNU sed on Linux/Cygwin/etc
    * ) alias esed='sed -r' ;;
esac
