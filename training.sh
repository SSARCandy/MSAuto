#!/bin/bash

# stage_id training_id
#    706       1
#    712       2
#    718       3
#    724       4
#    730       5

echo "[log] ---------- $(date) ----------"
source ./utils/send_request.sh

send_request "" "https://msattack.snkplaymore.info/training/top/"

for training_id in {1..5}
do
    stage_id=$((700 + training_id*6))
    for i in {1..3}
    do
        echo "[log] Start playing: $stage_id...$i"

        # Battle start
        send_request \
            "cover=2&deck_no=2&stage_id=$stage_id&training_id=$training_id&unit_ids[]=15&unit_level[]=50&&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_ids[]=-1&unit_level[]=50&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0&unit_level[]=0" \
            "https://msattack.snkplaymore.info/training/battle_start/"

        # Win it!
        send_request \
            "battle_time=19&stage_id=$stage_id&training_id=$training_id&eagle_eye=hRl9dvenV0Soss0%2FROqw1dX1MmCHStqP5yCD6JNXEAQbesuTydZhXkADHlybUR6UQTkJ96uiM3%2BYy1vRzx4y%2BQxhRG1QBhGNLhu9ZCZH6y%2FC9X6osxXp9skUBWlgOLODoxiRuzsdea4FGRHhT2QOC9LBl2ni%2FSsYq4w%2BeRZQ2g81cbU8ZavaEFbUvrHimgvYfZ9Knw9w1g%2Fex4hIMUNZmCgRL319zIyQB58kFKE5bZb9%2FvapcaGsJFni9HLq6KeVgrxlBFl299RJh08E%2BrKsPaGA6zM6Cc05h%2FKTY4SnA2wwLuRVKZ9wVWqamzuSlFOrG6u7P4ZBQHfvg7NeRuFPRDyWopeQjS1E%2FCLMNLnDKXlyYK6R20po77Cm%2FnEDMYoUAD8Hf5yZOVvJ7QqMXgbLBGxyVFwmP6ZNphKDZ6567NOguKFSTEPBqa96BMGTRrwziE72CG1ta9NylnwkoB2rIvCFlABe7FlS3Z%2F0bwIPLUthYkgvXgOVFV3HDYWFp8Escw4OonlhPih6CYG10NPvY6lGxnK5tLOGctapjzj0ZnvGjx%2FopUXAomBOqPhU%2FSJSObxUZyO%2BVmtIj4WJBJfq1jlSgOyeu3hsYJx6Ljc4uoI1EwmaTTPaxuXvLXvGFWDv2vFCmQ2RQdH3AGHEhEnWczls5O6ZAEmewNZgyBkdG%2FtBFkpCyjz8qxyRk291ut63pPc4vEEBtNYfdcf6Beah6JmcLCl8rbc5OTDvwAggCniDqFapgo6deZfDDWtr0VX3iwiUQD8zhN3iowQlPc2O0p9KcU1IsMZ%2BSlyItKBvEq2E55aO5SZ7XiJfUFMFkiQE5upbbMOX5bU6WydnFvL4%2F4yHvJ0uY8Mt710ZGN7Z0WTuevp17MGD0qwMW7%2Ff0GI9&hawk_eye=rllX7xhebgVkCPIGT4UPyrWWVdcC%2FV5TKFqrFVLI4SjAeKW0eTGMYi2X3jrtCv8%2FQlmwWNZcyqusTdEm0NX4LL6Sj%2Fk9ok04zz%2FY3nkOnwSm8Q7nRIBBjsMgnA4whs04ACRLjFDnE02OqbVyja7u6rPh18WgpsnHNDvX6WjBss%2B1PeeYzFVDahH3EUSQ%2FUEQ%2F13M%2F7GGlxh2mdky8XoabNvdqJRZ69GGtKjbH5JDFmnpMU5dr4lLEX%2B3XKkoQNuKs4s4zQUYX06Z%2FExFXUv%2FSNZyRjd8qDhQrVs%2B7ab8YWdujbjG5bh8lZZrlxn5CY4fNL3Iis%2FhsbzOdDR7mdmKPeEtwffn5TobiZ1fFr55ybjD5ihlj6LlYooG%2BBAbJp10vu0t60yk7RUaShvJ%2BrE6x5bG7rWTPANJPPtLEbTGumyIXLn8wvkZGsH6MXMBmTFhAMS4yBA01CSm91hEBpxMuxw71hEUIj%2BrgOQ19DyEo8w%2Bd5MtbZlpXUcoBfeUAj%2FDhm1FoVYZ9AUSN1EyjTSj%2B%2BqDWMHIlAdrr05kCZHgU4ntVRDhX2TaccPOD7a7TCEqzxLle9Cu6qq9a%2FAnzpnuo7SVTZn2ItokvjlzUcrZo8NdeBbwGqoGkH0nx2cTY6C4%2BgUemz%2BUZLlgsB0dytAMw9U6DiSYMyt2ItjlL7HfWIMHcEJEN9OeVuF8RpG8jN9sZEQFqQPntiw6HPgSsgH7KVU%2BPOBJ0Y7E1S%2FT3y%2BozI5heeiWoupEELSUBYIoFi2%2FCb14fidHxutNkcc8Er6ekb2KaCa7Z6t9oxv3YpBrTfhQitBwVg4RFE%2Fk8P4bIXIpWo%2BoP%2F6sfGUJ4KtGQ8YXLTrOddteKmaGHJrJMDxBINUdFZuuPFqJKwV64Og%2BTOL7" \
            "https://msattack.snkplaymore.info/training/battle_win/"

        echo "[log] Mission Complete: $stage_id...$i"
    done
done
