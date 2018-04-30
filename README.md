# MSAuto

Need to setup config files:
- `fixtures/header.json`
- `utils/send_request.sh`

## Treasure Hunt

```sh
# cronjob
*/10 * * * * /usr/local/bin/node ~/github/MSAuto/treasure.js

# manual
$ node treasure.js
```

## Combat School

```sh
# cronjob
3 3 * * * cd ~/github/MSAuto/ && /bin/bash training.sh > /dev/null

# manual
$ ./training.sh > /dev/null
```

## Sneak

```sh
# cronjob
5,10 3 * * * cd ~/github/MSAuto && /bin/bash ./utils/sneak_reset.sh && /usr/local/bin/node sneak.js 10

# manual
$ ./utils/sneak_reset.sh && node sneak.js 10
```

## MSP Crank
   
```sh
# manual
$ ./msp_crank 100
```

## Free Ad Reward
   
```sh
# cronjob setting
# every 30 minutes
*/30 * * * * /bin/bash ad_movie_grant.sh
```

## Buy Shop Units
> must fill in `want2buy` unit id.

### sneak_shop

```sh
$ node sneak_shop.js

# repeat buy
$ while true; do node sneak_shop.js; sleep .1; done 
```

### 1on1_shop

```sh
$ node 1_on_1_shop.js

# repeat buy
$ while true; do node 1_on_1_shop.js; sleep .1; done 
```

## Events
> must fill `stage_id` and `unit_id`

### event_pile

```sh
$ ./event_pile.sh 10 # raid times
```

### event_marathon

todo...

### event_marathon2nd

todo...
