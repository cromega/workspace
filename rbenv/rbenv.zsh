source ${0:a:h}/utils.zsh
export PATH="${HOME}/.rbenv/bin:$PATH"
export MAKE_OPTS="-j$(($(grep -c MHz /proc/cpuinfo) + 1))"

# loadrbenv() {
#   eval "$(rbenv init - zsh)"
# }

#loadrbenv
#stubonce rbenv loadrbenv
#stubonce ruby loadrbenv
#stubonce bundle loadrbenv
#stubonce irb loadrbenv
#stubonce rerun loadrbenv

#_evalcache rbenv init - zsh
