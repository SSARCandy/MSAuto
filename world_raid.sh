#!/bin/bash

source ./utils/send_request.sh

echo "Raid STANDARD 1-1 and ELITE 1-1"

send_request \
    "cover=0&deck_no=2&stage_id=2&type=0&unit_ids[]=15&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_level[]=50&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0" \
    "https://msattack.snkplaymore.info/world_map/battle_start/?kpi1=0&kpi2=2" > /dev/null

send_request \
    "battle_time=8&drop_num=3&eagle_eye=I8H%2FjeRJ%2FVy1YtYjQIyP%2BrUZQA8JPHwEflLFXVXs3nFN4RfOVmGxS4pMLuqsdjE92NXxE4TAfWj%2BvFYHvRlKOc7ojRkOcUQ1xNbwmPNWyTpeVmRdhoFlZ0k%2BEbgdRsZtXrh3lkbt8uTKY7yOvglel1CGPHMldfHSp2TID4HuzYELMuNp9dCtRbrsF0S3KEaDcaPxTAhLieXPfRg5wgtZoLwIUy4GFd%2F7esv6%2BC9%2BKWEOxXNbH6wKGJRyHvuOj%2FqeTIC0Cl%2BIGNVQjCiZPctzlA55M4qHvLrG%2B4lckZDRPICcuuWFe0ssSFRtFlqo4qGntZovf5A7PHu0viPOAyejh%2B0Oaf%2B%2Bs2AafDhZV%2BOqwSbsVHYzRhQmfG33EMNN6p0ttfGBzSceEdYFSFXO%2B6GJWqaWPk5ns%2FKxuUZIa2eaR%2BMh9jcEyxNb6vnSMg%2Bzme3zik7X0%2F%2B34vQGcc0KLHzCzLcMvzXcQE5E7ixbgKpkxxkOrgIwjTeNmfaDJdh9P%2Fjr5Wb4%2FBCKg6ptmW%2FJwNpbVQ%3D%3D&hawk_eye=z1PLDFEHruBmwDlD8gqJdowIvtyLwrsRhz8CkFVbliZs05K9KgXdnezHGbHf5hEmtL3THw2U8PhUv7g4iIuBfd7ArNzIoqy%2FXHpGKJSR8TTf6r47ZQwsub5wellDorMTLltVulOhAje2pgXBrxsJx7LnPpkrsTDGFBFitwIBjynTa%2Fc2KLkLzJh6P0qcHosTyjvDvDW7H%2BrNgyhHQpPLq8vjX7hRyprO15YbXBN3eyFPAhrZJnjpNwpadcUamImSftmiTMfPLWFGcRHp%2FwRoeQwHNwC2B3plCeCZllfjId5decn0rFvxV9cY3ZBljsNPeiUHmmI%2BFNbAQOwgVwGek29pFCw5oV6Zr%2FCSAqLybSiOP6hBckTtAY2068VBTY5MCXOhE5Y9AuTIHElzaLrUekNcEl3BwIuMAr%2B4mcawjzZZMEIPagWhMUMzevhIM5%2F8rzDjDWmG4xBMoFEgVNUtW8zdbfAZUqO2HeCUQ79%2FyjU5%2Bo0x7TLboTsTyI8KmaElItzX3c9q4DONBoclMIePkQ%3D%3D&stage_id=2&type=0" \
    "https://msattack.snkplaymore.info/world_map/battle_win/?kpi1=0&kpi2=2&kpi3=1&kpi4=1" > /dev/null

send_request \
    "cover=0&deck_no=2&stage_id=140&type=0&unit_ids[]=15&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_level[]=50&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0" \
    "https://msattack.snkplaymore.info/world_map/battle_start/?kpi1=0&kpi2=140" > /dev/null

send_request \
    "battle_time=8&drop_num=4&eagle_eye=LogiRp9SaZ%2B0i6REGSCTLO3HVkyMDiO0bqmxDKZmM9pATy8HshgejDgnOfR%2BYsdxuSQZIe5Qy0u8dLKadsf4FvDV502LjJgLp4u23Fb42qJJYHUaNmd%2BwkT1ilxrrLQ62BIwLIfuZl%2FQMBz%2FGYSuMI2C483h8nneKW3SmsK4sUUBuNirvAbBbFd6SxK7ADac4hxZBS4FBGPbhdxQqPjcW6CcrfcgT5vcj2dkP63DHvCfeq9wTkxO%2BDgRngc%2F%2F9WDUzxrWZG5XAnOcKgUHru3IDXpiVpWkYGhl6YTME6e%2FaXjKWH7qX7q0xPnjY2LSKjeEJEBIwFHr8w88qhYmeQTBUNgap4aM5dNc%2FnKSPQLik%2Bw1YlUF4h66spYjy1hnKNzk1gfO2TT%2FZzQqdJBXvZwGJpsAU%2BGnVaksHoJ0mlxMib8775j7kUYrxZVaMCAwUDWNyL%2FQ44H6CJcC6Dpv7tNEMSynjucRaYy%2B86UL01sKiJm7MfuNvUnOQW9OosccLykUFegd5tlJsf43mGL%2FxutK5P%2FjYLvCHVc5Dqg0mHSR3wiOKTrucCnQX6CCW1qywrgMgU0jQDktSz6gGpjtIZ1sQ%3D%3D&hawk_eye=wdCEUVeSTCwF9dU6WPDyzgdH1Gk1f3yhfHYeewqWJ7UjzPc%2Fpqw%2Btt6%2BlbmgnHnJRlMVobozfqr7o3uclPG%2F%2B2mpG9%2BsKocH4PPBqiFWmVjuz8CLBNy%2Fp4rVdZ8GSNnTzdDfEji1XgvewyTYRlxpXS3bqIfmV5ge6xoittrfW94%2FOB%2Ft0wfBk0chSEfZxBOEDZd0%2BByWDUU81%2Fm33yxGgkG4nBZfdft0D4%2FmrGOC4bnbOj2UQctED%2Bn6SekvMdSKSX8%2BvPP%2F8O8YKz20P6Fmhas6qGbRkTH7%2F%2BXpzxNJqJRWgL%2Boe9FKK8saU%2FX%2B%2B03SVT3K94pcJ4kgEX2GYlO5dXpKis6ydrPGa7wSRJVeSSMxwBSCiBbiQgKByJF2PgfA2bqoCdvfBojOArGfERCIGSve3pUuT%2BXWlAiA7jUKUpm8gf1l5kOEpLz9lCe%2FxHFIOE8B0Jp54lS4P6SeAAjGkSjpEzR8h2bWBKh2cDtbr3PvjlkN8gXaXWWF8g73aUvpM001uc7z5rbBwVTAS0%2BWPHjE%2B48vyKrlwCElbtZa1Z91nmQVcNFargP44Tw6fZQIUC%2BRh8gaJlsBr09TGXbMTQ%3D%3D&stage_id=140&type=0" \
    "https://msattack.snkplaymore.info/world_map/battle_win/?kpi1=0&kpi2=140&kpi3=1&kpi4=1" > /dev/null

