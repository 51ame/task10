#!/bin/bash
WIPE_DATE=$(date)
DIR=/home/ubuntu/custom-ubuntu-nginx
TRESHOLD=100000

while true; do
sleep 5
LOG_SIZE=$(wc -c $DIR/nginx.log | awk '{print $1}')
  if [ $LOG_SIZE -lt $TRESHOLD ]; then
	echo "Size of logs = $LOG_SIZE kb! Looking for some new logs..."
	cat /var/log/nginx/access.log /var/log/nginx/error.log > $DIR/nginx.log;
	awk '/400/;/401/;/404/;/408/' $DIR/nginx.log > $DIR/4xx.log;
	awk '/500/;/502/;/503/;/504/;/505/' $DIR/nginx.log > $DIR/5xx.log;
  else
	echo -n > $DIR/nginx.log;
	echo "Nginx.log was wiped $WIPE_DATE" >> $DIR/wipe.log;
	echo "Wipe successfull! Wipe date is: $WIPE_DATE"
  fi
done

