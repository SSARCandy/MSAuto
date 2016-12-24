'use strict';

require('console-stamp')(console, 'yyyy/mm/dd HH:MM:ss');
const cp = require('child_process');
const request = require('request-promise');
const zlib = require('zlib');
const bl = require('bl');
const api = require('./msaapi').api;
const getRequestOptions = require('./msaapi').getRequestOptions;

let count = parseInt(process.argv[2], 10);
console.log(count);

function winOneSneak() {
  request(getRequestOptions(api.sneak.top, {}))
    .pipe(zlib.createGunzip())
    .pipe(bl(function(err, data) {
      data = JSON.parse(data.toString());
      if (data.response.error_code != 0) {
        console.log(`ERROR when ${api.sneak.top}`);
        return;
      }

      if (!Boolean(count--)) return;

      const { sneak: { sneak_stage_id } } = data;

      // XDDD
      console.log(`Start, Win and Collecting items for stage: ${sneak_stage_id}`);
      job(`/bin/bash utils/sneak_start.sh ${sneak_stage_id}`);
      console.log(`Mission Complete stage: ${sneak_stage_id}`);
      
      winOneSneak();
    }));
}

winOneSneak();

const job = (str, option) => {
  return cp.execSync(str, { cwd: __dirname }).toString();
};
