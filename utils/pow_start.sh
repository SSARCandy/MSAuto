#!/bin/bash

source ./utils/send_request.sh

if [ "$1" == "1" ]; then
    # Start sneak stage by id
    send_request \
        "cover=2&deck_no=2&unit_ids[]=15&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_level[]=50&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0" \
        "https://msattack.snkplaymore.info/pow/battle_start/"

    # Win it!
    send_request \
        "battle_time=59&eagle_eye=pVbxbKr3hc/onYVUAyW0eZ1e8OhUL1mScIHbqmORwm1Hhj4RBYhk2BNUCTAeVh7Lljn4JCyK9ad1R5YQqGj%2B97BIN8m6Y/%2BhK657N5iWY3LqDTQ0oX5U9CgdBQpRQFFCgi61Mzedncw4Uk7tHE6KEpGtknXxHJddqyizv24KDOPItFlyWWUW9KDXOd2rzMd775eP/CLaGWsZoIa5RM0zPi09j9TFkgtXESSiMqBmRCEtgg1/rQfEbLD0KmwdAS9QEH2si1kfZvmLu9nDPE%2BaFvaG0%2BmrUncgQOH2AohLK%2B83Ll6NAMVZm/lm1XzCjYtymZ/tWcusEhTRlAOrj8J0h5aumw2QIIk3ptBj/rILmpge68071SqqMpn%2B2IaHJtnUTglx0D9XMZQFPbe58CfcHsGC6GOby2ILs7OmsArWPthegECMrXxC%2BWM/02ingnItokiR5oOmt%2BrXWc2gR%2BfknRhq6Hwy/H8fOinQ9nDGoR29mGFuOPHmCFln0IPZ3/HI/AcQSaafNaE89X25IK/eZ7r6P4lrWEpxi6sFcqNJpQb3jEW8vIC1blGvRSEBRiIk" \
        "https://msattack.snkplaymore.info/pow/battle_win/"
else
    send_request \
        "" \
        "https://msattack.snkplaymore.info/pow/action/"
fi

