list_docker_ips() {
  docker ps | awk '{print $1}' | while read id; do echo "$id: $(docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $id)"; done
}

alias dc="docker-compose"
alias alpine="docker run --rm -it alpine:latest ash -c \"apk update; ash\""
alias ubuntu="docker run --rm -it ubuntu:latest bash -c \"apt-get update; bash\""
