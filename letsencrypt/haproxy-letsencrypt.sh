#!/bin/sh

/bin/cat /etc/letsencrypt/live/cdsboy.com/fullchain.pem /etc/letsencrypt/live/cdsboy.com/privkey.pem > /etc/ssl/cdsboy.com.pem
/bin/systemctl reload haproxy.service
