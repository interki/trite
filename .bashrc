# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias c=clear
alias ls="ls -lh --color=auto"
alias ll="ls -lah --color"
alias l="ls -a --color"
alias feh="feh --scale-down --auto-zoom --auto-rotate"
alias qb="/home/centos/builds/qb.sh & disown"

set -o vi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export EDITOR=vim
export NNN_TMPFILE="/tmp/nnn"
export NNN_USE_EDITOR=1
export NNN_PLUG='o:fzy-open;p:mocplay;d:ndiff;m:nmount;t:thumb'

n()
{
    export NNN_TMPFILE=${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd

    nnn "$@"

    if [ -f $NNN_TMPFILE ]; then
            . $NNN_TMPFILE
            rm -f $NNN_TMPFILE > /dev/null
    fi
}

f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# PS1='>>> '
# PS1='\u \w $(git branch 2>/dev/null | sed -n "s/* \(.*\)/\1 /p")$ '
PS1='\[\e[36m\]\w \[\e[32m\]>> \[\e[33m\]\[\e[0m\]'


