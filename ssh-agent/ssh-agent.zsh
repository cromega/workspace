[ -S /var/run/user/$UID/keyring/ssh ] && return

pid=$(pidof ssh-agent)

if [ $? -eq 0 ]; then
  export SSH_AGENT_PID=$pid
  export SSH_AUTH_SOCK="$(find /tmp/ -type s -iname 'agent*' -user $USER | head -n 1)"
else
  eval $(ssh-agent) > /dev/null
fi
