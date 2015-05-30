alias viber=/opt/viber/Viber
alias rsync="rsync -avz --progress"
alias webserve="python3 -m http.server"
alias mc="mc -b"

alias be="bundle exec"

export EDITOR=/usr/bin/vim
export LC_ALL=en_US.utf8
export TERM=xterm-256color

k() {
  if [ -z "$1" ]; then
    echo "host needed"
    return 1
  fi

  knock $1 $(read '?ports: '; echo -n "$REPLY")
}
