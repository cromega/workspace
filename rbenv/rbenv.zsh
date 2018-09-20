source ${0:a:h}/utils.zsh

loadrbenv() {
  export PATH="${HOME}/.rbenv/bin:$PATH"
  export MAKE_OPTS="-j$(($(grep -c MHz /proc/cpuinfo) + 1))"

  eval "$(rbenv init -)"
}

stubonce rbenv loadrbenv
stubonce ruby loadrbenv
stubonce bundle loadrbenv
