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

function winOnePow() {
  request(getRequestOptions(api.pow.top, {}))
    .pipe(zlib.createGunzip())
    .pipe(bl(function(err, data) {
      data = JSON.parse(data.toString());
      if (data.response.error_code != 0) {
        console.log(`ERROR when ${api.pow.top}`);
        return;
      }

      if (!Boolean(count--)) return;

      job(`/bin/bash utils/pow_start.sh 1`);
      job(`/bin/bash utils/pow_rescue.sh`);
      
      winOnePow();
    }));
}

winOnePow();

const job = (str, option) => {
  return cp.execSync(str, { cwd: __dirname }).toString();
};
