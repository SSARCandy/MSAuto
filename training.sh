#!/bin/bash

# stage_id training_id
#    706       1
#    712       2
#    718       3
#    724       4
#    730       5

echo "[log] $(date)"
source ./utils/send_request.sh

for training_id in {1..5}
do
    stage_id=$((700 + training_id*6))
    for i in {1..3}
    do
        echo "[log] Start playing: $stage_id...$i"

        # Battle start
        send_request \
            "cover=2&deck_no=3&stage_id=$stage_id&training_id=$training_id&unit_ids[]=15&unit_ids[]=16&unit_ids[]=17&unit_ids[]=18&unit_ids[]=19&unit_ids[]=21&unit_ids[]=84&unit_ids[]=82&unit_ids[]=271&unit_ids[]=340&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50" \
            "https://msaapi.snkplaymore.info/training/battle_start/"

        # Win it!
        send_request \
            "battle_time=19&stage_id=$stage_id&training_id=$training_id&eagle_eye=pVbxbKr3hc/onYVUAyW0eZ1e8OhUL1mScIHbqmORwm1Hhj4RBYhk2BNUCTAeVh7Lljn4JCyK9ad1R5YQqGj%2B97BIN8m6Y/%2BhK657N5iWY3LqDTQ0oX5U9CgdBQpRQFFCgi61Mzedncw4Uk7tHE6KEpGtknXxHJddqyizv24KDOPItFlyWWUW9KDXOd2rzMd775eP/CLaGWsZoIa5RM0zPi09j9TFkgtXESSiMqBmRCEtgg1/rQfEbLD0KmwdAS9QEH2si1kfZvmLu9nDPE%2BaFvaG0%2BmrUncgQOH2AohLK%2B83Ll6NAMVZm/lm1XzCjYtymZ/tWcusEhTRlAOrj8J0h5aumw2QIIk3ptBj/rILmpge68071SqqMpn%2B2IaHJtnUTglx0D9XMZQFPbe58CfcHsGC6GOby2ILs7OmsArWPthegECMrXxC%2BWM/02ingnItokiR5oOmt%2BrXWc2gR%2BfknRhq6Hwy/H8fOinQ9nDGoR29mGFuOPHmCFln0IPZ3/HI/AcQSaafNaE89X25IK/eZ7r6P4lrWEpxi6sFcqNJpQb3jEW8vIC1blGvRSEBRiIk" \
            "https://msaapi.snkplaymore.info/training/battle_win/"

        echo "[log] Mission Complete: $stage_id...$i"
    done
done
