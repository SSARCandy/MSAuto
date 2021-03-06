#!/bin/bash

source ./utils/send_request.sh

# easy10 =
# hell10 = 1774
stage_id=2390 #hell stage 2

# easy 3
# hard 4
# hell 5
drop_num=5

for ((i = 1; i <= $1; i++));
do
    echo "Start event level=HELL......$i"
    send_request \
        "cover=1&deck_no=12&stage_id=$stage_id&unit_ids[]=604&unit_ids[]=485&unit_ids[]=400&unit_ids[]=425&unit_ids[]=601&unit_ids[]=600&unit_ids[]=606&unit_ids[]=2&unit_ids[]=14&unit_ids[]=598&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50&unit_level[]=50" \
        "https://msattack.snkplaymore.info/event/marathon2nd/battle_start/?kpi1=$stage_id"  > /dev/null

    send_request \
        "stage_id=$stage_id&battle_time=25&drop_num=$drop_num&eagle_eye=z3%2BeCJOXnutccEXfgD1i1HtU4J1CDZbbZC8wRuXuqVlkuiv%2FU%2BK6YLn23p4tnW0Vh1pMzPUIL5mCqVG2mYgrcryLLlRWP0Ii%2F36aFgd8I8Lie5%2FfB9qLUX3YLCu76cDQoXHpRIwi5vXASNN%2FF243rOCO3heOYCV2Hwsp8toKxMhi9SZ6mYf8q%2F7bi2NhqX8hHK%2FKGx0n5aU5HJS2oM3u8GY1tmq7F46WwK2hf8hFZnfiT4aVtlh7J6yX6CkyC%2BfCdTeh2Kyf2lVMSPHHu7DHZG2yvaetI2QQcDmlT3xVAcIYVa83lTCLqnRioTMWp6bD075hlJJ4so3MjzQEXiFnM%2Fn%2F04RSuAkzNFT4KBYozMHsG9bZr2kyqoUTbfxUFioX0qlD6M8nrEI07noOAP%2BgtQfX9stdPq2HwlemsVw14wKe9x3PtQWoN55eEipfN3M9JnyvO7HWrsWC%2F3My5W5Y2%2BAKzOFfOPVVkSo5a5wv1JBkB3evEYsa9b998XRBQku1WzMnF34WhUuzAvSzjdS9F5prq6pfSlM5%2BVBgYRSAfkkjgFQzK6zPM2mcEWKClS3FiFgaKls0mHCgZTOIO5%2FcfrKJxGEGbsMEoEM4QLW41s6lMtM4Gr2%2FPU1TykJxd6KQde9CVmE0KAUUzkvLAGbtzR%2BhDalvoW22D8LKc%2BLUDNM2ZxrEOSFCfD%2BYZEp6G08LNLr0vsOTa4XyuzYXOdnb4QIdFuxbJx1hnCAIcmtxFmUedV5IM4et0%2BpoWt9im6SwL5pUrgHNR1Lxe7meJBeonBSpjoygb0ScDrLqTUKUuZJ7Qxi2JmdZMqpNhkX9BPazP%2B7eTTUnO8yvAvyxrEBvbP%2Bwr5teJajOeoF8eUf%2BipkkDp7mVMiTufk6eQ7MFCor3XUvKix5eiflD2kkyRgbYLhJSOxn3v3ih9u7LYam2vzcB0hwxPh85s3TPbjW5kiIG%2Fgfy7eDOdFzTia%2FSLtrDAqtbZf5KnT7a7S2iwfC%2BsvSU%2Fzx8DUHjhx1sb2OMWS%2BKpMyNdIP9Sn%2BxiFkQ8xKJ2zHNt2BQ8FPqMVqnegkjRRqnUIkMgA7YR3pl6FQxU7aouwO45sH3Zw85KDTF9tH5TZhbVYuauwedvYQ61bPaJkSmD67SV6Wb8WCaH539F%2Fgr5m9NdXE%2BSoJEHSrCgD8JyP79wdoRtwc5HXV%2BWYVNnqQEYcwT%2Fq9oS0b3bGz5yTYOgwziZ3QObYF%2Ba4MwKBvanUih%2FfCH61SPvIf8NMl8g5llK%2FBUtcisyr3sKMsk1fULdCeLn3P%2BZkTjcidTaoPB4H%2FsV0r4K4V0rdqTmZHy%2B2o1iJYqWx5Rh8UQRr9D4qh7IN0ihEsUcnEeyG49w2j6UctlzvEfV3Fl3%2FpRaLtG3Sc4drVH95Ogi%2F4yaeS9Hpf6S43iIyVejI%2F4%2Bl%2FTUrHSK3FDCDG0Qrix4igqbEVHaUUyJ8NGy%2FiU3UuSUCatdMSzQwPs5k68QJ3BLuJ%2BIVTMXQQN1IZtWH3ByaQZw51MTuYKE4VHrcgyk6p1hgTNKNLiH5ObTm7ciU%2F6AVSLQAi1wyVZluiPqVPN5gl474sPfuMykA6792xffCKdqqbDtnG" \
        "https://msattack.snkplaymore.info/event/marathon2nd/battle_win/" > /dev/null

    echo "Win event level=HELL........$i"
done
