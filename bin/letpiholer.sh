#!/bin/sh
find /etc/letsencrypt/live/ -name "privkey.pem" -printf "%P\n" | while read -r certFile
  do 
          certName=`echo $certFile | cut -d "/" -f 1`;
          echo $certName;
          cat /etc/letsencrypt/live/$certName/fullchain.pem /etc/letsencrypt/live/$certName/privkey.pem > /etc/pihole/tls.pem;
          chown pihole:pihole /etc/pihole/tls.pem
  done
