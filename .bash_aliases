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
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -m'
alias gca='git ci -m'
alias gd='git diff'
alias gl='git log'
alias glg="git log --graph --pretty=format:'%Cblue%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias gsd='git svn dcommit'
alias gsr='git svn rebase'
alias gsf='git svn fetch'
alias gt='git tag'

# Make Git autocomplete work with some of the above
complete -o default -o nospace -F _git_log gl
complete -o default -o nospace -F _git_diff gd
complete -o default -o nospace -F _git_tag gt


# RubyGems
alias gems='gem search -b'
alias geml='gem list -l'
alias gemi='gem install -b'
alias gemu='gem uninstall'

# Misc
alias tree='tree -Ca -I ".git|*.pyc|*.swp"'
alias screen='TERM=screen screen'
alias rmpyc='find . -type f -name "*.pyc" -print0 | xargs -0 rm'


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
