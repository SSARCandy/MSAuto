#!/bin/bash

app_ver='2000500'
#master_ver='1190000'

# $1 = data string
# $2 = url string
function send_request {
    data=$1
    url=$2

    curl -X POST \
        -H "devicemodel: D5503" \
        -H "terminal_type: Android" \
        -H "terminal_id: gUTLQezb0NeYMvZrllqqMYao0+n7es/xR53tTE8lVpmpynmZU8v+ow==" \
        -H "osversion: 5.1.1" \
        -H "isr: 0" \
        -H "app_ver: $app_ver" \
        -H "User-Agent: Dalvik/2.1.0 (Linux; U; Android 5.1.1; D5503 Build/14.6.A.1.236)" \
        -H "Host: msaapi.snkplaymore.info" \
        -H "Connection: Keep-Alive" \
        -H "Accept-Encoding: gzip" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "$data" \
        "$url"
        #-H "master_ver: $master_ver" \
}
