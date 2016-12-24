# MSAuto

## Auto 

```bash
# cronjob setting

# Auto TREASURE HUNT
*/10 * * * * /usr/local/bin/node ~/github/MSAuto/treasure.js >> msa_log_treasure

# Auto COMBAT SCHOOL
   5 3 * * * /bin/bash ~/github/MSAuto/training.sh >> msa_log_training
```

## Semi-auto

```bash
# Auto P.O.W RESCUE
$ node sneak.js <stages>  # stages: 1~10
```
