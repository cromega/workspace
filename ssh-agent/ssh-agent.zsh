pid=$(pidof ssh-agent)

if [ $? ]; then
  export SSH_AGENT_PID=$pid
  export SSH_AUTH_SOCK="$(find /tmp/ssh-* -type s -user $USER -print -quit)"
fi
