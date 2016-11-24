list_docker_ips() {
  docker ps | awk '{print $1}' | while read id; do echo "$id: $(docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $id)"; done
}

alias doc="docker-compose"
