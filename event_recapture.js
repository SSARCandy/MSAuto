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

function winOneRecapture() {
  request({
    method: 'POST',
    url: `https://msattack.snkplaymore.info/event/recapture/top`,
    headers: myHeader,
  })
    .pipe(zlib.createGunzip())
    .pipe(bl(function(err, data) {
      data = JSON.parse(data.toString());
      if (data.response.error_code != 0) {
        console.log(data.response);
        return;
      }

      const { recapture: { point, recapture_stage }, user: { stamina } } = data;
      const next_stage_id = recapture_stage ? recapture_stage[2].stage_id : stage_id;
      console.log(`next_stage_id: ${next_stage_id}, ${count} recapture_stage left. event_point: ${point}, stamina: ${stamina}`);
      job(`/bin/bash ./utils/event_recapture.sh ${next_stage_id}`);

      if (recapture_stage) {
        count--;
      }
      if (count <= 0) return;

      winOneRecapture();
    }));
}

winOneRecapture();

const job = (str, option) => {
  return cp.execSync(str, { cwd: __dirname }).toString();
};
