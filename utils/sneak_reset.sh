#!/bin/bash

source ./utils/send_request.sh

# Reset sneak  
send_request \
    "difficulty=2" \
    "https://msattack.snkplaymore.info/sneak/reset"
