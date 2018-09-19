loadrbenv() {
  export PATH="${HOME}/.rbenv/bin:$PATH"
  export MAKE_OPTS="-j$(($(grep -c MHz /proc/cpuinfo) + 1))"

  eval "$(rbenv init -)"
}

rbenv() {
  unfunction rbenv
  loadrbenv
  rbenv $@
}

ruby() {
  unfunction ruby
  loadrbenv
  ruby $@
}


