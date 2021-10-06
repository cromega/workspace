export PATH="$HOME/.cargo/bin:$PATH"

download_rustup() {
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}
