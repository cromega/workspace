dump_cert() {
  openssl x509 -in "$1" -text -noout
}

dump_csr() {
  openssl req -in "$1" -text -noout
}
