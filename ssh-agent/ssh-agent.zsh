[ -S /var/run/user/$UID/keyring/ssh ] && return

pid=$(pidof ssh-agent)

if [ $? -eq 0 ]; then
  export SSH_AGENT_PID=$pid
  export SSH_AUTH_SOCK="$(find /tmp/ -iname 'ssh-*' -type d -user $USER -print -quit)"
else
  eval $(ssh-agent) > /dev/null
fi
