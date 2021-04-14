#!/bin/bash

source ./utils/send_request.sh

send_request \
    "affiliation=$1" \
    "https://msattack.snkplaymore.info/pow/start/"

