# ~/.bashrc: executed by bash(1) for non-login shells.

# Define some colors first:

red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
purple='\e[0;35m'
PURPLE='\e[1;35m'
yellow='\e[0;33m'
YELLOW='\e[133m'
green='\e[0;32m'
NC='\e[0m'              # No Color


# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything

[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTSIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W\$ '
    ;;
esac

function parse_git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || { echo "" ; return ; }
    BRNAME=${ref#refs/heads/}
    git_status="$(git status 2> /dev/null)"
    if [[ ${git_status} =~ "working directory clean" ]]; then
        echo "\[${NC}\](\[${green}\]${BRNAME}\[${NC}\])"
    else
        echo "\[${NC}\](\[${red}\]${BRNAME}\[${NC}\])"
    fi
}

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

function prompt_func() {
PS1="\[${purple}\][\[${green}\]\u\[${NC}\]@\h: \[${cyan}\]\W$(parse_git_branch)\[${purple}\]]\[${NC}\]\\$ "
}


# utility functions

function extract () {
  if [ -f "$1" ]; then
      case "$1" in
          *.tar.bz2)   tar xvjf "$1"    ;;
          *.tar.gz)    tar xvzf "$1"    ;;
          *.tar.xz)    tar xvJf "$1"    ;;
          *.bz2)       bunzip2 "$1"     ;;
          *.rar)       unrar x "$1"     ;;
          *.gz)        gunzip "$1"      ;;
          *.tar)       tar xvf "$1"     ;;
          *.tbz2)      tar xvjf "$1"    ;;
          *.tgz)       tar xvzf "$1"    ;;
          *.zip)       unzip "$1"       ;;
          *.Z)         uncompress "$1"  ;;
          *.7z)        7z x "$1"        ;;
          *.xz)        unxz "$1"        ;;
          *.exe)       cabextract "$1"  ;;
          *)           echo "\`"$1"': unrecognized file compression" ;;
      esac
  else
      echo "\`"$1"' is not a valid file"
  fi
}



# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls -F --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias grep='grep --color=auto'
alias mc='mc -x'
alias scpresume='rsync -Pazhv -e ssh'
alias less='less -R'

#PATH
export PATH=${PATH}:/sbin:/usr/sbin/:/usr/local/sbin/:${HOME}/apps/eclipse

# EDITOR
export EDITOR=vim

PROMPT_COMMAND=prompt_func


# JDK
export JAVA_HOME=${HOME}/apps/jdk
export PATH=${JAVA_HOME}/bin:${PATH}

# ANT
export ANT_HOME=${HOME}/apps/ant
export PATH=${PATH}:${ANT_HOME}/bin

# maven
export M2_HOME=/home/hardik/apps/maven
export PATH=$PATH:$M2_HOME/bin

# JBOSS
export JBOSS_HOME=${HOME}/apps/jboss
export PATH=$PATH:$JBOSS_HOME/bin

# idea
export JDK_HOME=$JAVA_HOME
export PATH=$PATH:${HOME}/apps/idea/bin

# android
export ANDROID_HOME=${HOME}/apps/android-sdk
export PATH=$PATH:${ANDROID_HOME}/tools
export PATH=$PATH:${ANDROID_HOME}/platform-tools




ME=`id -u`
if [[ $ME != 0 ]]; then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi

[[ -s "$HOME/.git-completion.sh" ]] && source "$HOME/.git-completion.sh"
