'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const cp = require('child_process');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const myHeader = require('./fixtures/header.json');

const stage_id = process.argv[3] || 5638;
let count = parseInt(process.argv[2], 10);
console.log(count, stage_id);

function winOnePile() {
  request({
    method: 'POST',
    url: `https://msattack.snkplaymore.info/event/pile/top`,
    headers: myHeader,
  })
    .pipe(zlib.createGunzip())
    .pipe(bl(function(err, data) {
      data = JSON.parse(data.toString());
      if (data.response.error_code != 0) {
        console.log(`ERROR`);
        return;
      }

      const { pile: { rare_boss, event_point }, user: { stamina } } = data;
      const next_stage_id = !!rare_boss ? rare_boss.rare_boss_stage : stage_id;
      console.log(`next_stage_id: ${next_stage_id}, ${count} rare_boss_stage left. event_point: ${event_point}, stamina: ${stamina}`);
      job(`/bin/bash ./utils/event_pile.sh ${next_stage_id}`);

      if (!!rare_boss) {
        count--;
        if (!Boolean(count)) return;
      }
      
      winOnePile();
    }));
}

winOnePile();

const job = (str, option) => {
  return cp.execSync(str, { cwd: __dirname }).toString();
};
