# .bashrc

# change th default shell to zsh
chsh -s $(which zsh)

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export BROWSER=/usr/bin/firefox

# User specific aliases and functions

# launch tmux at the start of a terminal
if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
