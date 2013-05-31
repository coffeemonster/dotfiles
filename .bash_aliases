alias ls='ls --color=auto'
alias ll='ls -lF'
alias la='ls -A'
alias l='ls -CF'
alias :q='exit'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

alias pef='ps -ef --forest'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# For testing small chunks of code
alias pe='perl -Mstrict -Mwarnings -MData::Dumper -MEnglish=-no_match_vars -MData::Dump=dump -lE'

alias publish='sudo -u www-data /home/al/bin/publish'

alias grok='find . -type f \( -regex ".*\.\(html\|rb\|js\|css\|config\|ini\|cgi\|def\|txt\|pm\|t\|\pl\)" -o -regex ".*/[^/.]*$" \) -a \( -not -regex ".*svn.*" \) -a \( -not -regex ".*/tmp/.*" \) -print0 | xargs -0 grep --color=auto -i '

#alias grok='find . | egrep -v "(svn|comiled)" | xargs grep'

alias configtest='apache2ctl configtest'
alias restart='sudo apache2ctl restart'

alias pef='ps -ef --forest'

