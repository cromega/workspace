export PATH="${HOME}/.rbenv/bin:$PATH"
#export RUBY_BUILD_CACHE_PATH='.rbenv/download_cache'
mkdir -p $RUBY_BUILD_CACHE_PATH
export MAKE_OPTS="-j$(($(grep -c MHz /proc/cpuinfo) + 1))"

eval "$(rbenv init -)"
