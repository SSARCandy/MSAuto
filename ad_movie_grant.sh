#!/bin/bash

source ./utils/send_request.sh


send_request \
    "type=1" \
    "https://msattack.snkplaymore.info/present/ad_movie_grant/" #> /dev/null
