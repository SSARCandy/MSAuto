#!/bin/bash

source ./utils/send_request.sh

# Reset sneak  
send_request \
    "difficulty=2" \
    "https://msaapi.snkplaymore.info/sneak/reset"
