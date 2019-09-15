#!/bin/bash

source ./utils/send_request.sh

for ((i = 1; i <= 3; i++));
do
    echo "[log] Good Job ..$i"

    send_request \
        "member_id=qtdlG45bX9FrgjN6JD7T8oKy3E2u1IfS&type=2" \
        "https://msattack.snkplaymore.info/guild/gj/">/dev/null
done
