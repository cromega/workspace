stubonce() {
  eval "$1() { unfunction $1; $2; $1 \$@ }"
}

STUBS_DIR=~/bin/stubs
mkdir -p $STUBS_DIR
if ! [[ $PATH =~ $STUBS_DIR ]]; then
  export PATH=$PATH:$STUBS_DIR
fi

bin_stub_once() {
  stub=$1
  target=$2
  caller=$3

  echo -e "#!/usr/bin/zsh\nsource $caller\n$target\nrm \$0\n$stub \$@" > $STUBS_DIR/$stub
  chmod +x $STUBS_DIR/$stub
}

