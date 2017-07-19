local default_proxy="http://"
local default_no_proxy=""

set_proxy() {
  local proxy="$1"
  [ -z "$proxy" ] && proxy="$default_proxy"

  export http_proxy="$proxy"
  export https_proxy="$proxy"
  export HTTP_PROXY="$proxy"
  export HTTPS_PROXY="$proxy"
  export no_proxy="$default_no_proxy"
  export NO_PROXY="$default_no_proxy"
}

unset_proxy() {
  unset http_proxy
  unset https_proxy
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset no_proxy
  unset NO_PROXY
}

