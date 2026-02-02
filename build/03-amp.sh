#!/bin/bash
su -c 'echo -e "amp\namp\namp\n" | bash <(wget -qO- getamp.sh)' root &

while true; do
  if ! pidof AMP_Linux_x86_64 >/dev/null; then
    sleep 15
  else
    sleep 10
    pid=$(pidof AMP_Linux_x86_64)

    kill -SIGTERM $pid
    sleep 5

    if kill -0 $pid 2>/dev/null; then
      kill -SIGKILL $pid
    fi

    break
  fi
done
