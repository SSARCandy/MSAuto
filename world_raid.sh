#!/bin/bash

source ./utils/send_request.sh

echo "Raid STANDARD 1-1 and ELITE 1-1"

send_request \
    "num=1&stage_id=1" \
    "https://msattack.snkplaymore.info/world_map/raid/?kpi1=1&kpi2=1" > /dev/null

send_request \
    "num=1&stage_id=71" \
    "https://msattack.snkplaymore.info/world_map/raid/?kpi1=71&kpi2=1" > /dev/null

