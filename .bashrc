#
# Multiplatform bashrc for use on OS X and Linux (Debian or RedHat families)
#


# Set interactive flag; occasionally useful for turning stuff off, e.g. keychain
INTERACTIVE=`echo $- | grep i`


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
        alias ls='ls --color=auto'
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
if [[ `uname -s` == *CYGWIN* ]]; then
    export TERM="cygwin"
fi
export DISPLAY=:0.0
export EDITOR=vim

# MANPATH
ports_manpath=/opt/local/share/man
export MANPATH=$ports_manpath:$MANPATH

# PATH
my_path=$HOME/bin
ports_path=/opt/local/bin:/opt/local/sbin:/opt/local/Library/Frameworks/Python.framework/Versions/2.5/bin/
vmware_path=/Library/Application\ Support/VMWare\ Fusion
redhat_path=/sbin:/usr/sbin
ruby_path=/System/Library/Frameworks/Ruby.framework/Versions/1.8/usr/bin
local_path=/usr/local/bin:/usr/local/sbin
export PATH=$my_path:$vmware_path:$redhat_path:$ruby_path:$local_path:$ports_path:$PATH

# History stuff
shopt -s histappend
shopt -s histverify
export HISTSIZE=
export HISTFILESIZE=

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
alias tree='tree -Ca -I ".git|*.pyc|*.swp"'
alias screen='TERM=screen screen'
if [[ -e `which hub 2>/dev/null` ]]; then
    alias git=hub
fi
alias ai='aptitude install'
alias gd='git diff'
alias gb='git branch -a'
alias gs='git status'
alias gps='git push'
alias gpl='git pull'
alias gc='git ci -m'

# Apache aliases
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

# Platform specific RubyGems stuff:
# * servers get sudo'd gem
# * workstations get Homebrew gem path stuff
if [[ $(uname -s) != 'Darwin' ]]; then
    alias gem='sudo gem'
else
    BREW_PREFIX=$(brew --prefix)
    export GEM_HOME="$BREW_PREFIX/Cellar/Gems/1.8"
    export GEM_PATH="$BREW_PREFIX/Cellar/Gems/1.8:/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/lib/ruby/gems/1.8/gems"
fi

# More gem aliases. sigh.
alias gems='gem search -b'
alias geml='gem list -l'
alias gemi='gem install -b'
alias gemu='gem uninstall'


#
# Tab completion
#

# Homebrew
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
# MacPorts (only test if not homebrew)
elif [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Debian
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


#
# Virtualenvwrapper support
#

# Shell hooks; look in all possible locations and for both old and new versions
# of the script, just in case I find myself on an older system.
ROOTS="/opt/local/Library/Frameworks/Python.framework/Versions/2.5/bin /usr/bin /usr/local/bin"
SUFFIXES="_bashrc .sh"
for root in $ROOTS; do
    for suffix in $SUFFIXES; do
        path=$root/virtualenvwrapper$suffix
        if [[ -f $path ]]; then
            virtualenvwrapper=$path
        fi
    done
done
# System-specific $WORKON_HOME: servers get system location, workstations get
# homedir location.
case $( uname -s ) in
    Darwin ) 
        workon_home=~/.virtualenvs ;;
    Linux )
        workon_home=/opt/envs ;;
esac
if [[ -n "$virtualenvwrapper" && -f $virtualenvwrapper ]]; then
    export WORKON_HOME=$workon_home
    source $virtualenvwrapper
fi


#
# Pip env vars
#

# Respect my virtualenvs, please
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME
# Don't litter pip_log.txt files in cwd!
export PIP_LOG_FILE='/tmp/pip-log.txt'
# Use a cache
export PIP_DOWNLOAD_CACHE='/tmp/pip_cache'


#
# Try to make up for Ruby's lack of easy setup.py develop sorta thing.
#

