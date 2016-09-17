# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
. /etc/bashrc
fi

# Source home definitions
if [ -f /home/christopher/.dotfiles/home_bashrc ]; then
  source /home/christopher/.dotfiles/home_bashrc
fi

# Source work definitions
if [ -f /home/vagrant/.dotfiles/work_bashrc ]; then
  source /home/vagrant/.dotfiles/work_bashrc
fi

# C compilation and error checking
alias gcc1="gcc -g3 -Wall -std=c99 -pedantic"
alias gpp="g++ -g3 -Wall -O1 -pedantic"
alias valgrind1="valgrind --leak-check=yes"
alias valgrind2="valgrind --show-reachable=yes --leak-check=full"

# Little ls things
alias la="ls -a"
alias ll="ls -l"
alias t="tmux"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Use vim as editor and in terminal
export VISUAL=vim
export EDITOR="$VISUAL"
set -o vi

# Avoid duplicates
export HISTCONTROL=ignoredups:erasedups

# Use vim everywhere??
vssh() {
  # sshs in and sets -o vi, and VISUAL=vim
  /usr/bin/ssh -t $1 " \
      export VISUAL=vim && \
      bash -o vi"
}
#alias ssh="vssh"
