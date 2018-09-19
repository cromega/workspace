loadnvm() {
  export NVM_DIR=$HOME/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

nvm() {
  unfunction nvm
  loadnvm
  nvm $@
}

node() {
  unfunction node
  loadnvm
  nvm $@
}

npm() {
  unfunction npm
  loadnvm
  npm $@
}
