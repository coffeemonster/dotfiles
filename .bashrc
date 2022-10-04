# .bashrc for alister.west

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# disable mac "zsh is now default" msg
export BASH_SILENCE_DEPRECATION_WARNING=1

# Some standard stuff
shopt -s histappend # append to $HISTFILE
shopt -s checkwinsize
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='(%F %H) ' # yyyy-mm-dd hh:mm:ss
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

# Prompt
HILIT="\e[01;32m"                                   # default to green
if   [ $USER == 'root' ];    then HILIT="\e[01;31m" # root is red
elif [ $HOSTNAME == 'alisterwest.com' ]; then HILIT="\e[01;33m" # 6robots is yellow
elif [ $USER == 'alister' ]; then HILIT="\e[01;36m" # alister(work) is cyan
fi
NC="\e[0m"                                          # no colour
PS1="${HILIT}[$USER@$HOSTNAME]$NC \w \n\t > "       # prompt

# MySQL prompt
export MYSQL_PS1="\u@\h:\d>"

export EDITOR=vim

# Includes
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi
if [ -f ~/.bash_local ]; then . ~/.bash_local; fi
if [ "$TERM" != "dumb" ]; then eval "`dircolors -b`"; fi
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
    PS1="${HILIT}[$USER@$HOSTNAME]$NC \w \$(__git_ps1 ' (%s)')\n\t > "
fi

export PATH=/home/alister/bin/:$PATH
