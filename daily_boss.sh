#!/bin/bash

#   day     stage_id
# Thursday     524
# Friday       530

echo "[log] ---------- $(date) ----------"
source ./utils/send_request.sh

day_of_week=$(date -d '4 hours ago' +%u)

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
        "https://msaapi.snkplaymore.info/world_map/battle_start/kpi1=1&kpi2=$stage_id" > /dev/null

    # Win it!
    send_request \
        "battle_time=18&drop_num=0&stage_id=$stage_id&type=1&eagle_eye=7xIkiBw%2FdTpUroqLBSgevl5%2Fi0EF3TL2yDgJ8%2FTapsfRd3MtQSmd8nS%2FoPcdo6kuK9xGW41JxNbcKGcSeEq35Tch6ELBlW0OLB8eduwOhRES2ddGA4JMC5%2B7Rv1E78DoEdG%2Fa0MmTNFSKf8urjVXTD2N%2F%2B63QVWeHu1ERHQuLePBwKo9V8CC7xc7EyhbuGbkZlRS2I3r%2BD6EWjQBmkcVRe%2B8wvmQuvVJZxkibnUwM71EShXPG3GGaSU%2FI3cUagsEzNbrrGTXHITvW3F4YDxbAczZjV%2BBXCCl4SDVce2S0SFWh46kI5n%2B3EkK0HzcL2Pfa%2BDQxurMW5Z8Vu5O%2BM%2BEtJ3dmwbFt7pM6kh70oTLAkce9nABf9S%2FHQl0%2FaAPxG0NeQQ83ZxYpODR8Ayn%2FtZDBoW5Y3Q6fZr3nb8fJFWh8VC%2FZD8nYynqeW0fWbDQystfClbie8SJ%2F%2FadEJgTbBuumm46QDuL%2BdFvLdqfhv%2BnesL0PR8Mx5WIbgX7KPaIgXkWjQEnZt%2FVx4%2BY%2FpXK49azdPAYAMwNQe0KamMbqVuUnDBprGj057fBkU9zfdlj842qOSz5FW202g0neM0dArx%2BzHqR0Op4qn1Zq9%2FeJuhTK6oVEA4Q7xxiPlJAxRjnNSdyiQXVWg9J1PiJlXK82I8NuT3vhtMohtzPl9Es8sbnBdMZx3HGQz8%2F8t3tidVtpJRoQyoM%2BTQae2KFYcL%2ByDgRrkm0D%2FFmlEdaPnuLKzktb4tEaC1YhoyvPKb%2BsnOJkMUV" \
        "https://msaapi.snkplaymore.info/world_map/battle_win/?kpi1=0&kpi2=$stage_id&kpi3=1&kpi4=1" > /dev/null

    echo "[log] Mission Complete: $stage_id...$i"
#done
