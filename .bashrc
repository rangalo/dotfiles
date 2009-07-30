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

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

ME=`id -u`
if [ $ME = 0 ]; then
    PS1="\[${purple}\][\[${green}\]\u\[${NC}\]@\h: \[${cyan}\]\W \[${purple}\]]\[${NC}\]# "
else
    PS1="\[${purple}\][\[${green}\]\u\[${NC}\]@\h: \[${cyan}\]\W \[${purple}\]]\[${NC}\]$ "
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
	PROMPT_COMMAND='echo -ne "\033]0;`basename \"${PWD}\"`\007"'
    # turn off the beeps
    xset -b

    ;;
    Eterm*)
	PROMPT_COMMAND='echo -ne "\033]0;`basename \"${PWD}\"`\007"'
    # turn off the beeps
    xset -b
    ;;

*)
    ;;
esac

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

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'
alias mc='mc -x'

#PATH
export PATH=${PATH}:/sbin:/usr/sbin/:/usr/local/sbin/:${HOME}/apps/eclipsea

# EDITOR
export EDITOR=vim

#PYTHONPATH
#export PYTHONPATH=$PYTHONPATH:${HOME}/pythonScripts:${HOME}/projects/easy-connection
export PYTHONPATH=$PYTHONPATH:${HOME}/pythonScripts

# JDK
export JAVA_HOME=${HOME}/apps/jdk
export PATH=${PATH}:${JAVA_HOME}/bin

# ANT
export ANT_HOME=${HOME}/apps/ant
export PATH=${PATH}:${ANT_HOME}/bin
#export CLASSPATH=$CLASSPATH:${ANT_HOME}/lib/ant.jar

#JUnit
export JUNIT_HOME=${HOME}/apps/junit
export CLASSPATH=$CLASSPATH:${JUNIT_HOME}/junit.jar

#HSQLDB
export HSQLDB_HOME=${HOME}/apps/hsqldb
export CLASSPATH=$CLASSPATH:${HSQLDB_HOME}/lib/hsqldb.jar

# javaee
#export JAVAEE_HOME=${HOME}/apps/javaee/SDK
#export PATH=${PATH}:${JAVAEE_HOME}/bin
# CLASSPATH
#export CLASSPATH=${JDK_HOME}/lib:${JAVAEE_HOME}/lib:${CLASSPATH}

# JBOSS
export JBOSS_HOME=${HOME}/apps/jboss
export PATH=$PATH:$JBOSS_HOME/bin

# tomcat
export TOMCAT_HOME=${HOME}/apps/tomcat
#export TOMCAT_HOME=${JBOSS_HOME}/server/default/deploy

# GLASSFISH home
export GLASSFISH_HOME=${HOME}/apps/glassfish/glassfish
export PATH=$PATH:${GLASSFISH_HOME}/bin

# Android SDK from google
export SDK_ROOT=${HOME}/apps/android-sdk
export PATH=${PATH}:${SDK_ROOT}/tools

# GWT (Google Web Toolkit)
export GWT_HOME=${HOME}/apps/gwt
export PATH=$PATH:${GWT_HOME}

# PostgreSQL database
export PGSQL_HOME=/home/hardik/apps/pgsql
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${PGSQL_HOME}/lib
export PATH=$PATH:${PGSQL_HOME}/bin
export PGHOST=localhost
export PGPORT=6021
export PGDATA=${PGSQL_HOME}/Data



export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/hardik/apps/wxPython/lib
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi

# skippy
export PATH=$PATH:/home/hardik/apps/skippy/bin

# tint
export PATH=$PATH:/home/hardik/apps/tint/usr/bin

# visibility
export PATH=$PATH:/home/hardik/apps/visibility/bin

# ncmpc++
export PATH=$PATH:/home/hardik/apps/ncmpcpp/bin

# maven
export M2_HOME=/home/hardik/apps/maven
export PATH=$PATH:$M2_HOME/bin
