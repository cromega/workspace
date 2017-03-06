cd $(dirname $0)
. ../lib.sh

go_version="1.8"
os=$(uname -s | tr 'A-Z' 'a-z')
mkdir -p ~/go
if [ ! -d ~/go/$go_version ]; then
  wget https://storage.googleapis.com/golang/go${go_version}.${os}-amd64.tar.gz -O - | tar -xzf - -C ~/go
  mv ~/go/go ~/go/$go_version
  [ -L ~/go/current ] && rm ~/go/current
  ln -s ~/go/$go_version ~/go/current
fi
put go.zsh ~/.oh-my-zsh/custom/

