cd $(dirname $0)
. ../lib.sh

tmpdir="$HOME/tmp/singularity"

cleanup() {
  echo "cleaning up..."
  rm -rf $tmpdir
}

trap "cleanup" EXIT

sudo apt-get install automake libtool python squashfs-tools libarchive-dev

github singularityware/singularity $tmpdir
cd $tmpdir

git checkout $(git tag -l | tail -n 1)
./autogen.sh
./configure --prefix=/usr/local

cpus=$(grep -c processor /proc/cpuinfo)
make -j $cpus

sudo make install
