#!/bin/bash

app_ver=`jq '.app_ver' ./fixtures/header.json | tr -d '"'`
terminal_id=`jq '.terminal_id' ./fixtures/header.json | tr -d '"'`
#master_ver='1190000'

# $1 = data string
# $2 = url string
function send_request {
    data=$1
    url=$2

    curl -X POST \
        -H "terminal_id: $terminal_id" \
        -H "isr: 0" \
        -H "app_ver: $app_ver" \
        -H "Host: msaapi.snkplaymore.info" \
        -H "Connection: Keep-Alive" \
        -H "Accept-Encoding: gzip" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "$data" \
        "$url" \
        | gunzip - \
        | jq '.'

}
