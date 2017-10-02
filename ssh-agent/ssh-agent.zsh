pid=$(pidof ssh-agent)

if [ $? -eq 0 ]; then
  export SSH_AGENT_PID=$pid
  export SSH_AUTH_SOCK="$(find /tmp/ssh-* -type s -user $USER -print -quit)"
fi
