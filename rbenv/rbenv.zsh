source ${0:a:h}/utils.zsh
export PATH="${HOME}/.rbenv/bin:$PATH"

cores=$(grep -c MHz /proc/cpuinfo)
jobs=$((cores>4 ? 4 : cores + 1))
export MAKE_OPTS="-j$jobs"

# loadrbenv() {
#   eval "$(rbenv init - zsh)"
# }

#loadrbenv
#stubonce rbenv loadrbenv
#stubonce ruby loadrbenv
#stubonce bundle loadrbenv
#stubonce irb loadrbenv
#stubonce rerun loadrbenv

_evalcache rbenv init - zsh