function fakegem() {
    if [[ `env | grep GEM_HOME` ]]; then
        projects=~/Documents/Code
        for project in `ls -1 $projects`; do
            bin=$projects/$project/bin
            lib=$projects/$project/lib
            # if project seems to be ruby and doesn't exist as an installed gem
            has_ruby=`find $projects/$project -name "*.rb"`
            has_gem=`find $GEM_HOME/gems -maxdepth 1 -mindepth 1 -name "$project*"`
            # and if it's not already in our bin/lib paths
            in_path=`echo $PATH | grep $bin`
            in_lib=`echo $RUBYLIB | grep $lib`
            if ( \
                [[ $has_ruby ]] \
                && [[ ! $has_gem ]] \
                && [[ ! ($in_path || $in_lib) ]] \
            ); then
                # add project/bin to PATH and project/lib to RUBYLIB
                export PATH=$PATH:$bin
                if [[ `env | grep RUBYLIB` ]]; then
                    export RUBYLIB=$RUBYLIB:$lib
                else
                    export RUBYLIB=$lib
                fi
            fi
        done
    fi
}
fakegem

#
# RVM (may eventually replace the above, probably overwrites it anyway)
#

_rvm_home=~/.rvm
_rvm=$_rvm_home/scripts/rvm
if [[ -s $_rvm ]] ; then
    source $_rvm
    source $_rvm_home/scripts/completion
    # Undo earlier sudo gem alias, even if we're on a server
    if [[ $(alias gem 2>/dev/null) ]]; then unalias gem; fi
fi

function activate_gemset() {
    gemset=$1
    matches=`find $_rvm_home/gems -type d -mindepth 1 -maxdepth 1 -name "*@$gemset"`
    if [[ -n $matches ]]; then
        num_matches=`echo "$matches" | wc -l`
        if [[ $num_matches -eq 1 ]]; then
            rvm `basename $matches`
        fi
    fi
}


#
# Generic "move me to my project dir" function/alias.
#
# Tries to "workon" a Python virtualenv, then (either way) switches to the
# directory in question.
#
# This means that we can A) use this for non-Python projects, and B) avoid
# having to add the 'cd' call to every. single. virtualenv's postactivate
# script.
#
# Also deactivates any currently active virtualenv, just for neatness' sake.
#

PERSONAL=~/Documents/Code
DJANGO=/srv/django
RAILS=/srv/rails
FOLDERS="$PERSONAL $DJANGO $RAILS"

function wk() {
    # deactivate/workon will fail silently if project is not a virtualenv.
    deactivate 2>/dev/null
    workon $1 2>/dev/null
    # Ditto for my custom "workon" for RVM
    activate_gemset $1
    # Try to find the given folder and cd to it.
    for folder in $FOLDERS; do
        target=$folder/$1
        if [[ -d $target ]]; then
            cd $target
            return 0
        fi
    done
    return 1
}

function _wk() {
    local curw
    COMPREPLY=()
    curw=${COMP_WORDS[COMP_CWORD]}
    projects=`find $FOLDERS -mindepth 1 -maxdepth 1 -type d -exec basename {} \; 2>/dev/null`
    COMPREPLY=($(compgen -W '$projects' -- $curw))
    return 0
}

complete -F _wk wk


#
# Colorized prompt, with different username colors for different systems.
#

# Color codes
RED='\[\033[01;31m\]'
GREEN='\[\033[01;32m\]'
YELLOW='\[\033[01;33m\]'
BLUE='\[\033[01;34m\]'
PURPLE='\[\033[01;35m\]'
CYAN='\[\033[01;36m\]'
WHITE='\[\033[01;37m\]'
NIL='\[\033[00m\]'

# Hostname styles
FULL='\H'
SHORT='\h'

# System => color/hostname map:
#   UC: username color
#   LC: location/cwd color
#   HD: hostname display (\h vs \H)
# Defaults:
UC=$GREEN
LC=$BLUE
HD=$FULL

