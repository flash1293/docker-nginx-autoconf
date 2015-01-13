#!/bin/bash
echo "Starting nginx"
service nginx start &
LASTCHANGE=$(stat -c %Y /etc/nginx/sites-enabled/default | sed 's/^\([0-9\-]*\).*/\1/')
echo "Watching for config-changes"
while true
do
  sleep 1
  CURRENTCHANGE=$(stat -c %Y /etc/nginx/sites-enabled/default | sed 's/^\([0-9\-]*\).*/\1/')
  if [ $LASTCHANGE -ne $CURRENTCHANGE ] 
  then
    echo "Reloading Nginx Configuration"
    nginx -t
    service nginx reload
  fi
  LASTCHANGE=$CURRENTCHANGE
done