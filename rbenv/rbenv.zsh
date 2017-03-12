export PATH="${HOME}/.rbenv/bin:$PATH"
export RUBY_BUILD_CACHE_PATH='.rbenv/download_cache'
mkdir -p $RUBY_BUILD_CACHE_PATH

eval "$(rbenv init -)"
