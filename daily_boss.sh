#!/bin/bash

#   day     stage_id
# Thursday     524
# Friday       530

echo "[log] ---------- $(date) ----------"
source ./utils/send_request.sh

day_of_week=$(date +%u)

case $day_of_week in
    1)
        stage_id=506
        ;;
    2)
        stage_id=512
        ;;
    3)
        stage_id=518
        ;;
    4)
        stage_id=524
        ;;
    5)
        stage_id=530
        ;;
    6)
        stage_id=536
        ;;
    7)
        echo 'No stage_id provided.'
        exit 0
        ;;
esac

echo $stage_id

#for i in {1..2}
#do
    echo "[log] Start playing daily_boss: $stage_id...$i"

    deck="unit_ids[]=15&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_level[]=50&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0"
    # Battle start
    send_request \
        "cover=2&deck_no=2&stage_id=$stage_id&$deck" \
        "https://msattack.snkplaymore.info/world_map/battle_start/kpi1=1&kpi2=$stage_id" > /dev/null

    # Win it!
    send_request \
        "battle_time=18&drop_num=0&stage_id=$stage_id&type=1&eagle_eye=M%2Bc07OfRclnF3oXf330Q0i84KCQzmu7wdNVmpaPU3oWLnyVcqG5Xa7AK1z2T6QjPxqVBRaunovUF4GZgsFj4V0yAJ4CX4Z8%2ByKn25BJZNbXbonOBl9E66aFtG8aTIWgQqUV26C%2BADuBrtuK59bAqDTn%2BQqXzem6%2FN4SI3hVu9MCdbZYvb0QOrdH%2Fy9UXbLeDVvEUE9AzxiYemZsxIwSegt0SsAYGvB7%2FYJM6QfEot6aPX0xngDZXO3yg1j0WXhfe3bx12MVluBwRz58LroGLgawf9e4u58joUGpg6egBEhfQokU%2BEDdINI3qmp%2BYkAv40PA0FgGuiTj6cyOiLV35Y%2BOVYw%2BeeWisqqyVJuz%2FvHI3Hs9sC2u6mcqkpOiIyel2HEROCkS5UPLwHUuDZTEaEWu0%2F0R%2BDoOxgsp0OUh5NUaCybET9mzOJ4qkkK6rdbEXpXAF%2FPZBuJ7G4CobS6WiY64LZkc%2BH85%2FryjteRknIWKf0S%2FQDFH7pzhjTYBZoNcEtNlyrVhDWIjAeq865tn3%2FVuejAS6b%2BpWJf3%2BghTGF%2Bf%2F79Tg5ACPMWrldFyKtbweNLqNXj83CV2bgmX6a7KSKjD0vwLkI3Mxr8D%2FPKImKJGeeMtdXIYKvTIcJ%2FYm9AN1NzXHy725wE%2FfFdICrAVRyrjGsBO0LWPjPh2tFWBVDcXhHH6%2BFcfNELWMqS%2BD9ULnSeyX9wBODopRprY8ko9J9Jhf7Pbg4TXJwxnHD6dwEh8%3D&hawk_eye=wM1N4we2vG9%2BCycFQVxVEkwxVGlIHV4kT8BuP03ZeELmxK0nK3UXiusDb%2BG1%2BvqTrR0xldcG2flNKk6OUB6zG%2BLYlFVVALNiq%2BhJPs1zrRs4nlyXQgFMq7gHkMUCDPKcvwgZVePk8lf7%2FT1loE3lPnuZjGX0UaEVmnsN4yolv3QffrlPz4y%2FjKY2LDWJF9xhMAGN2qqMgkszARDbLEiAtlR%2BKNod8dFOmIoj7dvuwDmbJsKH0DemD4ohBPGKwvdjqTWM709zqqQLV3J5GGwLvdJj4ATdVGf7rSjw6yAL90qQMeJPC3F3MCmLbnwe1vqiV5umiipax4zS3%2F9y3iOZ7inAAOthlYbY0xnM6uXNr8YN7vGTcRbo%2BPuJ1OfUVKsJqgWecnt%2BwLNP2lQRCsIA4uRrf89I2OHDgHa7e5mmNd4Y3Gp5skR3DGYutSGXytgIKgEx4w5gD1sceX7ALK6d02tsQahxEKXX%2B26e2b6%2B2LL%2Fp7xc5I6goy6%2F4oI6m6sIRXryZKXxsCg9WmWuhaEHwqiS2PYXpexTA90anOopfVZ4gd9lFYPDFrHK1DffPgzbDTQNlkVXKZvP6djIDA8G4zE27HmBTriTWzpUUvziEOvQbC2XhcharsUBVsQUaacSuHxVxnb09YBlLPuzQpDYWiLXTw0bEy0HqJ%2BCiNwEXX6HfXEeRkx2%2FxGVlskIc3XLh6dTZvqlfLlyGFP4IQwMy7jDn%2Fcx5k06g1qM18l2IQeMYSVKxS3qjyjjVlBK4vkr" \
        "https://msattack.snkplaymore.info/world_map/battle_win/?kpi1=0&kpi2=$stage_id&kpi3=1&kpi4=1" > /dev/null

    echo "[log] Mission Complete: $stage_id...$i"
#done
