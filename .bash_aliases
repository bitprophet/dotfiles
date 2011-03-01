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
alias apt-file='sudo apt-file'
alias ash='aptitude show'
alias ai='aptitude install'
alias as='aptitude search'
alias au='aptitude update'
alias dl='dpkg --list'

# Git
if [[ -e `which hub 2>/dev/null` ]]; then
    alias git=hub
fi
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias glg="git log --graph --pretty=format:'%Cblue%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gpl='git pull'
alias gps='git push'
alias gs='git status'
alias gsd='git svn dcommit'
alias gsr='git svn rebase'
alias gsf='git svn fetch'
alias gt='git tag'
alias gr='git rel'
alias ga='git add'

# Make Git autocomplete work with some of the above
complete -o default -o nospace -F _git_log gl
complete -o default -o nospace -F _git_diff gd
complete -o default -o nospace -F _git_tag gt
complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_add ga

# RubyGems
alias gems='gem search -b'
alias geml='gem list -l'
alias gemi='gem install -b'
alias gemu='gem uninstall'

# Misc
alias tree='tree -Ca -I ".git|*.pyc|*.swp"'
alias screen='TERM=screen screen'
alias rmpyc='find . -type f -name "*.pyc" -print0 | xargs -0 rm'
alias rap="sudo /etc/init.d/apache2 reload"
alias ports="sudo lsof -i -P -sTCP:LISTEN"
alias v=vagrant


#
# More complicated stuff
#

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
