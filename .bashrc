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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export EDITOR=vim
export NNN_TMPFILE="/tmp/nnn"
export NNN_USE_EDITOR=1

n()
{
        nnn "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm -f $NNN_TMPFILE > /dev/null
        fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# PS1='>>> '
# PS1='\u \w $(git branch 2>/dev/null | sed -n "s/* \(.*\)/\1 /p")$ '
# PS1='\[\e[32m>>\] \[\e[36m\w\] \[\e[33m\]\[\e[0m\]'
PS1='\[\e[36m\]\w \[\e[32m\]>> \[\e[33m\]\[\e[0m\]'
