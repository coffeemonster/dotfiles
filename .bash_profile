# .profile for alister.west for all (bash, zsh, etc) interactive shells

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Disable macs "zsh is now default" msg
export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR=vim

shopt -s checkwinsize # correct line-wrapping issues

# lesspipe changes "less" behaviour to display info as it comes instead of waiting for it all to be read/decoded
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)" 

# --------------
# History
# --------------
shopt -s histappend # Append history $HISTFILE, this will keep history of multi-concurrent sessions
export HISTCONTROL=ignoredups # Checks for a match against the last line in history
export HISTTIMEFORMAT='(%F %H) ' # yyyy-mm-dd hh:mm:ss
# export HISTSIZE=10000     # Controlled by iTerm
# export HISTFILESIZE=10000 # Controlled by iTerm

# Prompt
HILIT="\e[01;32m"                                   # default to green
if   [ $USER == 'root' ];    then HILIT="\e[01;31m" # root is red
elif [ $HOSTNAME == 'alisterwest.com' ]; then HILIT="\e[01;33m" # 6robots is yellow
elif [ $USER == 'alister' ]; then HILIT="\e[01;36m" # alister(work) is cyan
fi
NC="\e[0m"                                          # no colour
PS1="${HILIT}[$USER@$HOSTNAME]$NC \w \n\t > "       # prompt

# PROMPT_COMMAND - re-evaluated every display
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'

# MySQL prompt
export MYSQL_PS1="\u@\h:\d>"

# Includes
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
    PS1="${HILIT}[$USER@$HOSTNAME]$NC \w \$(__git_ps1 ' (%s)')\n\t > "
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
# use gnu tools (ls, cat, ...) instead of debian ones
export PATH="$HOME/bin:/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"


## ---------- Aliases ----------
alias ls='ls --color=auto' # mac: `brew install coreutils` to get nice gnu colors
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'
alias :q='exit'
alias pef='ps -ef --forest'

# For testing small chunks of Perl code
# alias pe='perl -Mstrict -Mwarnings -MData::Dumper -MEnglish=-no_match_vars -MData::Dump=dump -lE'

# deprecated - use 'brew install grok'
# alias grok='find . -type f \( -regex ".*\.\(html\|rb\|js\|css\|config\|ini\|cgi\|def\|txt\|pm\|t\|\pl\)" -o -regex ".*/[^/.]*$" \) -a \( -not -regex ".*svn.*" \) -a \( -not -regex ".*/tmp/.*" \) -print0 | xargs -0 grep --color=auto -i '
# alias grok2='find . | egrep -v "(svn|comiled)" | xargs grep'