HOST=`hostname | cut -d '.' -f 1`
DOMAIN=`hostname | cut -d '.' -f 2-`

# Manually cut hostname; hostname -s bails out on some systems.
case $HOST in
    jeff | ytram ) UC=$YELLOW LC=$GREEN HD=$SHORT ;;
    bitprophet ) UC=$CYAN ;;
    *-production ) UC=$RED HD=$SHORT ;;
    mail | code | bacula | www* | monitor | bender | xen ) UC=$RED ;;
esac

# Some special cases to the above
if [[ ($HOST == "monitor") && ($DOMAIN == "bitprophet.org") ]]; then
    UC=$CYAN HD=$SHORT
fi

# Multiplatform sed tomfoolery used below (extended regexp)
case $(uname -s) in
    # -E flag, and override macports sed=>gsed alias
    Darwin ) alias esed='/usr/bin/sed -E' ;;
    # -r flag with GNU sed on Linux/Cygwin/etc
    * ) alias esed='sed -r' ;;
esac


# Prompt function because PROMPT_COMMAND is awesome
function set_prompt() {
    # If logged in as another user, not gonna have all this firing anyway.
    # So let's just show the host only and be done with it.
    host="${UC}${HD}${NIL}"

    # Special vim-tab-like shortpath (~/folder/directory/foo => ~/f/d/foo)
    _pwd=`pwd | sed "s#$HOME#~#"`
    if [[ $_pwd == "~" ]]; then
        _dirname=$_pwd
    else
        _dirname=`dirname "$_pwd" | esed "s/\/(.)[^\/]*/\/\1/g"`
        if [[ $_dirname == "/" ]]; then
            _dirname=""
        fi
        _dirname="$_dirname/`basename "$_pwd"`"
    fi
    path="${LC}${_dirname}${NIL}"

    # Virtualenv
    _venv=`basename "$VIRTUAL_ENV"`
    venv="" # need this to clear it when we leave a venv
    if [[ -n $_venv ]]; then
        venv=" ${NIL}{${PURPLE}${_venv}${NIL}}"
    fi

    # RVM (steals the venv slot if there's no venv)
    if [[ -s $_rvm && -z $_venv ]]; then
        # Just show Ruby gemset.  I don't use different interpreter lines, nor
        # do I care about patchlevel.
        _venv=`$_rvm_home/bin/rvm-prompt g`
        if [[ "$_venv" != "system" && -n $_venv ]]; then
            venv=" ${NIL}{${PURPLE}${_venv}${NIL}}"
        fi
    fi

    # Git branch / dirtiness
    # Dirtiness cribbed from:
    # http://henrik.nyh.se/2008/12/git-dirty-prompt#comment-8325834
    if git update-index -q --refresh 2>/dev/null; git diff-index --quiet --cached HEAD --ignore-submodules -- 2>/dev/null && git diff-files --quiet --ignore-submodules 2>/dev/null
        then dirty=""
    else
        dirty="${RED}*${NIL}"
    fi
    _branch=$(git symbolic-ref HEAD 2>/dev/null)
    _branch=${_branch#refs/heads/} # apparently faster than sed
    branch="" # need this to clear it when we leave a repo
    if [[ -n $_branch ]]; then
        branch=" ${NIL}[${PURPLE}${_branch}${dirty}${NIL}]"
    fi

    # Dollar/pound sign
    end="${LC}\$${NIL} "

    # Put it all together
    export PS1="${host}:${path}${venv}${branch} ${end}"
}
export PROMPT_COMMAND=set_prompt



#
# Functions
#

exclude="\.git|\.svn|\.swp|\.coverage|\.pyc|_build|log/"
function pgrep() {
    find . -maxdepth 1 -mindepth 1| egrep -v "$exclude" | xargs egrep -lir "$1" | egrep -v "$exclude"  | xargs egrep -Hin --color "$1"
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
