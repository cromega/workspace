source ${0:a:h}/utils.zsh

loadnvm() {
  export NVM_DIR=$HOME/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
}

stubonce nvm loadnvm
stubonce node loadnvm
stubonce npm loadnvm
