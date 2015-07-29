# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
alias cpb-do="ssh christopher@162.243.78.207"

# C compilation and error checking
alias gcc1="gcc -g3 -Wall -std=c99 -pedantic"
alias gpp="g++ -g3 -Wall -O1 -pedantic"
alias valgrind1="valgrind --leak-check=yes"
alias valgrind2="valgrind --show-reachable=yes --leak-check=full"

# Tor
alias tor1="~/bin/tor-browser_en-US/start-tor-browser.desktop"

# Making little things better
alias python='python3' # We are making the switch!
#alias pip2="pip-python"
#alias pip3="python3-pip"
alias xopen="xdg-open"
alias casa="casapy --nologfile --colors=Linux"
alias shutdown="sudo shutdown -h now"
alias rboot="sudo shutdown -r now"

# Little ls things
alias la="ls -a"
alias ll="ls -l"

# files
alias n="nautilus . > /dev/null"

# Checking coffescript
alias hint="git diff --name-only | xargs coffee-jshint --default-options-off --options eqnull,expr,shadow,sub,multistr"
alias lint='git diff --name-only | xargs coffeelint -f /Users/christopher/code/coffeescript-style-guide/coffeelint-config.json'

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

alias t="tmux"
