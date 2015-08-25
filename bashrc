# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

export VISUAL=vim
export EDITOR="$VISUAL"
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

function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
# http://unix.stackexchange.com/questions/88307/escape-sequences-with-echo-e-in-different-shells
function markup_git_branch {
  if [[ "x$1" = "x" ]]; then
    echo -e "[$1]"
  else
    if [[ $(git status 2> /dev/null | tail -n1) = "nothing to commit, working directory clean" ]]; then
      echo -e '\033[1;32m['"$1"']\033[0;30m'
    else
      echo -e '\033[1;31m['"$1"'*]\033[0;30m'
    fi
  fi
}
export PS1='\u \[\033[0;34m\]\W\[\033[0m\] $(markup_git_branch $(git_branch))$ '

alias t="tmux"

alias g="cd /home/vagrant/go/src/github.com/Clever"
alias c="cd /home/vagrant/code"

