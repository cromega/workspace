# if something manages an agent, exit
[ -S /var/run/user/$UID/keyring/ssh ] && return # Cinnamon

start_new_agent() {
  find /tmp -type d -iname 'ssh*' | xargs rm -rf
  eval $(ssh-agent) > /dev/null
}

pid=$(pidof ssh-agent)
if [ -z $pid ]; then
  start_new_agent
  return
fi

socket=$(find /tmp -type s | grep "ssh.*agent.$(($pid - 1))")
if [ -z $socket ]; then
  start_new_agent
  return
fi

export SSH_AGENT_PID=$pid
export SSH_AUTH_SOCK=$socket
