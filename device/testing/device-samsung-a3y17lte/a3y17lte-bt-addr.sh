#!/bin/sh
# Provisional: a made-up, locally administered address. The real one is in
# Samsung's EFS partition, which is not read. Without an address hci0 stays
# "unconfigured". The controller accepts it once its firmware setup is done.
BT_ADDR=02:A3:17:00:00:01

i=0
until btmgmt --index 0 public-addr "$BT_ADDR" 2>/dev/null | grep -q complete; do
	i=$((i + 1))
	[ "$i" -ge 20 ] && exit 1
	sleep 0.5
done
