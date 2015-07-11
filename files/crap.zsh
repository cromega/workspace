alias viber=/opt/viber/Viber
alias rsync="rsync -avz --progress"
alias webserve="python3 -m http.server"
alias mc="mc -b"
alias ta="tmux attach -d"

alias be="bundle exec"

export EDITOR=/usr/bin/vim
export LC_ALL=en_US.utf8

if [[ -n $TMUX ]]; then
  export TERM="screen-256color"
else
  export TERM="xterm-256color"
fi

unsetopt autocd
