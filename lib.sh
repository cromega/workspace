die() {
  echo $1
  exit 1
}

prepare_environment() {
  mkdir -p ~/bin
}

put() {
  file="$1"
  path="$2"

  mkdir -p "$path"
  cp "$file" "$path"
  echo "$path/$file written."
}

symlink() {
  local src="$1"
  local dst="$2"

  [ -L "$dst" ] && rm "$dst"
  ln -s "$src" "$dst"
  echo "symlink created $src -> $dst"
}

git_clone() {
  repo="$1"
  path="$2"

  echo "cloning $1 into $2"
  mkdir -p "$2"
  git clone "$1" "$2"
}

git_pull() {
  path="$1"

  echo "updating repo in $path"
  git -C "$path" fetch && git -C "$path" merge origin/master
}

github() {
  repo="$1"
  path="$2"

  url="https://github.com/${repo}.git"
  if [ -d "$path" ]; then
    git_pull "$path"
  else
    git_clone "$url" "$path"
  fi
}

check_command() {
  command -v "$1" 2>&1 > /dev/null
}

