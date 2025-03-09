#!/bin/sh
find /etc/letsencrypt/live/ -name "privkey.pem" -printf "%P\n" | while read -r certFile
  do 

          certName=`echo $certFile | cut -d "/" -f 1`;
          expire=`certbot certificates -d $certName | grep 'Expiry Date' | cut -d' ' -f10`
          echo "$certName will expire in $expire days"

done
