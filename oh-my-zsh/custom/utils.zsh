fakeonce() {
  eval "$1() { unfunction $1; $2; $1 \$@ }"
}
