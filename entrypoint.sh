#!/bin/bash

nohup /usr/local/bin/net_speeder venet0 "ip" >/dev/null 2>&1 &

wget https://raw.githubusercontent.com/malaohu/squid-with-net-speeder/master/squid.conf -O /etc/squid3/squid.conf

service squid3 restart

