#!/bin/bash
apt clean
rm -rf /var/cache/apt/archives/*
rm -f /etc/ssh/*_key /etc/ssh/*.pub
find /var/log -type f -mtime +30 -exec rm {} \;

sed -i -e '/Internal IP address/c ***line removed***' -e '/External IP address/c ***line removed***' -e '/Gateway IP address/c ***line removed***' \
  -e '/You also must own a domain name that resolves to/c ***line removed***' -e '/Please visit http/c ***line removed***' \
  /root/build-log/03-amp.log
sed -i '/You can now reach AMP at/,$d' /root/build-log/03-amp.log
rm -rf /home/amp/.ampdata/instances/ADS01/AMP_Logs/*