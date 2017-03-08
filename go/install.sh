cd $(dirname $0)
. ../lib.sh

go_version="1.8"
os=$(uname -s | tr 'A-Z' 'a-z')

mkdir -p ~/go
if [ ! -d ~/go/$go_version ]; then
  mkdir ~/go/${go_version}
  wget https://storage.googleapis.com/golang/go${go_version}.${os}-amd64.tar.gz -O - | tar -xzf - -C ~/go/${go_version}
fi

echo "Linking Go ${go_version}"
rm -f ~/go/current
ln -s ~/go/${go_version} ~/go/current

put go.zsh ~/.oh-my-zsh/custom/

