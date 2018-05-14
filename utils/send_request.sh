#!/bin/bash

app_ver='3050000'
#master_ver='1190000'

# $1 = data string
# $2 = url string
function send_request {
    data=$1
    url=$2

    curl -X POST \
        -H "terminal_id: 9bhuFZl6jx9IakWMcoKq3jc1oO+UkCbhFqcOJG0xh/2pynmZU8v+ow==" \
        -H "isr: 0" \
        -H "app_ver: $app_ver" \
        -H "Host: msaapi.snkplaymore.info" \
        -H "Connection: Keep-Alive" \
        -H "Accept-Encoding: gzip" \
        -H "Content-Type: application/x-www-form-urlencoded" \
        -d "$data" \
        "$url"
}
