#!/bin/bash

app_ver=`jq '.app_ver' ./fixtures/header.json | tr -d '"'`
terminal_id=`jq '.terminal_id' ./fixtures/header.json | tr -d '"'`
echo "app_ver=$app_ver, terminal_id=$terminal_id"

# $1 = data string
# $2 = url string
function send_request {
    data=$1
    url=$2

    #if [ -z $3 ]; then
        #echo "url    = $url" > /dev/tty
        #echo "app_ver= $app_ver" > /dev/tty
        #echo "data   = $data" > /dev/tty
    #fi

    curl -X POST \
        -H "terminal_id: $terminal_id" \
        -H "isr: 0" \
        -H "app_ver: $app_ver" \
        -H "Host: msattack.snkplaymore.info" \
        -H "Connection: Keep-Alive" \
        -H "Accept-Encoding: gzip" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "$data" \
        "$url" \
        | gunzip - \
        | jq '.'

}
