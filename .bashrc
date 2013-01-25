# ~/.bashrc
# vim:set ft=sh sw=2 sts=2:

source "$HOME/.hashrc"

# Store 10,000 history entries
export HISTSIZE=10000
# Don't store duplicates
export HISTCONTROL=erasedups
# Append to history file
shopt -s histappend

LESS="FRX"
RI="--format ansi -T"
CLICOLOR=1
LSCOLORS=gxgxcxdxbxegedabagacad

export  LESS RI PSQL_EDITOR CLICOLOR LSCOLORS

bind 'set bind-tty-special-chars off'
bind '"\ep": history-search-backward'
bind '"\en": history-search-forward'
bind '"\C-w": backward-kill-word'

export HISTIGNORE="%*"
bind '"\C-q": "%-\n"'

[ -z "$PS1" ] || stty -ixon

[ -z "$PS1" ] || export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$(git_prompt_info '(%s)')$ "

if [ -f '/usr/local/etc/bash_completion.d/git-completion.bash' ]; then
  source '/usr/local/etc/bash_completion.d/git-completion.bash'
fi

# Use the right emacsclient when installed via brew
[ -x /usr/local/bin/emacsclient ] && alias emacsclient=/usr/local/bin/emacsclient

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[ -d '/usr/local/share/npm/bin' ] &&  PATH=$PATH:/usr/local/share/npm/bin # Node stuff installed with npm

[ ! -f "$HOME/.bashrc.local" ] || . "$HOME/.bashrc.local"
