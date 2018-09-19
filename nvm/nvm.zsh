source utils.zsh

loadnvm() {
  export NVM_DIR=$HOME/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

fakeonce nvm loadnvm
fakeonce node loadnvm
fakeonce npm loadnvm
